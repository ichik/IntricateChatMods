--[[ TellTarget function credits to Nightcracker]]
local function telltarget(msg)
	local unitname, realm
	unitname, realm = UnitName("target")
	if unitname then unitname = gsub(unitname, " ", "") end
	if unitname and not UnitIsSameServer("player", "target") then
		unitname = unitname .. "-" .. gsub(realm, " ", "")
	end
	if msg then
		if unitname then
			SendChatMessage(msg, "WHISPER", nil, unitname)
		else
			print("You're not targeting a valid player.", 1, 1, 0)
		end
	else
		ChatFrame_SendTell((unitname or "Invalid Target"), ChatFrame1)
	end
end

ChatFrameEditBox:HookScript("OnTextChanged", function(self)
	local text = self:GetText()
	if text:len() < 5 then
		if text:sub(1, 4) == "/tt " then
			telltarget()
		end
	end
end)

SLASH_TELLTARGET1 = "/tt"
SlashCmdList.TELLTARGET = telltarget