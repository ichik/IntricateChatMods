local eb = ChatFrameEditBox
eb:ClearAllPoints()
eb:SetAltArrowKeyMode(false)
eb:SetPoint("BOTTOMLEFT",  ChatFrame1, "TOPLEFT", -5, 18)
eb:SetPoint("BOTTOMRIGHT", ChatFrame1, "TOPRIGHT", 5, 18)

local a, b, c = select(6, eb:GetRegions())
a:Hide(); b:Hide(); c:Hide()

local ebbg = eb:CreateTexture(nil, "BACKGROUND")
ebbg:SetPoint("BOTTOMRIGHT", -5, 5)
ebbg:SetPoint("TOPLEFT", 5, -5)
ebbg:SetTexture(0, 0, 0, 0)