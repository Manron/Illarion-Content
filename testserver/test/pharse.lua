-- I_2786_ast.lua
-- TESTSCRIPT FOR PHARSE!!!!!!!111
--

-- UPDATE common SET com_script = 'test.pharse' WHERE com_itemid = 2786;

require("base.common")
require("npc.base.patrol");
require("base.doors")
require("gm.items.id_382_ceilingtrowel");
require("base.polygons");

module("test.pharse", package.seeall)

wDoor = nil;
wBridge = nil;
wBridgeArea = 0;
wBridgeWarp = false;
wMirror = false;

testPos = position(0,0,0)

function String2Number(str)
	local _,_,num = string.find(str, "(%d+)");
	if (num~="") then
		num = tonumber(num);
		return num, true;
	end
	return 0, false;
end

function UseItem(User,SourceItem,TargetItem,counter,param,ltstate)
	possibilities = [[remove all
	set skill
	get skill
	heal
	restore items
	create item
	create front item
	]];
	
	local cbRemoveAll = function (dialog)
		if (dialog:getSuccess()) then
			local num, okay = String2Number(dialog:getInput());
			if (okay) then
				User:eraseItem(num, User:countItem(num));
			else
				User:inform("You have not entered a number that could be used as item ID.");
			end
		end
	end
	
	local cbSetSkill = function (dialog)
		if (dialog:getSuccess()) then
			local skillGroup, okay = String2Number(dialog:getInput());
			if (not okay) then
				User:inform("no number");
				return;
			end
			local groupNames = { "Language", "Craftsmanship", "Magic", "Other", "Fighting", "Druid", "Priest", "Bard"};
			if (skillGroup < 1 or skillGroup > 8) then
				User:inform("Skill group number has to be between 1 and 8 (incl.)");
				return;
			end
			local cbSkillName = function (dialog)
				if (dialog:getSuccess()) then
					local skillName = dialog:getInput();
					local cbSkillValue = function (dialog)
						if (dialog:getSuccess()) then
							local skillValue, okay = String2Number(dialog:getInput());
							if (not okay) then
								User:inform("no number");
								return;
							end
							if (skillValue < 0 or skillValue > 100) then
								User:inform("value has to be between 0 and 100 (incl.)");
								return;
							end
							local curSkill = User:getSkill(skillName);
							User:increaseSkill(skillGroup, skillName, skillValue-curSkill);
						end
					end
					User:requestInputDialog(InputDialog("Enter the skill value","Chosen skill name: " .. skillName, false, 255, cbSkillValue));
				end
			end
			User:requestInputDialog(InputDialog("Enter the skill name","Chosen skill group: " .. groupNames[skillGroup], false, 255, cbSkillName));
		end
	end
	
	local cbGetSkill = function (dialog)
		if (dialog:getSuccess()) then
			local val = User:getSkill(dialog:getInput());
			if (val~=nil) then
				User:inform("Value of " .. dialog:getInput() .. ": " .. val);
			else
				User:inform("something went wrong");
			end
		end
	end
	
	local cbCreateItem = function (dialog)
		if (dialog:getSuccess()) then
			local input = dialog:getInput();
			local _,_,id,count,_,qual = string.find(input,"(%d+) (%d+)(%s*)(%d*)");
			if (id=="" or count=="") then
				User:inform("You have to enter at least the ID and the count.");
				return;
			end
			if (qual=="") then
				qual = 333;
			end
			User:createItem(tonumber(id), tonumber(count), tonumber(qual), nil);
		end
	end
	
	local cbCreateFrontItem = function (dialog)
		if (dialog:getSuccess()) then
			local input = dialog:getInput();
			local _,_,id,count,_,qual = string.find(input,"(%d+) (%d+)(%s*)(%d*)");
			if (id=="" or count=="") then
				User:inform("You have to enter at least the ID and the count.");
				return;
			end
			if (qual=="") then
				qual = 333;
			end
			local frontPos = base.common.GetFrontPosition(User);
			world:createItemFromId(tonumber(id), tonumber(count), frontPos, true, tonumber(qual), nil);
		end
	end
	
	local cbChooseOne = function (dialog)
		if (dialog:getSuccess()) then
			local input = dialog:getInput();
			if (input == "remove all") then
				local inputDialog = InputDialog("Enter an item ID you want to remove","", false, 255, cbRemoveAll);
				User:requestInputDialog(inputDialog);
				return;
			elseif (input == "set skill") then
				User:requestInputDialog(InputDialog("For setting a skill value, first enter the skill group","1=Language,\n 2=Craftsmanship,\n 3=Magic,\n 4=Other,\n 5=Fighting,  6=Druid,7=Priest, 8=Bard", false, 255, cbSetSkill));
			elseif (input == "get skill") then
				User:requestInputDialog(InputDialog("For getting a skill value, enter the skill name:","", false, 255, cbGetSkill));
			elseif (input == "heal") then
				User:increaseAttrib("hitpoints", 10000);
				User:increaseAttrib("foodlevel", 10000);
				User:increaseAttrib("mana", 10000);
				User:increaseAttrib("poisonvalue", -10000);
			elseif (input == "restore items") then
				User:createItem(97,1,333,nil);
				User:createItem(99,1,333,nil);
				User:createItem(362,1,999,nil);
				User:createItem(366,1,999,nil);
				User:createItem(527,1,999,nil);
				User:createItem(698,1,999,nil);
			elseif (input == "create item") then
				User:requestInputDialog(InputDialog("What item do you want?","Format:\n ID COUNT [QUALITY]\n quality is optional, default is 333", false, 255, cbCreateItem));
			elseif (input == "create front item") then
				User:requestInputDialog(InputDialog("What item do you want to create in front of you?","Format:\n ID COUNT [QUALITY]\n quality is optional, default is 333", false, 255, cbCreateFrontItem));
			else
				User:inform("Sorry, I didn't understand you.");
        local cbSel = function (dialog)
          if (dialog:getSuccess()) then
            User:inform("success with index " .. dialog:getSelectedIndex());
          else
            User:inform("failure");
          end
        end
        local s = SelectionDialog("Test Item", "What do you want to do?", cbSel);
        s:addOption(1,"ind 0");
        s:addOption(4,"ind 1");
        s:addOption(0,"ind 2");
        User:requestSelectionDialog(s);
			end
		end
	end
	
	--local msgDialog = MessageDialog("Your possibilities:", possibilities, nil);
    local inputDialog = InputDialog("What do you want to do?", "Your possibilities:\n" .. possibilities, false, 255, cbChooseOne);
	
	--User:requestMessageDialog(msgDialog);
    User:requestInputDialog(inputDialog);
end

function UseItem_deprecated(User,SourceItem,TargetItem,counter,param,ltstate)
	if dowp then
		if User.lastSpokenText == "nowp" then
			dowp = false;
			User:inform("no wp, back to normal.");
			return;
		end
		local wpFileName = "waypoints";
		local posFileName = "positions";
		local wpFile,errmsg = io.open("/home/pharse/waypoints/"..wpFileName,"a");
		local posFile,errmsg = io.open("/home/pharse/waypoints/"..posFileName,"a");
		if wpFile and posFile then
			if wMenu==nil then
				wMenu = MenuStruct();
				wMenu:addItem(505); -- treasure map => new waypoint
				wMenu:addItem(709); -- door => set door coords
				wMenu:addItem(602); -- bridge => set bridge coords, counter sets the area! if door is set, toPos is set.
				wMenu:addItem(10); -- portal => toggle warp boolean. default: false
				wMenu:addItem(336); -- mirror => add another inverted waypoint if bridge is set
				wMenu:addItem(228); -- occupied => reset all
			end
			if param==505 then				
				writeWaypoint(wpFile,posFile,User.pos,counter,wBridge,wBridgeArea,wBridgeWarp,wDoor);
				if wMirror then
					writeWaypoint(wpFile,posFile,wBridge,wBridgeArea,User.pos,counter,wBridgeWarp,wDoor);
				end
				wpFile:close();
				posFile:close();
				User:inform("waypoint added" .. (wMirror and " and mirror waypoint" or ""));
				wDoor = nil;
				wBridge = nil;
				wBridgeArea = 0;
				wBridgeWarp = false;
				wMirror = false;
			elseif param==709 then
				wDoor = base.common.CopyPosition(User.pos);
			elseif param==602 then
				wBridge = base.common.CopyPosition(User.pos);
				wBridgeArea = counter;
			elseif param==10 then
				wBridgeWarp = not wBridgeWarp;
			elseif param==336 then
				wMirror = not wMirror;
			elseif param==228 then
				wDoor = nil;
				wBridge = nil;
				wBridgeArea = 0;
				wBridgeWarp = false;
				wMirror = false;
			end
			local out = (wDoor~=nil and "Door, " or "--, ") .. (wBridge~=nil and "Bridge, Area=".. wBridgeArea or "--") .. ", Warp=".. (wBridgeWarp and "true" or "false") ..", Mirror=".. (wMirror and "true" or "false") ..";";
			User:inform(out);
			User:sendMenu(wMenu);
		else
			User:inform("files not found");
		end
		return;
	end
	
	if string.find(User.lastSpokenText, "polygon") then
		p = base.polygons.Polygon({position(0,0,0), position(2,1,0), position(2,2,0), position(1,2,0)},{0});
		debug("p1: " .. printBool(p:pip(position(0,0,0))));
		debug("p2: " .. printBool(p:pip(position(2,1,0))));
		debug("p3: " .. printBool(p:pip(position(2,2,0))));
		debug("p4: " .. printBool(p:pip(position(1,2,0))));
		debug("p5: " .. printBool(p:pip(position(0,1,0))));
		debug("p6: " .. printBool(p:pip(position(1,1,0))));
		-- l = base.polygons.Line(position(0,0,0), position(2,4,0));
		-- debug("l1: " .. printBool(l:pointOnLine(position(0,0,0))));
		-- debug("l2: " .. printBool(l:pointOnLine(position(1,2,0))));
		-- debug("l3: " .. printBool(l:pointOnLine(position(0,1,0))));
		-- debug("l4: " .. printBool(l:pointOnLine(position(2,4,0))));
		-- debug("l5: " .. printBool(l:pointOnLine(position(1,1,0))));
	else
		debug("no text found");
	end
end

function writeWaypoint(wpFile,posFile,wpPos,wpArea,bridgePos,bridgeArea,bridgeWarp,door)
	local text = "Waypoint:new(position("..wpPos.x ..","..wpPos.y ..","..wpPos.z .."),".. wpArea;
	if bridgePos then
		text = text ..",nil,{bridge={toArea=".. bridgeArea ..",toWaypoint=position("..bridgePos.x ..","..bridgePos.y ..","..bridgePos.z .."),warp=";
		text = text .. (bridgeWarp and "true" or "false") .."}";
		if door then
			text = text .. ",\n                                            door={pos=position("..door.x ..","..door.y ..","..door.z .."),";
			text = text .. "toPos=position("..bridgePos.x ..","..bridgePos.y ..","..bridgePos.z ..")}";
		end
		text = text .. "}";
	end
	text = text .. ");\n"
	wpFile:write(text);
	posFile:write("position("..wpPos.x ..","..wpPos.y ..","..wpPos.z .."),\n");
end

function printPosition(pos)
	return "x=" .. pos.x .. "|y=" .. pos.y .. "|z=" .. pos.z;
end

function printBool(val)
	if val==true then
		return "true";
	elseif val==nil then
		return "nil";
	elseif val==false then
		return "false";
	else
		return "n.d.";
	end
end