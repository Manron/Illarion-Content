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
-- I_2744_pfeife.lua
--
require("base.common")
require("item.general.wood")

module("item.id_2744_pipe", package.seeall, package.seeall(item.general.wood))

-- UPDATE common SET com_script='item.id_2744_pipe' WHERE com_itemid = 2744;


function UseItem(User, SourceItem)
	--local ammountSib = User:countItemAt("belt",155);
	--local ammountTob = User:countItemAt("belt",772);
	if (User:countItemAt("belt",155) == 0 and User:countItemAt("belt",772) == 0) then
		base.common.InformNLS( User,
        "Du ben�tigst Sibanac-Bl�tter oder Tabak, um Pfeife rauchen zu k�nnen.",
        "You need sibanac-leaves or tobacco to smoke a pipe." );
		
		
	elseif (User:countItemAt("belt",155) ~= 0) then 
		User:talk(Character.say, "#me nimmt einen tiefen Zug von der Pfeife.", "#me takes a deep drag from the pipe.")
		User:eraseItem( 155, 1 );
			
	elseif (User:countItemAt("belt",772) ~= 0) then
		User:talk(Character.say, "#me nimmt einen tiefen Zug von der Pfeife.", "#me takes a deep drag from the pipe.")
		User:eraseItem( 772, 1 );
	--[[Effekt setzen falls noch nicht vorhanden
	-- LTE to get High, currently not working
			find, stonedEffect = Character.effects:find(19);
			if find then
			found, stonedIndex = stonedEffect:findValue("stonedIndex");
			if found then
			stonedEffect:addValue("stonedIndex",(stonedIndex+1));
			end
			else

			Character.effects:addEffect( LongTimeEffect(19,10) );
			end]]

	end
end

function LookAtItem(User, Item)
	
	local lookat = base.lookat.GetItemDescription(User,Item,2,false,false);
	world:itemInform(User, Item, lookat)
end
