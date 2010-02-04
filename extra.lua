--[[ Some extra features i'd like to see in BasicChatMods ]]

local _G = getfenv(0)

--[[ Removing chat background which shows on hovering ]]
_G["DEFAULT_CHATFRAME_ALPHA"] = 0

--[[ TellTarget function ]]
local TellTarget = function(s)
    if(UnitExists("target") and UnitName("target") and UnitIsPlayer("target") and GetDefaultLanguage("player")==GetDefaultLanguage("target") and s)then
        local name, realm = UnitName("target")
        if realm and realm~=GetRealmName() then
            name = format("%s-%s", name, realm)
        end
        SendChatMessage(s, "WHISPER", nil, name)
    end
end

SlashCmdList["TELLTARGET"] = TellTarget
SLASH_TELLTARGET1 = "/tt"

--Disable Fade
for i = 1, 7 do
    local cf = getglobal('ChatFrame'..i)    
    cf:SetFading(false)
end