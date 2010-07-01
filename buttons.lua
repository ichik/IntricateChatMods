--[[ Buttons ]]--

local function Hide(f)
	f:SetScript('OnShow', f.Hide)
	f:Hide()
end

local function UpdateBottomButton(frame)
	if frame:AtBottom() and frame.BottomButton:IsVisible() then
		frame.BottomButton:Hide()
		UIFrameFlashRemoveFrame(frame.BottomButtonFlash)
	elseif not frame:AtBottom() and not frame.BottomButton:IsVisible() then
		frame.BottomButton:ClearAllPoints()
 		frame.BottomButton:SetPoint('TOPRIGHT', frame, 'TOPRIGHT', 0, 0)
		frame.BottomButton:Show()
		UIFrameFlash(frame.BottomButtonFlash, 0, 0, -1, false, CHAT_BUTTON_FLASH_TIME, CHAT_BUTTON_FLASH_TIME)
	end   
end

local function OnMouseWheel(frame, value)
	if(value > 0) then
		if(IsShiftKeyDown()) then
            frame:ScrollToTop()
        else
            frame:ScrollUp()
        end
	elseif(value < 0) then
		if(IsShiftKeyDown()) then
            frame:ScrollToBottom()
        else
            frame:ScrollDown()
        end
	end
	UpdateBottomButton(frame)
end

local function OnClick(button)
	UpdateBottomButton(button:GetParent())
end

for i= 1,10 do
	local frame = _G["ChatFrame"..i]
	frame:SetScript('OnMouseWheel', OnMouseWheel)
	frame:HookScript('OnShow', UpdateBottomButton)
	frame:EnableMouseWheel()
	
	local button = _G["ChatFrame"..i.."ButtonFrameBottomButton"]
	button:HookScript('OnClick', OnClick)
	button:SetAlpha(.6)
	
	Hide(_G["ChatFrame"..i..'ButtonFrameUpButton'])
	Hide(_G["ChatFrame"..i..'ButtonFrameDownButton'])
	UpdateBottomButton(frame)
	frame:SetClampRectInsets(0,0,0,0) --Allow the chat frame to move to the end of the screen
end

ChatFrameMenuButton:Hide() --Hide the chat shortcut button for emotes/languages/etc
FriendsMicroButton:Hide() --Hide the "Friends Online" count button
