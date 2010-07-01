--[[ Buttons ]]--

local function Hide(f)
	f:SetScript('OnShow', f.Hide)
	f:Hide()
end

local function UpdateBottomButton(frame)
	local button = _G[frame:GetName() .. 'BottomButton']
	if frame:AtBottom() then
		button:Hide()
	else
		button:ClearAllPoints()
		button:SetPoint('TOPRIGHT', frame, 'TOPRIGHT', 0, 0)
		button:Show()
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
	local frame = _G[format("%s%d%s", "ChatFrame", i]
	frame:SetScript('OnMouseWheel', OnMouseWheel)
	frame:HookScript('OnShow', UpdateBottomButton)
	frame:EnableMouseWheel()
	
	local button = _G[format("%s%d%s", "ChatFrame", i, 'BottomButton']
	button:HookScript('OnClick', OnClick)
	button:SetAlpha(.6)
	
	Hide(_G[format("%s%d%s", "ChatFrame", i, 'UpButton'])
	Hide(_G[format("%s%d%s", "ChatFrame", i, 'DownButton'])
	UpdateBottomButton(frame)
	frame:SetClampRectInsets(0,0,0,0) --Allow the chat frame to move to the end of the screen
end

ChatFrameMenuButton:Hide() --Hide the chat shortcut button for emotes/languages/etc
FriendsMicroButton:Hide() --Hide the "Friends Online" count button
