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
-- UPDATE common SET com_script = 'item.id_1059_dice' WHERE com_itemid = 1059 ;

require("base.common")

module("item.id_1059_dice", package.seeall);

function UseItem(User, SourceItem, ltstate)
	chooseTypeOfDice(User)
end

function informAboutResult(User, typeOfDice, numberOfDice)
	local thrownNumbers = math.random(1,typeOfDice);
	
	local diceTypeEn, diceTypeDe
	if typeOfDice == 6 then
		diceTypeEn = "sixsided"
		if tonumber(numberOfDice) > 1 then
			diceTypeDe = "sechsseitige"
		else
			diceTypeDe = "sechsseitiger"
		end
	else
		diceTypeEn = "twentysided"
		if tonumber(numberOfDice) > 1 then
			diceTypeDe = "zwanzigseitige"
		else
			diceTypeDe = "zwanzigseitiger"
		end
	end	
	
	for i=1, numberOfDice-1 do
		thrownNumbers = thrownNumbers..", "..math.random(1,typeOfDice);
	end
	
	local playerInRange = world:getPlayersInRangeOf(User.pos, 3);
	User:talk(Character.say,"#me w�rfelt.","#me throws dice.")
	for _,player in pairs(playerInRange) do 
		player:inform(numberOfDice.." "..diceTypeDe.." W�rfel wurden gew�rfelt und sie zeigen: "..thrownNumbers ,numberOfDice.." "..diceTypeEn.." dice are trown and they show: "..thrownNumbers);		
	end
		
end

function chooseNumberOfDice(User, typeOfDice)
	local title = base.common.GetNLS(User,"W�rfel", "Dice");
	local text = base.common.GetNLS(User,"Bitte gib ein, wieviele W�rfel du werfen m�chtest." , "Please type in how many dice you wish to throw.");

	local cbInputDialog = function (dialog)
		if (not dialog:getSuccess()) then
			return;
		end
		local inputNumber = dialog:getInput();
		if (string.find(inputNumber,"(%d+)") ~= nil) then
			if tonumber(inputNumber) <= 0 then
				User:inform("Du musst mindestens einen W�rfel werfen.","You have to trow at least one dice.")
				chooseNumberOfDice(User, typeOfDice)
			elseif tonumber(inputNumber) > 0 and tonumber(inputNumber) < 7 then 
				informAboutResult(User, typeOfDice, inputNumber)
			else
				User:inform("Du kannst nur bis zu 6 W�rfel werfen.", "You can only trow up to 6 dice.")
				chooseNumberOfDice(User, typeOfDice)
			end
		else
			User:inform("Dies ist keine g�ltige Zahl. Bitte versuch es erneut.","Not a valid number. Please try again.");
			chooseNumberOfDice(User, typeOfDice)
		end
	end
	User:requestInputDialog(InputDialog(title, text ,false, 255, cbInputDialog))
end

function chooseTypeOfDice(User)
	local title = base.common.GetNLS(User,"W�rfel", "Dice");
	local text = base.common.GetNLS(User,"Bitte w�hle aus, welche Art W�rfel du werfen m�chtest." , "Please choose what type of dice you wish to throw.");
	
	local sdDice = function(dialog)
		if (not dialog:getSuccess()) then
			return;
		end
		local selected = dialog:getSelectedIndex();
		if selected == 0 then
			chooseNumberOfDice(User, 6);
		else
			chooseNumberOfDice(User, 20);
		end
	end
	local dialog = SelectionDialog(title, text, sdDice)

	dialog:addOption(0, base.common.GetNLS(User, "W6 - Sechsseitiger W�rfel", "D6 - Sixsided dice"))
	dialog:addOption(0, base.common.GetNLS(User, "W20 - Zwanzigseiiger W�rfel", "D20 - Twentysided dice"))
	
	User:requestSelectionDialog(dialog)
end