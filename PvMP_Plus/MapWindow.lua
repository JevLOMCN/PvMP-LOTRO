MapWindow = class(Turbine.UI.Window)

function MapWindow:Constructor()
	self.scale = 1.6
	local width = 1024 / self.scale
	local height = (768 + 20) / self.scale

	self.min_s = 10
	self.max_s = 22
	self.dif_s = self.max_s - self.min_s
	self.min_w = 8.2
	self.max_w = 24.3
	self.dif_w = self.max_w - self.min_w
	self.heading = 0

	Turbine.UI.Window.Constructor(self)

	self:SetSize(width, height)
	self:SetPosition(data.numbers.mapWin_x, data.numbers.mapWin_y)
	self:SetZOrder(1)
	self:SetWantsKeyEvents(true)
	self:SetMouseVisible(false)

	self.DragBar = DragBar(self, L.DragBar_Map)

	self.map = Turbine.UI.Control()
	self.map:SetParent(self)
	self.map:SetSize(1024, 768)
	self.map:SetBackground(0x41008133)
	self.map:SetStretchMode(1)
	self.map:SetSize(self:GetWidth(), self:GetHeight() - 16)
	self.map:SetTop(20)
	self.map:SetMouseVisible(false)

	self.map_position_arrow = Turbine.UI.Window()
	self.map_position_arrow:SetParent(self.map)
	self.map_position_arrow:SetSize(28, 28)
	self.map_position_arrow:SetBackground(0x41007f4c)
	self.map_position_arrow:SetZOrder(1)
	self.map_position_arrow:SetMouseVisible(false)

	self.map_position_container = Turbine.UI.Control()
	self.map_position_container:SetParent(self)
	self.map_position_container:SetStretchMode(3)
	self.map_position_container:SetSize(155, 31)
	self.map_position_container:SetPosition(
		self:GetWidth() - self.map_position_container:GetWidth() - 25,
		self:GetHeight() - self.map_position_container:GetHeight() - 20
	)

	self.show_own_position_quickslot = Turbine.UI.Lotro.Quickslot()
	self.show_own_position_quickslot:SetParent(self.map_position_container)
	self.show_own_position_quickslot:SetSize(self.map_position_container:GetSize())
	self.show_own_position_quickslot:SetShortcut(Turbine.UI.Lotro.Shortcut(Turbine.UI.Lotro.ShortcutType.Alias, L.Loc_Command))
	self.show_own_position_quickslot:SetAllowDrop(false)

	self.show_own_position_overlay = Turbine.UI.Label()
	self.show_own_position_overlay:SetParent(self.map_position_container)
	self.show_own_position_overlay:SetSize(self.map_position_container:GetSize())
	self.show_own_position_overlay:SetForeColor(Default_Font_Color)
	self.show_own_position_overlay:SetFont(Turbine.UI.Lotro.Font.TrajanPro14)
	self.show_own_position_overlay:SetFontStyle(Turbine.UI.FontStyle.Outline)
	self.show_own_position_overlay:SetBackground(0x4110932c)
	self.show_own_position_overlay:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter)
	self.show_own_position_overlay:SetText(L.Get_Own_Position)
	self.show_own_position_overlay:SetMouseVisible(false)

	-- Layer toggle buttons
	local button_left = self.map_position_container:GetLeft()
	local button_top = self.map_position_container:GetTop()
	local button_step = self.map_position_container:GetHeight() + 5

	self.toggle_teleports_button = self:CreateMapButton(button_left, button_top - 2 * button_step)
	self.toggle_teleports_button.MouseClick = function(sender, args)
		storage.map_teleports_hidden = not storage.map_teleports_hidden
		self:SetTeleportsVisible(not storage.map_teleports_hidden)
	end

	self.toggle_trolls_button = self:CreateMapButton(button_left, button_top - button_step)
	self.toggle_trolls_button.MouseClick = function(sender, args)
		storage.map_trolls_hidden = not storage.map_trolls_hidden
		self:SetTrollsVisible(not storage.map_trolls_hidden)
	end

	self:UpdateToggleButtonText()

	self.keep_list = {}
	self.hotspot_list = {}
	self.port_list = {}
	self.troll_list = {}
	self.enemy_position_list = {}

	local keep_positions = {
		[1] = { ["s"] = 16.6, ["w"] = 17.3 },	-- Tol Ascarnen
		[2] = { ["s"] = 11.7, ["w"] = 15.3 },	-- Isendeep Mine
		[3] = { ["s"] = 17.6, ["w"] = 14.5 },	-- Tirith Rhaw
		[4] = { ["s"] = 15.3, ["w"] = 20.0 },	-- Lugazag
		[5] = { ["s"] = 19.3, ["w"] = 17.5 },	-- Grimwood Lumber Camp
		[6] = { ["s"] = 19.9, ["w"] = 19.3 },	-- Hithlad Outpost
		[7] = { ["s"] = 13.4, ["w"] = 14.6 },	-- Arador's End Outpost
		[8] = { ["s"] = 18.4, ["w"] = 20.1 },	-- River Outpost
		[9] = { ["s"] = 14.5, ["w"] = 16.2 },	-- Isendeep Outpost
		[10] = { ["s"] = 15.9, ["w"] = 15.3 },	-- Forward Camp - Tirith Rhaw
		[11] = { ["s"] = 17.0, ["w"] = 19.8 },	-- Forward Camp - Lugazag
	}

	for index, position in pairs(keep_positions) do
		self.keep_list[index] = Turbine.UI.Control()
		self.keep_list[index]:SetParent(self.map)
		self.keep_list[index]:SetSize(32, 32)
		self.keep_list[index]:SetStretchMode(1)
		self.keep_list[index]:SetPosition(
			(self.map:GetWidth() - self.map:GetWidth() * (position.w - self.min_w) / self.dif_w -
				self.scale * self.keep_list[index]:GetWidth() / 2),
			(self.map:GetHeight() * (position.s - self.min_s) / self.dif_s - self.scale * self.keep_list[index]:GetHeight() / 2)
		)
		self.keep_list[index]:SetMouseVisible(false)
	end

	local hotspot_positions = {
		[1] = { ["s"] = 12.2, ["w"] = 20.9 },	-- Gramsfoot
		[2] = { ["s"] = 20.7, ["w"] = 13.6 },	-- Glân Vraig
		[3] = { ["s"] = 17.0, ["w"] = 22.4 },	-- Dâr-gazag
		[4] = { ["s"] = 17.8, ["w"] = 16.0 },	-- Elf Camp
		[5] = { ["s"] = 19.8, ["w"] = 20.0 },	-- Hoarhallow
		[6] = { ["s"] = 13.0, ["w"] = 12.7 },	-- Grothum
		[7] = { ["s"] = 17.0, ["w"] = 18.6 },	-- Orc Camp
		[8] = { ["s"] = 16.0, ["w"] = 12.2 }	-- Ost Ringdyr
	}

	for index, position in pairs(hotspot_positions) do
		self.hotspot_list[index] = Turbine.UI.Control()
		self.hotspot_list[index]:SetParent(self.map)
		self.hotspot_list[index]:SetSize(30, 30)
		self.hotspot_list[index]:SetStretchMode(1)
		self.hotspot_list[index]:SetPosition(
			(self.map:GetWidth() - self.map:GetWidth() * (position.w - self.min_w) / self.dif_w -
				self.scale * self.hotspot_list[index]:GetWidth() / 2),
			(self.map:GetHeight() * (position.s - self.min_s) / self.dif_s - self.scale * self.hotspot_list[index]:GetHeight() / 2)
		)
		self.hotspot_list[index]:SetMouseVisible(false)
	end

	-- Troll spawn points.
	local troll_spawn_positions = {
		[1] = { ["s"] = 12.7, ["w"] = 19.4 },
		[2] = { ["s"] = 14.1, ["w"] = 15.5 },
		[3] = { ["s"] = 15.0, ["w"] = 14.3 },
		[4] = { ["s"] = 15.2, ["w"] = 14.5 },
		[5] = { ["s"] = 15.2, ["w"] = 14.2 },
		[6] = { ["s"] = 18.2, ["w"] = 19.8 },
		[7] = { ["s"] = 17.8, ["w"] = 19.4 },
		[8] = { ["s"] = 17.5, ["w"] = 19.0 },
		[9] = { ["s"] = 17.4, ["w"] = 18.6 },
		[10] = { ["s"] = 17.4, ["w"] = 18.5 },
		[11] = { ["s"] = 19.4, ["w"] = 15.7 },
		[12] = { ["s"] = 19.5, ["w"] = 16.1 },
		[13] = { ["s"] = 20.7, ["w"] = 17.5 },
		[14] = { ["s"] = 21.0, ["w"] = 19.5 },
		[15] = { ["s"] = 20.9, ["w"] = 20.0 },
		[16] = { ["s"] = 20.1, ["w"] = 21.5 },
		[17] = { ["s"] = 19.9, ["w"] = 21.4 },
		[18] = { ["s"] = 18.2, ["w"] = 22.3 },
		[19] = { ["s"] = 18.3, ["w"] = 22.4 },
		[20] = { ["s"] = 18.4, ["w"] = 23.3 },
	}

	for index, position in pairs(troll_spawn_positions) do
		self:AddTrollMarker(index, position)
	end

	local creep_port_positions = {
		[1] = { ["skill"] = 0x70028BBC, ["s"] = 12.35, ["w"] = 20.89 },		-- Gramsfoot
		[2] = { ["skill"] = 0x70028BB7, ["s"] = 16.12, ["w"] = 20.93 },		-- Crude Lugazag
		[3] = { ["skill"] = 0x70028BB6, ["s"] = 17.09, ["w"] = 18.63 },		-- Crude Tol Ascarnen
		[4] = { ["skill"] = 0x70028BBE, ["s"] = 14.63, ["w"] = 15.78 },		-- Crude Tirith Rhaw
		[5] = { ["skill"] = 0x70028BB3, ["s"] = 13.39, ["w"] = 12.79 },		-- Crude Isendeep Mine
		[6] = { ["skill"] = 0x70028BBF, ["s"] = 18.34, ["w"] = 18.55 },		-- Crude Grimwood Lumber Camp
		[7] = { ["skill"] = 0x70028BB2, ["s"] = 14.15, ["w"] = 20.96 },		-- Poor Lugazag
		[8] = { ["skill"] = 0x70028BB1, ["s"] = 15.96, ["w"] = 17.04 },		-- Poor Tol Ascarnen
		[9] = { ["skill"] = 0x70028BB4, ["s"] = 15.70, ["w"] = 14.22 },		-- Poor Tirith Rhaw
		[10] = { ["skill"] = 0x70028BAF, ["s"] = 14.69, ["w"] = 14.51 },	-- Poor Isendeep Mine
		[11] = { ["skill"] = 0x70028BB9, ["s"] = 18.85, ["w"] = 17.95 },	-- Poor Grimwood Lumber Camp
		[12] = { ["skill"] = 0x70028BB5, ["s"] = 14.54, ["w"] = 19.07 },	-- Good Lugazag
		[13] = { ["skill"] = 0x70028BC2, ["s"] = 17.93, ["w"] = 18.12 },	-- Good Tol Ascarnen
		[14] = { ["skill"] = 0x70028BB0, ["s"] = 17.85, ["w"] = 15.33 },	-- Good Tirith Rhaw
		[15] = { ["skill"] = 0x70028BC0, ["s"] = 11.52, ["w"] = 19.10 },	-- Good Isendeep Mine
		[16] = { ["skill"] = 0x70028BBD, ["s"] = 20.35, ["w"] = 16.83 }		-- Good Grimwood Lumber Camp
	}

	local troll_port_positions = {
		[1] = { ["skill"] = 0x7002A7B9, ["s"] = 12.35, ["w"] = 20.89 },		-- Gramsfoot
		[2] = { ["skill"] = 0x7002A7B6, ["s"] = 14.54, ["w"] = 19.07 },		-- Good Lugazag
		[3] = { ["skill"] = 0x7002A7B4, ["s"] = 17.93, ["w"] = 18.12 },		-- Good Tol Ascarnen
		[4] = { ["skill"] = 0x7002A7B5, ["s"] = 17.85, ["w"] = 15.33 },		-- Good Tirith Rhaw
		[5] = { ["skill"] = 0x7002A7B7, ["s"] = 11.52, ["w"] = 19.10 },		-- Good Isendeep Mine
		[6] = { ["skill"] = 0x7002A7B3, ["s"] = 20.35, ["w"] = 16.83 }		-- Good Grimwood Lumber Camp
	}

	local freep_port_positions = {
		[1] = { ["skill"] = 0x7005B38E, ["s"] = 20.77, ["w"] = 13.38 }		-- Glân Vraig
	}

	local ranger_port_positions = {
		[1] = { ["skill"] = 0x7002A7B8, ["s"] = 20.77, ["w"] = 13.38 },		-- Glân Vraig
		[2] = { ["skill"] = 0x7002A7B6, ["s"] = 14.54, ["w"] = 19.07 },		-- Good Lugazag
		[3] = { ["skill"] = 0x7002A7B4, ["s"] = 17.93, ["w"] = 18.12 },		-- Good Tol Ascarnen
		[4] = { ["skill"] = 0x7002A7B5, ["s"] = 17.85, ["w"] = 15.33 },		-- Good Tirith Rhaw
		[5] = { ["skill"] = 0x7002A7B7, ["s"] = 11.52, ["w"] = 19.10 },		-- Good Isendeep Mine
		[6] = { ["skill"] = 0x7002A7B3, ["s"] = 20.35, ["w"] = 16.83 }		-- Good Grimwood Lumber Camp
	}

	if (Turbine.Gameplay.LocalPlayer.GetInstance():GetAlignment() == Turbine.Gameplay.Alignment.MonsterPlayer) then
		for index, map in pairs(creep_port_positions) do
			self:AddMapQuickslots(index, map)
		end
	elseif (Turbine.Gameplay.LocalPlayer.GetInstance():GetAlignment() ~= Turbine.Gameplay.Alignment.MonsterPlayer) then
		if (Turbine.Gameplay.LocalPlayer:GetInstance():GetClass() == 190) then
			for index, map in pairs(troll_port_positions) do
				self:AddMapQuickslots(index, map)
			end
		elseif (Turbine.Gameplay.LocalPlayer:GetInstance():GetClass() == 191) then
			for index, map in pairs(ranger_port_positions) do
				self:AddMapQuickslots(index, map)
			end
		elseif (Turbine.Gameplay.LocalPlayer:GetInstance():GetClass() == 192) then
			return
		else
			for index, map in pairs(freep_port_positions) do
				self:AddMapQuickslots(index, map)
			end
		end
	end

	self.KeyDown = function(sender, args)
		if args.Action == Turbine.UI.Lotro.Action.Escape then
			self:SetVisible(false)
			SecondaryWindow.map_button:SetText(L.Map_Show)
		end
	end

	self.VisibleChanged = function(sender)
		if self:IsVisible() then
			self:ResizeIcons()
		end
	end

	self.PositionChanged = function(sender, args)
		data.numbers.mapWin_x = self:GetLeft()
		data.numbers.mapWin_y = self:GetTop()
	end
end

function MapWindow:UpdateKeepsOnMap()
	for index, keep in pairs(self.keep_list) do
		keep:SetBackground(Enemy_Keep_Icon)
	end
	for i = 1, Buff_List:GetCount() do
		local element = Buff_List:Get(i):GetName()
		if SetContains(Towers, element) then
			self.keep_list[Towers[element]]:SetBackground(Aligned_Keep_Icon)
		end
	end
	for index, hotspot in pairs(self.hotspot_list) do
		hotspot:SetBackground(0x41005e5e)
	end
end

function MapWindow:ResizeIcons()
	for player, control in pairs(MapWindow.enemy_position_list) do
		control:SetSize(control:GetWidth() * self.scale + 2, control:GetHeight() * self.scale + 2)
	end
	for index, keep in pairs(self.keep_list) do
		keep:SetSize(32 * self.scale + 2, 32 * self.scale + 2)
	end
	for index, hotspot in pairs(self.hotspot_list) do
		hotspot:SetSize(30 * self.scale + 2, 30 * self.scale + 2)
	end
	for index, port in pairs(self.port_list) do
		port:SetSize(port:GetWidth() * self.scale + 2, port:GetHeight() * self.scale + 3)
	end
	for index, troll in pairs(self.troll_list) do
		troll:SetSize(24 * self.scale + 2, 24 * self.scale + 2)
	end
	self.map_position_arrow:SetSize(28 * self.scale, 28 * self.scale)
	self.map_position_arrow:SetVisible(true)
	self.map_position_arrow:SetRotation({ x = 0, y = 0, z = 0 - (self.heading - 90) })
	self.map_position_arrow:SetVisible(Current_Position_Counter ~= 0)
end

function MapWindow:AddMapQuickslots(index, map)
	self.port_list[index] = Turbine.UI.Control()
	self.port_list[index]:SetParent(self.map)

	local port_quickslot = Turbine.UI.Lotro.Quickslot()
	port_quickslot:SetParent(self.port_list[index])
	port_quickslot:SetSize(self.port_list[index]:GetSize())
	port_quickslot:SetShortcut(Turbine.UI.Lotro.Shortcut(Turbine.UI.Lotro.ShortcutType.Skill, string.format("0x%x", map.skill)))
	port_quickslot:SetAllowDrop(false)

		self.port_list[index]:SetSize(35, 35)
		self.port_list[index]:SetStretchMode(1)
		self.port_list[index]:SetPosition(
			(self.map:GetWidth() - self.map:GetWidth() * (map.w - self.min_w) / self.dif_w -
				self.scale * self.port_list[index]:GetWidth() / 2),
			(self.map:GetHeight() * (map.s - self.min_s) / self.dif_s - self.scale * self.port_list[index]:GetHeight() / 2)
		)

	port_quickslot.MouseUp = function(sender, args)
		if args.Button == Turbine.UI.MouseButton.Left or args.Button == Turbine.UI.MouseButton.Right then
			self:SetVisible(false)
			SecondaryWindow.map_button:SetText(L.Map_Show)
		end
	end

	self.port_list[index]:SetVisible(not storage.map_teleports_hidden)
end

function MapWindow:AddTrollMarker(index, position)
	local marker = Turbine.UI.Control()
	marker:SetParent(self.map)
	marker:SetSize(24, 24)
	marker:SetStretchMode(1)
	marker:SetBackground("PvMP_Plus/Resources/MapIcons/troll.tga")
	marker:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend)
	marker:SetMouseVisible(false)
	marker:SetPosition(
		(self.map:GetWidth() - self.map:GetWidth() * (position.w - self.min_w) / self.dif_w -
			self.scale * marker:GetWidth() / 2),
		(self.map:GetHeight() * (position.s - self.min_s) / self.dif_s - self.scale * marker:GetHeight() / 2)
	)
	marker:SetVisible(not storage.map_trolls_hidden)
	self.troll_list[index] = marker
end

function MapWindow:CreateMapButton(left, top)
	local button = Turbine.UI.Control()
	button:SetParent(self)
	button:SetStretchMode(3)
	button:SetSize(155, 31)
	button:SetPosition(left, top)

	button.overlay = Turbine.UI.Label()
	button.overlay:SetParent(button)
	button.overlay:SetSize(button:GetSize())
	button.overlay:SetForeColor(Default_Font_Color)
	button.overlay:SetFont(Turbine.UI.Lotro.Font.TrajanPro14)
	button.overlay:SetFontStyle(Turbine.UI.FontStyle.Outline)
	button.overlay:SetBackground(0x4110932c)
	button.overlay:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter)
	button.overlay:SetMouseVisible(false)

	return button
end

function MapWindow:UpdateToggleButtonText()
	if storage.map_teleports_hidden then
		self.toggle_teleports_button.overlay:SetText(L.Map_Show_Teleports)
	else
		self.toggle_teleports_button.overlay:SetText(L.Map_Hide_Teleports)
	end
	if storage.map_trolls_hidden then
		self.toggle_trolls_button.overlay:SetText(L.Map_Show_Trolls)
	else
		self.toggle_trolls_button.overlay:SetText(L.Map_Hide_Trolls)
	end
end

function MapWindow:SetTeleportsVisible(visible)
	for index, port in pairs(self.port_list) do
		port:SetVisible(visible)
	end
	self:UpdateToggleButtonText()
end

function MapWindow:SetTrollsVisible(visible)
	for index, troll in pairs(self.troll_list) do
		troll:SetVisible(visible)
	end
	self:UpdateToggleButtonText()
end

function MapWindow:MoveCurrentPosition(west, south, heading)
	self.heading = heading
	if self:IsVisible() then
		self.map_position_arrow:SetVisible(true)
		self.map_position_arrow:SetRotation({ x = 0, y = 0, z = 0 - (self.heading - 90) })
	end
	self.map_position_arrow:SetPosition(
		self.map:GetWidth() - self.map:GetWidth() * (west - self.min_w) / self.dif_w -
		self.scale * self.map_position_arrow:GetWidth() / 2,
		self.map:GetHeight() * (south - self.min_s) / self.dif_s - self.scale * self.map_position_arrow:GetHeight() / 2
	)
	Current_Position_Counter = 20 -- In seconds how long icon is shown
end

function MapWindow:AddEnemyPosition(w, s, amount, player)
	local map_callout = player .. ": " .. amount .. " " .. (amount == "1" and L.FreepCreep or L.FreepsCreeps)
	if self.enemy_position_list[player] ~= nil then
		self.enemy_position_list[player]:SetPosition(
			(self.map:GetWidth() - self.map:GetWidth() * (w - self.min_w) / self.dif_w -
				self.scale * self.enemy_position_list[player]:GetWidth() / 2),
			(self.map:GetHeight() * (s - self.min_s) / self.dif_s - self.scale * (self.enemy_position_list[player]:GetHeight() - 9))
		)
		self.enemy_position_list[player].Timer = Enemy_Position_Counter
		self.enemy_position_list[player]:SetText(map_callout)
		self.enemy_position_list[player]:SetVisible(true)
		return
	end

	local enemy_position_overlay = Turbine.UI.Label()
	enemy_position_overlay:SetParent(self.map)
	enemy_position_overlay:SetSize(151, 29)
	enemy_position_overlay:SetStretchMode(1)
	enemy_position_overlay:SetSize(151 * self.scale + 2, 29 * self.scale + 2)
	enemy_position_overlay:SetFont(Turbine.UI.Lotro.Font.Arial12)
	enemy_position_overlay:SetForeColor(Turbine.UI.Color.Black)
	enemy_position_overlay:SetFontStyle(Turbine.UI.FontStyle.Outline)
	enemy_position_overlay:SetOutlineColor(Turbine.UI.Color.White)
	enemy_position_overlay:SetTextAlignment(Turbine.UI.ContentAlignment.TopCenter)
	enemy_position_overlay:SetText(map_callout)
	enemy_position_overlay:SetBackground("PvMP_Plus/Resources/MapIcons/enemy_position_overlay.tga")
	enemy_position_overlay:SetMouseVisible(false)
	enemy_position_overlay:SetPosition(
		(self.map:GetWidth() - self.map:GetWidth() * (w - self.min_w) / self.dif_w -
			self.scale * math.ceil(enemy_position_overlay:GetWidth() / 2)),
		(self.map:GetHeight() * (s - self.min_s) / self.dif_s - self.scale * (enemy_position_overlay:GetHeight() - 9))
	)
	enemy_position_overlay.Timer = Enemy_Position_Counter
	self.enemy_position_list[player] = enemy_position_overlay
end