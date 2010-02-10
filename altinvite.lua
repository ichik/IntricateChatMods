 function altinvite(self, linkData, link, button)
	local linkType = string.sub(link, 3, 8)
    if _G.IsAltKeyDown() and linkType == "player" then
		--some debugging to check what's actually happening, i'm not sure what actually OnHyperLinkClick provides
		self:AddMessage(format("%s",linkType))
		InviteUnit(string.sub(linkData,8,-6))
	end
end
for i= 1,7 do
    local frame = _G['ChatFrame'..i]
    frame:HookScript("OnHyperlinkClick",altinvite)
end