function altinvite(self, ...)
	local linkType, name = strmatch(tostring((...)), '(.*):(.*):.*');
        if _G.IsAltKeyDown() and linkType == "player" then
			InviteUnit(name)
			ChatFrameEditBox:Hide()
		end
end
for i= 1,7 do
    _G['ChatFrame'..i]:HookScript("OnHyperlinkClick",altinvite)
end