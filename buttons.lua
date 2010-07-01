ChatFrameMenuButton:UnregisterAllEvents()
ChatFrameMenuButton:Hide()
ChatFrameMenuButton.Show = dummy
_G['FriendsMicroButton']:UnregisterAllEvents()
_G['FriendsMicroButton']:Hide()
_G['FriendsMicroButton'].Show = dummy

for i= 1,10 do
	local frame = _G["ChatFrame"..i]
	_G["ChatFrame"..i..'ButtonFrameUpButton'].Hide()
	_G["ChatFrame"..i..'ButtonFrameUpButton'].Show = dummy
	_G["ChatFrame"..i..'ButtonFrameDownButton'].Hide()
	_G["ChatFrame"..i..'ButtonFrameDownButton'].Show = dummy
	UpdateBottomButton(frame)
	frame:SetClampRectInsets(0,0,0,0) --Allow the chat frame to move to the end of the screen
end
