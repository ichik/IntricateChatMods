local origSetItemRef = SetItemRef
SetItemRef = function(link, text, button)
	local linkType = string.sub(link, 1, 6)
	local name = string.match(link, "player:([^:]+)")
	if IsAltKeyDown() and linkType == "player" then
		InviteUnit(name)
		return nil
	end
	return origSetItemRef(link,text,button)
end