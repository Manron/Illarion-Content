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
--[[
    Teach rune: BHONA
    Rune 26
        BHONA

    Teaching-Spell

    SQL:    INSERT INTO spells VALUES (2^25+2^27,0,'m_26_teach-bhona.lua');
]]

require("magic.base.teachspell");
module("magic.spell_26_teach-bhona", package.seeall)
-- Informations about the rune
Rune = {
    ["name"] = "BHONA", -- name of the rune
    ["class"] = 4,      -- class of the rune ( 1 = weak, 2 = normal, 3 = strong, 4 = teaching rune )
    ["value"] = 25      -- value of the rune
}

-- Teacher related informations
Teacher = {
    ["skill"] = {               -- The required skill of the teacher
        ["name"] = "all",  -- name of the skill that is required
        ["value"] = 250          -- value of the skill that is required
    },
    ["attribsum"] = 50          -- sum of attributes that are required
}

-- Student related informations
Student = {
    ["skill"] = {               -- Skill requirements to the student
        ["name"] = "all",       -- name of the skill that is required
        ["value"] = 100         -- value of the skill that is required
    },
    ["attribsum"] = 33          -- attribute requirements to the student
}
