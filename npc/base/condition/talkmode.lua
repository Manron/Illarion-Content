--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>. 
]]
require("base.class")
require("npc.base.condition.condition")

module("npc.base.condition.talkmode", package.seeall)

talkmode = base.class.class(npc.base.condition.condition.condition,
function(self, value)
    npc.base.condition.condition.condition:init(self);
    if (value == "shout" or value == "yell" or value == Character.yell) then
        self["value"] = Character.yell;
	elseif (value == "whisper" or value == Character.whisper) then
        self["value"] = Character.whisper;
    else
        self["value"] = Character.say;
    end;
    self["check"] = _talkmode_helper_equal;
end);

function _talkmode_helper_equal(self, npcChar, texttype, player)
    return (texttype == self.value);
end;
