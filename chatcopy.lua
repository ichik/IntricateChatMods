local ButtonPoint = { "BOTTOMLEFT" , UIParent, "BOTTOMLEFT", 12, 12 }             -- More info: http://www.wowwiki.com/API_Region_SetPoint
local EditBoxPoint = { "LEFT", UIParent, "LEFT", 4, 0 }    -- Cope frame placement. More info: http://www.wowwiki.com/API_Region_SetPoint
local ButtonSize = 24
local ButtonText = "|cffC79C6E+|r"

--[[ Don't touch aything below this line plx ]]
local lines = {}
local frame, editBox, f

local function createFrames()
    frame = CreateFrame("Frame", "BCMCopyFrame", UIParent)
    frame:SetBackdrop({bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = {left = 3, right = 3, top = 5, bottom = 3}})
    frame:SetBackdropColor(0,0,0,1)
    frame:SetWidth(500)
    frame:SetHeight(400)
    frame:SetPoint(unpack(EditBoxPoint))
    frame:SetFrameStrata("DIALOG")
    frame:Hide()

    local scrollArea = CreateFrame("ScrollFrame", "BCMCopyScroll", frame, "UIPanelScrollFrameTemplate")
    scrollArea:SetPoint("TOPLEFT", frame, "TOPLEFT", 8, -30)
    scrollArea:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -30, 8)

    editBox = CreateFrame("EditBox", "BCMCopyBox", frame)
    editBox:SetMultiLine(true)
    editBox:SetMaxLetters(20000)
    editBox:EnableMouse(true)
    editBox:SetAutoFocus(true)
    editBox:SetFontObject(ChatFontNormal)
    editBox:SetWidth(450)
    editBox:SetHeight(270)
    editBox:SetScript("OnEscapePressed", function() frame:Hide() end)

    scrollArea:SetScrollChild(editBox)

    local close = CreateFrame("Button", "BCMCloseButton", frame, "UIPanelCloseButton")
    close:SetPoint("TOPRIGHT", frame, "TOPRIGHT")

    f = true
end

local function GetLines(...)
    local ct = 1
    for i = select("#", ...), 1, -1 do
        local region = select(i, ...)
        if(region:GetObjectType()=="FontString") then
            lines[ct] = tostring(region:GetText())
            ct = ct + 1
        end
    end
    return ct - 1
end

local function Copy(cf)
    local _, size = cf:GetFont()
    FCF_SetChatWindowFontSize(cf, cf, 0.01)
    local lineCt = GetLines(cf:GetRegions())
    local text = table.concat(lines, "\n", 1, lineCt)
    FCF_SetChatWindowFontSize(cf, cf, size)
    if not f then createFrames() end
    frame:Show()
    editBox:SetText(text)
end

for i = 1, 10 do
    local cf = _G[format("%s%d", "ChatFrame", i)]
    local button = CreateFrame("Button", "BCMButtonCF"..i, cf)
    button:SetPoint(unpack(ButtonPoint))
    button:SetHeight(ButtonSize)
    button:SetWidth(ButtonSize)
    button:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")
    button:SetScript("OnClick", function() Copy(cf) end)

    local t = button:CreateFontString(nil, "OVERLAY")
    t:SetFont("Fonts\\FRIZQT__.TTF", ButtonSize, "OUTLINE")
    t:SetPoint("CENTER", 0, 1)
    t:SetJustifyH("CENTER")
    t:SetJustifyV("CENTER")
    t:SetText(ButtonText)
    
    button:SetAlpha(0)
    local tab = _G[format("%s%d", "ChatFrame", i, "Tab")]
    tab:HookScript("OnShow", function() button:SetAlpha(1) end)
    tab:HookScript("OnHide", function() button:SetAlpha(0) end)
end
