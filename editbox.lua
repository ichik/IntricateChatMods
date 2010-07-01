--[[ Edit box]]--
local ebParts = {'Left', 'Mid', 'Right'}
for i =1, 10 do
	local eb =  _G["ChatFrame"..i.."EditBox"]
	local cf = _G[format("%s%d", "ChatFrame", i)]
	eb:ClearAllPoints()
	eb:SetPoint("BOTTOMLEFT",  cf, "TOPLEFT",  -5, 15)
	eb:SetPoint("BOTTOMRIGHT", cf, "TOPRIGHT", 5, 15)
	eb:SetAltArrowKeyMode(false)
	for _, ebPart in ipairs(ebParts) do
		_G['ChatFrame'..i..'EditBox'..ebPart]:SetTexture(nil)
		_G['ChatFrame'..i..'EditBoxFocus'..ebPart]:SetTexture(nil)
	end
end
