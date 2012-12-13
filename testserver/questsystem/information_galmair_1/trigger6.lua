require("handler.sendmessagetoplayer")
require("handler.createplayeritem")
require("questsystem.base")
module("questsystem.information_galmair_1.trigger6", package.seeall)

local QUEST_NUMBER = 631
local PRECONDITION_QUESTSTATE = 31
local POSTCONDITION_QUESTSTATE = 34

local NPC_TRIGGER_DE = "[Dd]on|[Vv]alerio|[Gg]uilianni"
local NPC_TRIGGER_EN = "[Dd]on|[Vv]alerio|[Gg]uilianni"
local NPC_REPLY_DE = "Richtig! Und wie hei�t die �rtlichkeit an der man ihn findet?"
local NPC_REPLY_EN = "Right! And what is the name of the place where you can find him?"

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
    handler.createplayeritem.createPlayerItem(PLAYER, 3076, 333, 100):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Beantworte die gestellte Frage um mehr Geld und weitere Fragen zu erhalten. Hinweis, eine Frage bezüglich 'Gebäude' und 'Galmairs Krone' mag dir helfen.", "Answer the question to get more money and further questions. Hint: A question about 'building' and 'Galmair's Crest' might be helpful."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end