-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (73, 'quest.lilith_needlehand_73_runewick');
     
require("base.common")
module("quest.lilith_needlehand_73_runewick", package.seeall)
     
	 
	 
GERMAN = Player.german
ENGLISH = Player.english
     
-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Das faule Schneiderlein"
Title[ENGLISH] = "The Lazy Tailoress"
     
-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammel zwanzig Wollballen und bringe sie zur�ck zu Lilith. Wenn du Schafe mit einer Schere scherst, bekommst du Wolle."
Description[ENGLISH][1] = "Collect twenty bundles of wool and bring them back to Lilith. You can shear a sheep with scissors to get wool."
Description[GERMAN][2] = "Kehre zur�ck zu Lilith Needlehand und frage, ob sie noch eine Aufgabe f�r dich hat."
Description[ENGLISH][2] = "Go back to Lilith Needlehand, she is sure to have another task for you." 
Description[GERMAN][3] = "Besorge f�nfzehn Spulen Garn und bringe sie zur�ck zu Lilith. Garn kannst du mit einer Schere am Spinnrad aus Wolle oder Sibanac herstellen."
Description[ENGLISH][3] = "Produce fifteen bobbins of thread and bring them back to Lilith. You can produce thread out of wool or sibanac leaf by using a spinning wheel with scissors." 
Description[GERMAN][4] = "Kehre zur�ck zu Lilith Needlehand und frage, ob sie noch eine Aufgabe f�r dich hat."
Description[ENGLISH][4] = "Go back to Lilith Needlehand, she is sure to have another task for you."  
Description[GERMAN][5] = "Besorge f�nf Bahnen roten Stoff und bringe sie zur�ck zu Lilith. Du kannst wei�en oder grauen Stoff mit einen Farbeimer und einen F�rbestab an einen Fass einf�rben."
Description[ENGLISH][5] = "Produce five bolts of red cloth and bring them back to Lilith. You can dye white or gray cloth with a dyeing rod and a bucket red dye, when you stand infront of a barral." 
Description[GERMAN][6] = "Du hast alle Aufgaben von Lilith Needlehand erf�llt."
Description[ENGLISH][6] = "You have fulfilled all the tasks for Lilith Needlehand." 


    
-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(852, 792, 0), position(894, 762, 0)} -- Sheeps
QuestTarget[2] = {position(894, 762, 0)} -- Lilith Needlehand 
QuestTarget[3] = {position(911, 783, 0), position(894, 762, 0)} -- spinning wheel
QuestTarget[4] = {position(894, 762, 0)} -- Lilith Needlehand 
QuestTarget[5] = {position(909, 778, 0), position(894, 762, 0)} -- barrel
QuestTarget[6] = {position(894, 762, 0)} -- Lilith Needlehand 
     
-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 6
     
     
function QuestTitle(user)
    return base.common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end
     
function QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""
     
    return base.common.GetNLS(user, german, english)
end
     
function QuestTargets(user, status)
    return QuestTarget[status]
end
     
function QuestFinalStatus()
    return FINAL_QUEST_STATUS
end
