--------------------------------------------------------------------------------
-- NPC Name: Fijanna Spuall                                              None --
-- NPC Job:  fortune teller                                                   --
--                                                                            --
-- NPC Race: human                      NPC Position:  670, 323, 0            --
-- NPC Sex:  female                     NPC Direction: south                  --
--                                                                            --
-- Author:   Miriam                                                           --
--                                                                            --
-- Last parsing: September 30, 2012                      easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 670, 323, 0, 4, 'Fijanna Spuall', 'npc.fijanna_spuall', 1, 1, 0, 188, 91, 13, 253, 227, 205);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.condition.money")
require("npc.base.condition.state")
require("npc.base.consequence.inform")
require("npc.base.consequence.money")
require("npc.base.consequence.state")
require("npc.base.talk")
require("npc.base.trade")
module("npc.fijanna_spuall", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
local tradingNPC = npc.base.trade.tradeNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Fijanna Spuall the fortune teler. Keywords: TRIGGER1, TRIGGER2, TRIGGER3, TRIGGER4, TRIGGER5."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Fijanna Spuall die Wahrsagerin. Schl�sselw�rter: TRIGGER1, TRIGGER2, TRIGGER3, TRIGGER4, TRIGGER5."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greet");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addTrigger("Good night");
talkEntry:addResponse("Be greeted in the name of the godess of air.");
talkEntry:addResponse("Greetings, traveler.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gr��");
talkEntry:addTrigger("Gru�");
talkEntry:addTrigger("Guten Morgen");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Gute Nacht");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addTrigger("Mohltied");
talkEntry:addResponse("Sei gegr��t im Namen der G�ttin der Luft.");
talkEntry:addResponse("Sei gegr��t, Reisender.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Be greeted in the name of the godess of air.");
talkEntry:addResponse("Greetings, traveler.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Sei gegr��t im Namen der G�ttin der Luft.");
talkEntry:addResponse("Sei gegr��t, Reisender.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("May Findari watch over you.");
talkEntry:addResponse("Save paths, traveler.");
talkEntry:addResponse("Fare well.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tsch��");
talkEntry:addTrigger("Tsch�ss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("M�ge Findari �ber dichh wachen.");
talkEntry:addResponse("Sichere Pfade, Reisender.");
talkEntry:addResponse("Auf Bald.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("May Findari watch over you.");
talkEntry:addResponse("Save paths, traveler.");
talkEntry:addResponse("Fare well.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("M�ge Findari �ber dichh wachen.");
talkEntry:addResponse("Sichere Pfade, Reisender.");
talkEntry:addResponse("Auf Bald.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I feel the wind. I know where it went. And I know the places where it will go. Do you feel the wind?");
talkEntry:addResponse("I feel as light as air.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie f�hlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Ich sp�re den Wind. Ich wei� woher er kam und wohin er geht. Sp�rst du den Wind?");
talkEntry:addResponse("Ich f�hle mich so leicht wie Luft.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am Fijanna Spuall, a travelling Seer.");
talkEntry:addResponse("I am a travelling priest of the godess of air. My name is Fijanna. Nice to meet you.");
talkEntry:addResponse("My Name is Fijanna. Nice to meet you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie hei�t");
talkEntry:addResponse("Ich bin Fijanna Spuall, eine wandernde Seherin.");
talkEntry:addResponse("Ich bin eine reisende Prieserin der G�tin der Luft. Ich hei�e Fijanna. Es freut mich dich zu treffen.");
talkEntry:addResponse("Ich hei�e Fijanna. Freut mich dich zu sehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("fortune");
talkEntry:addResponse("I'll tell you your future, if you give me a silver coin in retun. Do you to hear about your fortune?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zukunft");
talkEntry:addResponse("Ich sage dir deine Zukunft vorraus, wenn du mir daf�r ein Silberst�ck gibst. M�chtest du etwas �ber deine deine Zukunft h�ren?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Very well. I shall tell your fortune. What do you want to hear?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Gut. Ich werde deine Zukunft lesen. Wor�ber m�chtest du etwas erfahren?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addTrigger("No");
talkEntry:addTrigger("Thanks");
talkEntry:addResponse("Come back, anxtime you want to hear bout your fortune.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Danke");
talkEntry:addResponse("Komm einfach wieder vorbei wenn dfu etwas �ber deine Zukunft erfahren m�chtest.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("*.");
talkEntry:addResponse("Do you want to hear your Fortune in exange for a silvercoin? Say yes or no.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addTrigger("*.");
talkEntry:addResponse("Willst du deine Zukunft im Tausch f�r ein Silberst�ck gesagt bekommen? Antwortet einfach mit ja oder nein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addTrigger("*");
talkEntry:addResponse(". . . lauf!");
talkEntry:addResponse("Du wirst strake Freunde brauchen.");
talkEntry:addResponse("Gibt in n�chster Zeit gut auf dich Acht.");
talkEntry:addResponse("Meide Schwierigkeiten soweit es geht.");
talkEntry:addResponse("Gehe Monstern besser aus dem Weg, sonst erwartet dich Ungl�ck.");
talkEntry:addResponse("Du wirst in n�chster Zeit viel Gl�ck gebrauchen k�nnen.");
talkEntry:addResponse("Sei in n�chster Zeit sehr vorsichtig.");
talkEntry:addResponse("Besser du meidest unn�tige Gefahren.");
talkEntry:addResponse("Es tut mir leid. Dich erwartet eine Entt�uschung.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addTrigger("*");
talkEntry:addResponse(". . . run!");
talkEntry:addResponse("You'll need stromg friends");
talkEntry:addResponse("Take good care of yourself during the next days.");
talkEntry:addResponse("Stray away from trouble as far es possible.");
talkEntry:addResponse("Avoiding monsters, will keep you save.");
talkEntry:addResponse("In the near future you'll need lots of luck.");
talkEntry:addResponse("In the near future you'd better be very carefull.");
talkEntry:addResponse("It would be wise to avoid un0necssary danger");
talkEntry:addResponse("I'm sorry. You will experience a disappointment.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addTrigger("*");
talkEntry:addResponse("Bedenke, Hochmut kommt vor dem Fall.");
talkEntry:addResponse("Bedenke: Wer Streit sucht, wird �rger finden.");
talkEntry:addResponse("Wie man sich bettet so liegt man. Denke dar�ber nach.");
talkEntry:addResponse("Sei freundlich zu anderen und sie werden freundlich zu dir sein.");
talkEntry:addResponse("L�cheln und Lachen sind T�r und Pforte durch die viel Gutes in den Menschen hineinschl�pfen kann");
talkEntry:addResponse("Du wirst ein Abenteuer erleben.");
talkEntry:addResponse("Du wirst Ruhm erlangen, aber du musst auch etwas daf�r tun.");
talkEntry:addResponse("Gib auf dich Acht, das ist alles was ich dir raten kann.");
talkEntry:addResponse("Gib Acht, dass du dir keine Feide machst.");
talkEntry:addResponse("Fordere das Gl�ck nicht herraus.");
talkEntry:addResponse("�rgere die G�tter nicht.");
talkEntry:addResponse("Du wirst eine neue Bekanntschaft machen.");
talkEntry:addResponse("Harte Arbeit wird sich f�r dich auszahlen.");
talkEntry:addResponse("Sei flei�ig und du wirst es nicht bereuhen.");
talkEntry:addResponse("Glaube an dich selbst, und du wirst gro�es erreichen");
talkEntry:addResponse("Du wirst Ruhm erlangen, aber du musst auch etwas daf�r tun.");
talkEntry:addResponse("Alles was du brauchst ist Glaube an dich und an deine F�higkeiten.");
talkEntry:addResponse("Denke Positiv, das ist der einzige Rat den ich dir geben kann.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addTrigger("*");
talkEntry:addResponse("Pride will have a fall");
talkEntry:addResponse("Consider this, if you sow mischeif, you'll reap fighting.");
talkEntry:addResponse("As you make your bed so you must lie on it. Condsider this well.");
talkEntry:addResponse("Be friendly and others will be friendly to you aswell.");
talkEntry:addResponse("Smiling and laugthing will like be open the doors for the good things in life.");
talkEntry:addResponse("You will go on an adventure.");
talkEntry:addResponse("You will arcive fame but you'll have to work for that.");
talkEntry:addResponse("Take good care of yourself, that's all I can tell you.");
talkEntry:addResponse("Be carefull not to make enemies.");
talkEntry:addResponse("Don't try your luck.");
talkEntry:addResponse("Don't anger the gods.");
talkEntry:addResponse(" You'll a make a new acquaintance.");
talkEntry:addResponse("Hard work will pay off.");
talkEntry:addResponse("Work diligent and you won't reget it.");
talkEntry:addResponse("Belive in yozrself, and you'll achive great things.");
talkEntry:addResponse("You'll be famous one day, but you have to work for it.");
talkEntry:addResponse("Think positiv, that's the only advice I can give you.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addTrigger("*");
talkEntry:addResponse("Dich erwartet Reichtum");
talkEntry:addResponse("Du wirst ein Geschenk bekommen.");
talkEntry:addResponse("Du wirst Geld finden.");
talkEntry:addResponse("Du wirst in n�chster Zeit gro�es Gl�ck haben.");
talkEntry:addResponse("Du wirst positive Erfahrungen machen.");
talkEntry:addResponse("Du wirst neue Freunde finden.");
talkEntry:addResponse("Du wirst das Gute in anderen erkennen.");
talkEntry:addResponse("Du wirst einen neuen Freund finden.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addTrigger("*");
talkEntry:addResponse("Wealth is waiting for you.");
talkEntry:addResponse("You will recive a present.");
talkEntry:addResponse("You will be very lucky in the near futur.");
talkEntry:addResponse("You will make a positive expirience.");
talkEntry:addResponse("You'll find new friends.");
talkEntry:addResponse("You'll see the good in others.");
talkEntry:addResponse("You'll find a new friend.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am a fortune teller. You know what a fortune teller does?");
talkEntry:addResponse("I listen to the wind and the people.");
talkEntry:addResponse("People come and ask me for advice, so I give advice.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin eine Wahrsagerin. Wisst ihr was eine Wahrsagerin tut?");
talkEntry:addResponse("Ich h�re dem Wind und den Leuten zu.");
talkEntry:addResponse("Die Leute kommen und fragen mich um Rat, also gebe ich Rat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I am a fortune teller. You know what a fortune teller does?");
talkEntry:addResponse("I listen to the wind and the people.");
talkEntry:addResponse("People come and ask me for advice, so I give advice.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin eine Wahrsagerin. Wisst ihr was eine Wahrsagerin tut?");
talkEntry:addResponse("Ich h�re dem Wind und den Leuten zu.");
talkEntry:addResponse("Die Leute kommen und fragen mich um Rat, also gebe ich Rat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("We all breath air. So do the aniimals and the plants.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erz�hl was");
talkEntry:addTrigger("erz�hl etwas");
talkEntry:addResponse("Wir alle atmen Luft. Auch die Tiere und Pflanzen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Oh, the godness of air. All my prayers are for her.");
talkEntry:addResponse("Yes, the godness of air. All my doing is done to serve her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Oh, die G�ittin der Luft. All meine Gebete gelten ihr.");
talkEntry:addResponse("Ja, die G�ttin der Luft, alle mein Tun ist getan um ihr zu dienen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("I feel the wind...");
talkEntry:addResponse("Can you hear the wind?");
talkEntry:addResponse("#me closes her eyes for a moment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ich sp�re den Wind...");
talkEntry:addResponse("Kannst du den Wind h�ren?");
talkEntry:addResponse("#me schlie�t f�r einen Moment ihre Augen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me breitet ihre Arme im Wind aus.", "#me streches her arms to the wind.");
talkingNPC:addCycleText("#me l�chelt.", "#me smilies.");
talkingNPC:addCycleText("#me schlie�t f�r einen Moment ihre Augen.", "#me closes her eyes for a moment.");
talkingNPC:addCycleText("Ich sp�re den Wind...", "I feel the wind...");
talkingNPC:addCycleText("Kannst du den Wind h�ren?", "Can you hear the wind?");
talkingNPC:addCycleText("#me atmet tief ein.", "#me takes a deep breath.");
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(3,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(3,"buySecondary"));
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Fijanna Spuall die Wahrsagerin.", "This NPC is Fijanna Spuall the fortune teller.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 182);
mainNPC:setEquipment(11, 2421);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 2295);
mainNPC:setEquipment(9, 34);
mainNPC:setEquipment(10, 53);
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(npcChar, texttype, message, speaker) mainNPC:receiveText(npcChar, speaker, message); end;
function nextCycle(npcChar) mainNPC:nextCycle(npcChar); end;
function lookAtNpc(npcChar, char, mode) mainNPC:lookAt(npcChar, char, mode); end;
function useNPC(npcChar, char, counter, param) mainNPC:use(npcChar, char); end;
initNpc();
initNpc = nil;
-- END