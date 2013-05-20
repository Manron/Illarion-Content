require("base.common")
require("base.hair")

module("triggerfield.hairdresser", package.seeall)

-- searches for NPCs near the triggerfield with the given names
npcList = {"Repair Man", "Name 2", "Name 3"}


function MoveToField(User)
	-- gets all npcs in a range of 2
	local npcsInRange = world:getNPCSInRangeOf(User.pos, 2)
	-- searches throug 2 loops, searching for the npc from the list that matches to the npc in range
	for i=1, #(npcList) do
		for j=1, #(npc) do
			-- then the npc was found, the npc gives out a text
			if npcsInRange[j].name == npcList[i] then
				local npc = npcsInRange[j];
				npc:talk(Character.say, "Deutsch", "English");
			else
				User:inform("[Error] The npc couldn't be found, please contact a developer.");
			end
		end
	end

	-- call the function to get the first selectiondialog for selecting either change of hair style, beard style, hair color or original haircolor
	selectChoice(User, npc);

end

function selectChoice(User, NPC)

	local callback = function(dialog) 
		local success = dialog:getSuccess() 
		if success then
			local selected = dialog:getSelectedIndex();
			if selected == 0 then
				selectHair(User, NPC);
			elseif selected == 1 then
				selectBeard(User, NPC);
			else
				selectHaircolor(User, NPC);
			end
		end
	end

	local dialog = SelectionDialog(base.common.GetNLS(User,"Friseur","Hair dresser"), base.common.GetNLS(User,"Bitte wähle aus, was du ändern möchtest.","Please select what you would like to change."), callback)
	dialog:setCloseOnMove()
	dialog:addOption(0, base.common.GetNLS(User, "Frisur","Hair style"))
	dialog:addOption(0, base.common.GetNLS(User, "Bart","Beard"))
	dialog:addOption(0, base.common.GetNLS(User, "Haarfarbe","Hair color"))

	User:requestSelectionDialog(dialog)
end

function selectHair(User, NPC)
	local race = User:getRace();
	local gender = User:increaseAttrib("sex", 0)+1;
	
	-- if character is a lizardman, say something and deny service
	if race == 5 then
		NPC:talk(Character.say, "Deutsch", "English");
		return;
	end
		
	local callback = function(dialog) 
		local success = dialog:getSuccess();
		if success then
			local selected = dialog:getSelectedIndex()+1;
			User:setHair(base.hair.hairStyles[race][gender][selected].id)
		end	
	end

	local dialog = SelectionDialog(base.common.GetNLS(User,"Friseur","Hair dresser"), base.common.GetNLS(User,"Bitte wähle aus, welche Frisur du haben möchtest.","Please select what hair style you wish to have."), callback);
	dialog:setCloseOnMove();
	local hairTable = base.hair.hairStyles[race][gender];
	for i=1, #(hairTable) do 
		dialog:addOption(0, base.common.GetNLS(User, hairTable[i].nameDe, hairTable[i].nameEn));
	end

	User:requestSelectionDialog(dialog)
end

function selectBeard(User, NPC)
	local race = User:getRace();
	local gender = User:increaseAttrib("sex", 0)+1;

	-- if character is not human or dwarf, say something and deny service
	if race ~= 0 or race ~= 1 then
		NPC:talk(Character.say, "Deutsch", "English");
		return;
	-- if character is female, deny service
	elseif gender ~= 0 then
		NPC:talk(Character.say, "Deutsch", "English");
		return;
	end

	local callback = function(dialog) 
		local success = dialog:getSuccess();
		if success then
			local selected = dialog:getSelectedIndex()+1;
			User:setBeard(base.hair.beardStyles[race][selected].id);
		end	
	end

	local dialog = SelectionDialog(base.common.GetNLS(User,"Friseur","Hair dresser"), base.common.GetNLS(User,"Bitte wähle aus, welchen Bart du haben möchtest.","Please select what beard style you wish to have."), callback);
	dialog:setCloseOnMove()
	local beardTable = base.hair.beardStyles[race];
	for i=1, #(beardStyles) do 
		dialog:addOption(0, base.common.GetNLS(User, beardStyles[i].nameDe, beardStyles[i].nameEn))
	end
	User:requestSelectionDialog(dialog)
end

hairColorSimple = {
	{r=1 ,g=1 ,b=1 ,nameDe="Weißblond", nameEn="White blonde"},
	{r=2 ,g=2 ,b=2 ,nameDe="Blond", nameEn="Blonde"},
	{r=3 ,g=3 ,b=3 ,nameDe="Dunkelblond", nameEn="Dark blonde"},
	{r=4 ,g=4 ,b=4 ,nameDe="Hellbraun", nameEn="Light brown"},
	{r=5 ,g=5 ,b=5 ,nameDe="Braun", nameEn="Brown"},
	{r=6 ,g=6 ,b=6 ,nameDe="Dunkelbraun", nameEn="Dark brown"},
	{r=7 ,g=7 ,b=7 ,nameDe="Schwarz", nameEn="Black"},
	{r=8 ,g=8 ,b=8 ,nameDe="Hellrot", nameEn="Light ginger"},
	{r=9 ,g=9 ,b=9 ,nameDe="Dunkelrot", nameEn="Dark ginger"}
}

function selectHaircolor(User, NPC)
	local originalHaircolor = User:getQuestProgress(31)
	
	if originalHaircolor == 0 then
		local red, green, blue  = User:getHairColor();
		red = red*1000;
		blue = blue*1000;
		green = green*1000;
		
		User:setQuestProgress(31,tonumber(red..green..blue));
	end
	
	local callback = function(dialog) 
		local success = dialog:getSuccess() 
		if success then
			local selected = dialog:getSelectedIndex()
			if selected == 0 then
				local hairColor = User:getQuestProgress(31);
				-- check if hair color has ever been changed
				if hairColor == 0 then
					NPC:talk(Character.say, "Deutsch", "English");
					return;
				end
				local r, g, b;
				r = haircolor/1000000000;
				g = hairColor/1000000;
				b = hairColor/1000;
				User:setHairColor(r, g, b);				
			else
				User:setHairColor(hairColorSimple[selected].r, hairColorSimple[selected].g, hairColorSimple[selected].b);
			end
		end
	end

	local dialog = SelectionDialog(base.common.GetNLS(User,"Friseur","Hair dresser"), base.common.GetNLS(User,"Bitte wähle aus, welche Farbe du haben möchtest.","Please select what hair color you wish to have."), callback);
	dialog:setCloseOnMove();
	dialog:addOption(0, base.common.GetNLS(User,"Naturhaarfarbe", "Natural hair color"));
	for i=1, #(hairColorSimple) do
		dialog:addOption(0, base.common.GetNLS(User,hairColorSimple[i].nameDe,hairColorSimple[i].nameEn));
	end

	User:requestSelectionDialog(dialog)
	
end