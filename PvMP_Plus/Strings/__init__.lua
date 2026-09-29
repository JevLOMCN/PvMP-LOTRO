Turbine.Language.Russian = 268435463

Turbine.Engine._GetLanguage = Turbine.Engine.GetLanguage
function Turbine.Engine.GetLanguage()
    local language = Turbine.Engine._GetLanguage()
    local russianAlphabet = "АаБбВвГгДдЕеЁёЖжЗзИиЙйКкЛлМмНнОоПпРрСсТтУуФфХхЦцЧчШшЩщЪъЫыЬьЭэЮюЯя"
    local skillName = Turbine.Gameplay.LocalPlayer:GetInstance():GetTrainedSkills():GetItem(1):GetSkillInfo():GetName()
    if russianAlphabet:match(skillName:sub(1, 2)) then
        return Turbine.Language.Russian
    else
        return language
    end
end

if Turbine.Engine:GetLanguage() == Turbine.Language.English or Turbine.Engine:GetLanguage() == Turbine.Language.EnglishGB then
    _G.locale = "en"
elseif Turbine.Engine:GetLanguage() == Turbine.Language.German then
	_G.locale = "de"
elseif Turbine.Engine:GetLanguage() == Turbine.Language.French then
	_G.locale = "fr"
elseif Turbine.Engine:GetLanguage() == Turbine.Language.Russian then
	_G.locale = "ru"
    SetCyrillicEnabled(true)
end

import("PvMP_Plus.Strings." .. locale)