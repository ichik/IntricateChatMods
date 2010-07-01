--[[ Some extra features i'd like to see in BasicChatMods ]]

local _G = getfenv(0)

--[[ Removing chat background which shows on hovering ]]
_G["DEFAULT_CHATFRAME_ALPHA"] = 0

--Disable Fade
for i = 1, 10 do
    local cf = _G[format("%s%d", "ChatFrame", i)]
    cf:SetFading(false)
end
