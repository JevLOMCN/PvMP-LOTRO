import "PvMP_Plus"

LoadData()

InitWindowPoints = InitWindowPoints()
InitWindowFrags = InitWindowFrags()
OverviewWindow = OverviewWindow()
SecondaryWindow = SecondaryWindow()
RecentHitsWindow = RecentHitsWindow()
StatsWindow = StatsWindow()
OverviewSettingsPanel = Overview_Settings()
AlertWindow = AlertWindow()
BattleTaskWindow = BattleTaskWindow()
Settings = Settings()
ResetWindow = ResetWindow()
MapWindow = MapWindow()

if Data_Loaded then
	OverviewWindow.panel:SetVisible(not storage.minimized)
	SecondaryWindow:SetVisible((not storage.minimized) and (not storage.secondaryMinimized))
	RecentHitsWindow:SetVisible((not storage.minimized) and (not storage.show_recent_hits_disabled) and (not storage.show_recent_hits_disabled))
	OverviewWindow:SetVisible(true)
	OverviewSettingsPanel:SetVisible(true)
else
	InitWindowFrags:Open()
	InitWindowPoints:Open()
end

-- Options in Plugin Window
plugin.GetOptionsPanel = function(self)
	local opt_panel = Turbine.UI.Control()
	opt_panel:SetHeight(100)

	local open_settings = Turbine.UI.Lotro.Button()
	open_settings:SetText(L.Options_Open_Settings)
	open_settings:SetPosition(15, 15)
	open_settings:SetWidth(185)
	open_settings:SetParent(opt_panel)
	open_settings.MouseClick = function()
		Settings:Open()
	end

	local open_points = Turbine.UI.Lotro.Button()
	open_points:SetText(L.Options_Update_Points)
	open_points:SetPosition(15, open_settings:GetTop() + 30)
	open_points:SetWidth(185)
	open_points:SetParent(opt_panel)
	open_points.MouseClick = function()
		InitWindowPoints:Open()
	end

	local open_frags = Turbine.UI.Lotro.Button()
	open_frags:SetText(L.Options_Update_Frags)
	open_frags:SetPosition(15, open_points:GetTop() + 30)
	open_frags:SetWidth(185)
	open_frags:SetParent(opt_panel)
	open_frags.MouseClick = function()
		InitWindowFrags:Open()
	end

	return opt_panel
end

-- Register chat commands
PvMP_Plus_Command = Turbine.ShellCommand()
Turbine.Shell.AddCommand("pvmp+", PvMP_Plus_Command)
function PvMP_Plus_Command:GetShortHelp()
	return L.Command_Help
end

function PvMP_Plus_Command:GetHelp()
	return self:GetShortHelp()
end

function PvMP_Plus_Command:Execute(cmd, args)
	if (args == L.Command_Settings) then
		Settings:Open()
	elseif (args == L.Command_Map) then
		MapWindow:SetVisible(not MapWindow:IsVisible())
		if MapWindow:IsVisible() then
			SecondaryWindow.map_button:SetText(L.Map_Hide)
		else
			SecondaryWindow.map_button:SetText(L.Map_Show)
		end
	else
		Turbine.Shell.WriteLine(self:GetShortHelp())
	end
end

Reloader = class(Turbine.UI.Control)
function Reloader:Constructor()
    Turbine.UI.Control.Constructor(self)
    self:SetWantsUpdates(true)
    self.reloaded = false
    self.Update = function()
        if self.reloaded then
            self:SetWantsUpdates(false)
        elseif not(self.reloaded) then
            Turbine.PluginManager.UnloadScriptState("PvMP+Reloader") -- Apartment
			Turbine.PluginManager.RefreshAvailablePlugins()
            self.reloaded = true
            self:SetParent(nil)
        end
    end
end

function ReloadPlugin()
    Turbine.PluginManager.LoadPlugin("PvMP+ Reloader") -- Name
end

local reload = Reloader()

Plugins["PvMP+"].Load = function(sender, args)
	if locale == "en" then
		Turbine.Shell.WriteLine(sender:GetName() .. " v"..sender:GetVersion() .. " by " .. sender:GetAuthor())
	elseif locale == "de" then
		Turbine.Shell.WriteLine(sender:GetName() .. " v"..sender:GetVersion() .. " von " .. sender:GetAuthor() .. " (Deutsche Übersetzung von RenthoMar)")
	elseif locale == "fr" then
		Turbine.Shell.WriteLine(sender:GetName() .. " v"..sender:GetVersion() .. " par " .. sender:GetAuthor())
	elseif locale == "ru" then
		Turbine.Shell.WriteLine(sender:GetName() .. " v"..sender:GetVersion() .. " от " .. sender:GetAuthor())
	end
end