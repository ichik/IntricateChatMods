--[[ Edit box]]--
do
	for i =1, 10 do
		local eb =  _G[format("ChatFrame"..i.."EditBox"]
		local cf = _G["ChatFrame"..i]
		eb:ClearAllPoints()
		eb:SetPoint("BOTTOMLEFT",  cf, "TOPLEFT",  -5, 0)
		eb:SetPoint("BOTTOMRIGHT", cf, "TOPRIGHT", 5, 0)
		eb:SetAltArrowKeyMode(false)local a, b, c = select(6, eb:GetRegions())
		a:Hide(); b:Hide(); c:Hide()
		local ebbg = eb:CreateTexture(nil, "BACKGROUND")
		ebbg:SetPoint("BOTTOMRIGHT", -5, 5)
		ebbg:SetPoint("TOPLEFT", 5, -5)
		ebbg:SetTexture(0, 0, 0, 0)
	end
end
