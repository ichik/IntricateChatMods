local function Hide(f)
	f:SetScript('OnShow', f.Hide)
	f:Hide()
end

--[[ Moving Buttons ]]--

local function UpdateBottomButton(frame)
	local button = frame.buttonFrame.bottomButton
	if frame:AtBottom() then
		button:Hide()
	else
		button:Show()
	end
end

local function OnClick(button)
	UpdateBottomButton(button:GetParent():GetParent())
end

hooksecurefunc('FloatingChatFrame_OnMouseScroll', UpdateBottomButton)
for i= 1,10 do
	local frame = _G['ChatFrame'..i]
	frame:HookScript('OnShow', UpdateBottomButton)
	
	local buttons = frame.buttonFrame
	buttons:DisableDrawLayer('BACKGROUND')
	buttons:DisableDrawLayer('BORDER')
	
	local bottom = buttons.bottomButton
	bottom:SetPoint('BOTTOMRIGHT', frame, 'BOTTOMRIGHT')
	bottom:HookScript('OnClick', OnClick)
	bottom:SetAlpha(.6)
	
	Hide(buttons.upButton)
	Hide(buttons.downButton)
	UpdateBottomButton(frame)
	frame:SetClampRectInsets(0,0,0,0) --Allow the chat frame to move to the end of the screen
end

Hide(ChatFrameMenuButton)
Hide(FriendsMicroButton)
