--[[     Options start here     ]]
local EnableTimeStamps = true      -- true to enable, false to disable adding stamps
local DisableColoring = true        -- Disable own color for timestamps.
local COLOR = "FFFACD"              -- (if DisableColoring is false) Timestamp color, http://www.december.com/html/spec/colorcodes.html
local tformat = "%X"                -- Formats decide what time format you want http://www.lua.org/pil/22.1.html
local lbrack, rbrack = "", " "      -- Left and right bracket, change to what you want, or make blank ""
--[[        Options end         ]]

if(EnableTimeStamps==false) then return end

local _G = getfenv(0)
local date = date
local hooks = {}
local h
local function AddMessage(frame, text, ...)
    if(DisableColoring==true) then
        text = lbrack..date(tformat)..rbrack..text
    else
        text = "|cff"..COLOR..lbrack..date(tformat)..rbrack.."|r"..text
    end
    return hooks[frame](frame, text, ...)
end

--[[ Stamp CF 1 to 7 ]]
for i = 1, 7 do
	if(i ~= 2) then -- skip combatlog
		h = _G["ChatFrame"..i]
		hooks[h] = h.AddMessage
		h.AddMessage = AddMessage
	end
end