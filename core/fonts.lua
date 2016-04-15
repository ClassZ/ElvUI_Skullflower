-- Thanks Tohr!
tFont = CreateFrame("Frame", "tFont");
 
local T_FONT_NUMBER = "Interface\\AddOns\\ElvUI_Skullflower\\media\\fonts\\Expressway.ttf";
local T_FONT_NAME = "Interface\\AddOns\\ElvUI_Skullflower\\media\\fonts\\Expressway.ttf";
 
function tFont:ApplySystemFonts()
 
DAMAGE_TEXT_FONT = T_FONT_NUMBER;
UNIT_NAME_FONT = T_FONT_NAME;
 
end
 
tFont:SetScript("OnEvent",
                    function()
                       if (event == "ADDON_LOADED") then
                          tFont:ApplySystemFonts()
                       end
                    end);
tFont:RegisterEvent("ADDON_LOADED");
 
tFont:ApplySystemFonts()