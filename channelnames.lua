local gsub = string.gsub
local hooks = {}
local h

--[[
How to edit "standart" channel names:
"|Hchannel:*text*" is channel name
"|h*text*|h" is your replacament for it
"%s " is text in this channel
Example: "|Hchannel:Guild|hMYGUILDCHANNELREPLACEMENT|h %s " will make guild channel be named MYGUILDCHANNELREPLACEMENT
]]--

CHAT_GUILD_GET = "|Hchannel:Guild|hg|h %s "
CHAT_RAID_GET = "|Hchannel:raid|hr|h %s "
CHAT_PARTY_GET = "|Hchannel:Party|hp|h %s "
CHAT_PARTY_LEADER_GET =  "|Hchannel:Party|hP|h %s "
CHAT_PARTY_GUIDE_GET =  "|Hchannel:Party|hP|h %s "
CHAT_RAID_WARNING_GET = "RW %s "
CHAT_RAID_LEADER_GET = "|Hchannel:raid|hR|h %s "
CHAT_OFFICER_GET = "|Hchannel:o|ho|h %s "
CHAT_BATTLEGROUND_GET = "|Hchannel:Battleground|hb|h %s "
CHAT_BATTLEGROUND_LEADER_GET = "|Hchannel:Battleground|hB|h %s "
CHAT_WHISPER_INFORM_GET = "to %s "
CHAT_WHISPER_GET = "from %s "
CHAT_BN_WHISPER_INFORM_GET = "to %s "
CHAT_BN_WHISPER_GET = "from %s "
CHAT_SAY_GET = "%s "
CHAT_YELL_GET = "%s "

CHAT_FLAG_AFK = "[AFK] "
CHAT_FLAG_DND = "[DND] "
CHAT_FLAG_GM = "[GM] "

local replaceschan = {
   ['(%d+)%. .-'] = '%1',
}
local AddMessageOriginal
local function AddMessageHook(frame, text, ...)
    for k,v in pairs(replaceschan) do
        text = text:gsub('|h%['..k..'%]|h', '|h'..v..'|h')
    end
    return AddMessageOriginal(frame, text, ...)
end
    
for i = 1, NUM_CHAT_WINDOWS do
    if ( i ~= 2 ) then
    local frame = _G["ChatFrame"..i]
        AddMessageOriginal = frame.AddMessage
        frame.AddMessage = AddMessageHook
    end
end 
