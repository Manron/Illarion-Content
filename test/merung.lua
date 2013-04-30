require("development.recipe_creation")
require("alchemy.base.brewing")

-- UPDATE common SET com_script = 'test.merung' WHERE com_itemid = 1266;

module("test.merung", package.seeall)
--[[
function ltstateCheck(User, ltstate, counter)
 
	if (ltstate == Action.none) then
		User:startAction(50,21,5,15,25);
		return
	end
	if ( ltstate == Action.abort ) then
		User:inform("Nevermind that shit. Here comes Mongo")
     	return
	end
	User:inform("counter: "..counter)
   
	ltstateCheck(User, ltstate, counter+1)
	
end    --]]
 
function UseItem(User, SourceItem,ltstate,newVar)
--[[
	if User.lastSpokenText == "ltstate" then       
	    ltstateCheck(User, ltstate, 1)
		return
	end 
--]]
	
	if ( ltstate == Action.abort ) then
		User:inform("Nevermind that shit. Here comes Mongo")
     	return
	end
	
	if (ltstate == Action.none) then
		
		if not newVar then
			if USER_POSITION_LIST == nil then
				USER_POSITION_LIST = {}
			end
			
			local callback = function(dialog) 
				success = dialog:getSuccess() 
				if success then
					selected = dialog:getSelectedIndex()+1
					User:inform("Success, you selected option "..selected)
					USER_POSITION_LIST[User.name] = selected
					UseItem(User, SourceItem,ltstate, true)
				else
					User:inform("Selection aborted!") 
				end
			end

			local dialog = SelectionDialog("Selection 0", "Select some stuff...", callback)
			dialog:setCloseOnMove()
			dialog:addOption(0, "1")
			dialog:addOption(0, "2")
			dialog:addOption(0, "3")
			dialog:addOption(0, "4")

			User:requestSelectionDialog(dialog)
		else
			User:inform("debug 1")
			User:startAction(50,21,5,15,25);
		end	
	end
	
	if newVar then
        User:inform("debug 2")
		USER_POSITION_LIST[User.name] = USER_POSITION_LIST[User.name]+1
		if USER_POSITION_LIST[User.name] == 4 then
		    User:inform("last step. end")
			return
		end
		User:inform("debug 3")		
		User:startAction(50,52,5,15,25)
	end	

end




function LookAtItem(player, item)
    
end	