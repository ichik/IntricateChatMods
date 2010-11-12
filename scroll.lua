function FloatingChatFrame_OnMouseScroll(self, delta)
	if delta < 0 then
		if IsShiftKeyDown() then self:ScrollToBottom()
		else
			for i = 1, 3 do self:ScrollDown() end end
	elseif delta > 0 then
		if IsShiftKeyDown() then self:ScrollToTop()
		else
			for i = 1, 3 do self:ScrollUp()
			end
		end
	end
end