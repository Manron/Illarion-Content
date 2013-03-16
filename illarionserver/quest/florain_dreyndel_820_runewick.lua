-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (820, 'quest.florain_dreyndel_820_runewick');

require("base.common")
module("quest.florain_dreyndel_820_runewick", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Ein guter Anfang in Runewick"
Title[ENGLISH] = "A good beginning in Runewick"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Gehe zu Daniel Brock und frag ihn nach einer Aufgabe. Er ist im Turm der Luft zu finden.\n Von Florain aus, einfach �ber die lange Br�cke nach Osten und durch das blaue Portal gehen. Am Marktplatz angekommen, ist der Turm der Luft das Geb�ude im S�den. Dort einfach eine Etage nach unten und durch die T�r gehen."
Description[ENGLISH][1] = "Got to Daniel Brock and ask him for a task. \n From Florain's position just go over the long bridge to the east and through the blue portal. When you arrived on the marketplace, the tower of air is the building to the south. There just go one floor down and through the door."
Description[GERMAN][2] = "Gehe zu Florain zur�ck, wenn du weitere Aufgaben ben�tigst."
Description[ENGLISH][2] = "Go back to Florain if you need more tasks."
Description[GERMAN][3] = "Gehe zu Judith Tanner und frag sie nach einer Aufgabe. Sie ist im Turm des Feuers zu finden.\n Vom Marktplatz aus einfach in das Geb�ude im Norden gehen, dem Turm des Feuers, und gleich nach dem Betreten nach links um ins Untergeschoss zu gelanden. Dort direkt durch die T�r rechts von der kleinen Taverne gehen."
Description[ENGLISH][3] = "Go to Judith Tanner and ask her for a task. She can be found in the tower of fire.\m From the marketplace just go to the building in the north, the tower of fire, and after entering to the left to go down one floor. There just go through the door on the right of the small tavern."
Description[GERMAN][4] = "Gehe zu Florain zur�ck, wenn du weitere Aufgaben ben�tigst."
Description[ENGLISH][4] = "Go back to Florain if you need more tasks."
Description[GERMAN][5] = "Gehe zu Zassaria Riverbank und frag sie nach einer Aufgabe. Sie ist auf dem Marktplatz von Runewick zu finden.\n Von Florain aus, einfach �ber die lange Br�cke nach Osten gehen und am Ende durch das blaue Portal. Zassaria ist eine Echse, du kannst sie also nicht verpassen."
Description[ENGLISH][5] = "Go to Zassaria Riverbank and ask her for a task. She can be found on Runewick's marketplace.\n From Florain's position just go over the long bridge to the east and through the blue portal at the end of the path. Zassaria is a lizard, so you can't miss her."
Description[GERMAN][6] = "Gehe zu Florain zur�ck, wenn du weitere Aufgaben ben�tigst."
Description[ENGLISH][6] = "Go back to Florain if you need more tasks."
Description[GERMAN][7] = "Gehe zu Neiran El Nayale und frag ihn nach einer Aufgabe. Er ist im Turm des Feuers im Obergeschoss zu finden.\n Gehe vom Marktplatz nach Norden in den Turm des Feuers, dort rechts durch die T�r und die Treppe nach oben. Dort gehe durch die T�r im S�den."
Description[ENGLISH][7] = "Go to Neiran El Nayale and ask him for a task. He can be found on the upper floor of the tower of fire.\n From the marketplace go to the north into the tower of fire and there through the door to the right and up the stairs. There go through the door to the south."
Description[GERMAN][8] = "Gehe zu Florain zur�ck, wenn du weitere Aufgaben ben�tigst."
Description[ENGLISH][8] = "Go back to Florain if you need more tasks."
Description[GERMAN][9] = "Gehe zu Baldo Proudtoe und frag ihn nach einer Aufgabe. Er kann in den G�rten Runewicks gefunden werden.\n Die G�rten Runewicks k�nnen gefunden werden, indem man auf dem Runewick Marktplatz durch das rote Portal geht."
Description[ENGLISH][9] = "Go to Baldo Proudtoe and ask him for a task. He can be found in the gardens of Runewick.\n The gardens of Runewick can be found through the red portal from Runewick's marketplace."
Description[GERMAN][10] = "Gehe zu Florain zur�ck, wenn du weitere Aufgaben ben�tigst."
Description[ENGLISH][10] = "Go back to Florain if you need more tasks."
Description[GERMAN][11] = "Gehe zu Nana Winterbutter und frag sie nach einer Aufgabe. Sie ist gleich n�rdlich von Florain in Yewdale zu finden. Sie wird wohl am Feuer vor ihrem Haus sitzen und kochen."
Description[ENGLISH][11] = "Go to Nana Winterbutter and ask her for a task. She can be found to the north of Florain in Yewdale. She will be sitting cooking at the fire in front of her house."
Description[GERMAN][12] = "Gehe zu Florain zur�ck, wenn du weitere Aufgaben ben�tigst."
Description[ENGLISH][12] = "Go back to Florain if you need more tasks."
Description[GERMAN][13] = "Gehe zu Madeline Clarbelis und frag sie nach einer Aufgabe. Sie ist im Turm der Erde. Der Turm der Erde kann vom Runewick Marktplatz erreicht werden, indem man durch den Turm des Feuers im Norden geht und diesen zum Osten hin verl�sst. Madeline wird in ihre B�cher vertieft sein."
Description[ENGLISH][13] = "Go to Madeline Clarbelis and ask her for a task. She can be found in the Tower of Earth. The Tower of Earth can be reached from Runewick's marketplace, if you go through the Tower of Fire to the north and leave it to the east. Madeline will be reading her books."
Description[GERMAN][14] = "Gehe zu Florain zur�ck, wenn du weitere Aufgaben ben�tigst."
Description[ENGLISH][14] = "Go back to Florain if you need more tasks."
Description[GERMAN][15] = "Gehe zu Uriel Urch und frag ihn nach einer Aufgabe. Er kann im Turm des Feuers gefunden werden, dem Geb�ude n�dlich vom Runewick Marktplatz. Dort sitzt er im Untergeschoss an einem Tisch und l�sst sich von Rose Deepdelver mit Bier versorgen."
Description[ENGLISH][15] = "Go to Uriel Urch and ask him for a task. He can be found in the Tower of Fire, the building to the north of the Runewick's marketplace. He will be sitting at a table in the basement where Rose Deepdelver will be serving him beer."
Description[GERMAN][16] = "Gehe zu Florain zur�ck, wenn du weitere Aufgaben ben�tigst."
Description[ENGLISH][16] = "Go back to Florain if you need more tasks."
Description[GERMAN][17] = "Gehe zu Lilith Needlehand und frag sie nach einer Aufgabe. Sie ist im Untergeschoss vom Turm des Feuers, das Geb�ude n�rdlich des Marktplatzes von Runewick. Sie ist in ihrer Werkstatt zu finden, gleich um die Ecke von Uriel Urch."
Description[ENGLISH][17] = "Go to Lilith Needlehand and ask her for a task. She can be found in the basement of the Tower of Fire, the building to the north of Runewick's marketplace. She will be in her workshop right around the corner from Uriel Urch."
Description[GERMAN][18] = "Florain Dreyndel kannn dir nun nicht mehr weiterhelfen. Frage einfach jeden, den du triffst nach Aufgaben und du wirst gut zurecktkommen."
Description[ENGLISH][18] = "Florain Dreyndel cannot help you any further now. Just ask everyone you meet for tasks and you will get around just fine."

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(904, 827, 0)} -- Daniel
QuestTarget[2] = {position(786, 823, 0)} -- Florain
QuestTarget[3] = {position(905, 780, 0)} -- Judith
QuestTarget[4] = {position(786, 823, 0)} -- Florain
QuestTarget[5] = {position(900, 800, 1)} -- Zassaria
QuestTarget[6] = {position(786, 823, 0)} -- Florain
QuestTarget[7] = {position(897, 781, 2 )} -- Neiran
QuestTarget[8] = {position(786, 823, 0)} -- Florain
QuestTarget[9] = {position(941, 790, 0)} -- Baldo
QuestTarget[10] = {position(786, 823, 0)} -- Florain
QuestTarget[11] = {position(791, 798, 0)} -- Nana
QuestTarget[12] = {position(786, 823, 0)} -- Florain
QuestTarget[13] = {position(951, 766, 1)} -- Madeline
QuestTarget[14] = {position(786, 823, 0)} -- Florain
QuestTarget[15] = {position(902, 773, 0)} -- Uriel
QuestTarget[16] = {position(786, 823, 0)} -- Florain
QuestTarget[17] = {position(893, 756, 0)} -- Lilith
QuestTarget[18] = {position(786, 823, 0)} -- Florain

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 18


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