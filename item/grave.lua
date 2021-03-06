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
-- Tree Script
-- Envi
require("base.common")
require("content.grave")

module("item.grave", package.seeall)

-- UPDATE common SET com_script='item.grave' WHERE com_itemid IN (337, 519, 520, 521);
  
GraveListGerman = 
{
"PLACEHOLDER.",
};

GraveListEnglish = 
{
"PLACEHOLDER.",
};



graveItemNumbers={337,519,520,521}

function LookAtItemIdent(User,Item)
    local test = "no value";
	if (first==nil) then
        content.grave.InitGrave()
        first=1;
    end

    -- fetching local references
    local signTextDe     = content.grave.signTextDe;
    local signTextEn     = content.grave.signTextEn;
    local signCoo        = content.grave.signCoo;
    local signItemId     = content.grave.signItemId;
    local signPerception = content.grave.signPerception;

    local lookAt = base.lookat.GenerateLookAt(User, Item)
    
    UserPer = User:increaseAttrib("perception",0);
    tablePosition = Item.pos.x .. Item.pos.y .. Item.pos.z;
	if signCoo ~= nil then
		if (signCoo[tablePosition] ~= nil) then
			for i, signpos in pairs(signCoo[tablePosition]) do
				if (Item.pos == signpos) then
					if (UserPer >= signPerception[tablePosition][i]) then
						lookAt.description = base.common.GetNLS(User,string.gsub(signTextDe[tablePosition][i],"currentChar",User.name),string.gsub(signTextEn[tablePosition][i],"currentChar",User.name))
					else
						lookAt.description = base.common.GetNLS(User,"Du erkennst, dass hier etwas ist, kannst es aber nicht entziffern, da du zu blind bist.","You recognise something, but you cannot read it, because you are too blind.")
					end
				end
			end
		end
	end

    world:itemInform(User, Item, lookAt)
end
--[[
	LookAtItemIdent
	identity of LookAtItem
  ]]
LookAtItem = LookAtItemIdent;


findPlayersForGems={}
graveSourceItemPos={position(958,238,0),position(968,226,0),position(970,219,0)}
typoOfGem={197,284,45}
gemColourDE1={"Lilla","Blau","Gr�n"}
gemColourDE2={"Amethysten","Saphire","Smaragde"}
gemColourEN1={"purple","blue","green"}
gemColourEN2={"Amethysts","Sapphires","Emeralds"}
gemsAlreadyFound={}
gemsAlreadyFound[1]={197,242,481,526}
gemsAlreadyFound[2]={284,329,481,526}
gemsAlreadyFound[3]={45,242,329,526}

function UseItem(User, SourceItem)

	local foundSource
	-- check for grave
	for t=1,4 do
		TargetItem = base.common.GetItemInArea(User.pos, graveItemNumbers[t])
		if (TargetItem ~= nil) then
			if not base.common.IsLookingAt( User, TargetItem.pos) then -- check looking direction
				base.common.TurnTo( User, TargetItem.pos); -- turn if necessary
			end
			foundSource=true
		end
	end

	local AmountGrave = table.getn(graveSourceItemPos)
	UserHasAlreadyThisGame=false
	for i = 1,AmountGrave do
		if (SourceItem.pos == graveSourceItemPos[i]) then
			local AmountGemsAlreadyFound = table.getn(gemsAlreadyFound[i])
			for j = 1,AmountGemsAlreadyFound do
				if User:getQuestProgress(669) == gemsAlreadyFound[i][j] then
					UserHasAlreadyThisGame=true
				end
			end
			if UserHasAlreadyThisGame ~= true then
				User:talk(Character.say, "#me wischt Staub vom Grabstein und pl�tzlich beginnt die Hand zu schimmern in einem latenten " .. gemColourDE1[i], "#me waves over the tombstone and suddenly the hand glimmers in a latent ".. gemColourEN1[i] .. " light.")
				User:createItem(typoOfGem[i],2,999,{["gemLevel"]="1"})
				base.common.InformNLS(User,"~Im Staub finden sich zwei latente magische " .. gemColourDE2[i] .. ".", "~The dust in your hand bears two latent magical " .. gemColourEN2[i] .. ".")
				findPlayersForGems[User.name] = world:getPlayersInRangeOf(User.pos, 20)
				for m,player in ipairs(findPlayersForGems[User.name]) do
					local playersCurrentStatus = player:getQuestProgress(669)
					player:setQuestProgress(669,playersCurrentStatus+typoOfGem[i])
				end
			else
				User:talk(Character.say, "#me wischt Staub vom Grabstein, der zu Boden f�llt.", "#me waves over the tombstone and dust drops to the ground.")				
				base.common.InformNLS(User,"Du findest nichts au�er Staub am Grabstein.", "You do not find anything except for dust on the tombstone.")
			end
		end	
	end
end


