require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_runewick_622.trigger51", package.seeall)

local QUEST_NUMBER = 622
local PRECONDITION_QUESTSTATE = 10
local POSTCONDITION_QUESTSTATE = 10

local NPC_TRIGGER_DE = "[Qq]uest|[Mm]ission|[Aa]uftrag|[Aa]benteuer|[Bb]efehl|[Ss]piel"
local NPC_TRIGGER_EN = "[Qq]uest|[Mm]ission|[Tt]ask|[Aa]dventure|[Oo]rder|[Gg]ame"
local NPC_REPLY_DE = "Auf das Dach des Turm des Feuers mit euch!"
local NPC_REPLY_EN = "Go to the top of the Tower of Fire!"

function receiveText(npc, type, text, PLAYER)
    if ADDITIONALCONDITIONS(PLAYER)
    and PLAYER:getType() == Character.player
    and questsystem.base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then
        if PLAYER:getPlayerLanguage() == Player.german then
            NPC_TRIGGER=string.gsub(NPC_TRIGGER_DE,'([ ]+)',' .*');
        else
            NPC_TRIGGER=string.gsub(NPC_TRIGGER_EN,'([ ]+)',' .*');
        end

        foundTrig=false
        
        for word in string.gmatch(NPC_TRIGGER, "[^|]+") do 
            if string.find(text,word)~=nil then
                foundTrig=true
            end
        end

        if foundTrig then
      
            npc:talk(Character.say, getNLS(PLAYER, NPC_REPLY_DE, NPC_REPLY_EN))
            
            HANDLER(PLAYER)
            
            questsystem.base.setPostcondition(PLAYER, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
        
            return true
        end
    end
    return false
end

function getNLS(player, textDe, textEn)
  if player:getPlayerLanguage() == Player.german then
    return textDe
  else
    return textEn
  end
end


function HANDLER(PLAYER)
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "[Quest Hinweis] Bringe eine Pergamentrolle. Frage einen Schreiner oder Händler deiner Wahl um Hilfe.", "[Quest Hint] Bring a pell. Ask a carpenter or trader of choice for help."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end