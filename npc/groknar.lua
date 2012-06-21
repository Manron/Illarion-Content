--------------------------------------------------------------------------------
-- NPC Name: Groknar                                                     None --
-- NPC Job:  herder                                                           --
--                                                                            --
-- NPC Race: orc                        NPC Position:  41, 46, 100            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Authors:  Rincewind                                                        --
--           Estralis Seborian                                                --
--                                                                            --
-- Last parsing: June 20, 2012                           easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (4, 41, 46, 100, 6, 'Groknar', 'npc.groknar', 0, 3, 0, 119, 28, 0, 84, 113, 46);
---]]

require("npc.base.basic")
require("npc.base.condition.quest")
require("npc.base.condition.sex")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.consequence.warp")
require("npc.base.talk")
module("npc.groknar", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("reset");
talkEntry:addResponse("Noobia reset!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(309, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(310, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(311, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] This NPC is the Tutor Groknar. Keywords: Hello, help, skip tutorial."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Dieser NPC ist der Tutor Groknar. Schl�sselw�rter: Hallo, Hilfe, Tutorial �berspringen."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("skip");
talkEntry:addTrigger("cancel");
talkEntry:addTrigger("abort");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] You decided to skip the tutorial. Please chose a faction now by DOING THIS AND THAT."));
talkEntry:addConsequence(npc.base.consequence.warp.warp(0, 0, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("�berspring");
talkEntry:addTrigger("abbrech");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] �BERSETZEN."));
talkEntry:addConsequence(npc.base.consequence.warp.warp(0, 0, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=", 0));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addResponse("Hurr, Fremder. Ich bin Groknar der Schweinehirte. Wenn du dich anderen Spielern vorstellen m�chtest schreibe '#i und deinen Namen' in die Sprachkonsole, Personen in deiner N�he werden dann den Namen deines Helden �ber seinem Kopf lesen k�nnen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(311, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=", 0));
talkEntry:addResponse("Hurr, Fremder. Ich bin Groknar der Schweinehirte. Wenn du dich anderen Spielern vorstellen m�chtest schreibe '#i und deinen Namen' in die Sprachkonsole, Personen in deiner N�he werden dann den Namen deiner Heldin �ber ihrem Kopf lesen k�nnen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(311, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("#i.*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=", 1));
talkEntry:addResponse("Nun, du hast sicher eine Menge Abenteuer vor dir, %CHARNAME. Darum werde ich dir jetzt erkl�ren wie du k�mpfen kannst. Attackiere eines der Schweine indem du dies und das machst, keine Sorge Schweine w�hren sich in der Regel nicht.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(311, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=", 1));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addResponse("Wenn du dich anderen Spielern vorstellen m�chtest schreibe '#i und deinen Namen' in die Sprachkonsole, Personen in deiner N�he werden dann den Namen deines Helden �ber seinem Kopf lesen k�nnen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=", 1));
talkEntry:addResponse("Wenn du dich anderen Spielern vorstellen m�chtest schreibe '#i und deinen Namen' in die Sprachkonsole, Personen in deiner N�he werden dann den Namen deiner Heldin �ber ihrem Kopf lesen k�nnen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=", 6));
talkEntry:addResponse("Folge nun weiter der Stra�e und sprich mit den Leuten auf deinem Weg. Gute weiterreise %CHARNAME!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(311, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=", 5));
talkEntry:addCondition(npc.base.condition.quest.quest(314, "=", 1));
talkEntry:addResponse(" Folge nun weiter der Stra�e und sprich mit den Leuten auf deinem Weg. Gute weiterreise %CHARNAME!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(311, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=", 5));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Du erh�ltst eine schwere Holzkeule zur Belohnung."));
talkEntry:addResponse("Hurr, es ist gef�hrlich da drau�en. Hier, nimm zur Sicherheit diese Keule mit. Folge nun weiter der Stra�e und sprich mit den Leuten auf deinem Weg. Gute weiterreise %CHARNAME!");
talkEntry:addConsequence(npc.base.consequence.item.item(2664, 1, 555, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(311, "=", 6));
talkEntry:addConsequence(npc.base.consequence.quest.quest(314, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=", 4));
talkEntry:addResponse("Sehr sch�n. In zuk�nftigen K�mpfen wird die Zusammenstellung deiner Ausr�stung f�r dein �berleben entscheidend sein. So wie deine Erfahrung - Beispielsweise wirst du automatisch geschickter im Kampf mit Hiebwaffen wenn du ein Schwert schwingst.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(311, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=<", 3));
talkEntry:addResponse("T�te mindestens 2 Schweine. Greife Monster an indem du dies und das machst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me grunzt freundlich: 'Ich zeige dir wie du k�mpfst.'", "#me grunts while speaking: 'I will teach you how to fight.'");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("This is your tutorial guide Groknar the pig herder.", "Das ist dein Tutor Groknar, der Schweinehirte.");
mainNPC:setUseMessage("Finger weg!", "Do not touch me!");
mainNPC:setConfusedMessage("Bitte wechsle die Sprache deines Charakters zur Gemeinsprache, indem du DAS UND DAS TUST.", "Please switch the language of your character to the common tongue by DOING THIS AND THAT.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 363);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 17);
mainNPC:setEquipment(6, 2642);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 2113);
mainNPC:setEquipment(10, 697);
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(texttype, message, speaker) mainNPC:receiveText(speaker, message); end;
function nextCycle() mainNPC:nextCycle(); end;
function lookAtNpc(char, mode) mainNPC:lookAt(char, mode); end;
function useNPC(char, counter, param) mainNPC:use(char); end;
initNpc();
initNpc = nil;
-- END