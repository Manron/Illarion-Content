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
require("monster.base.base")
require("item.gems")
require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("monster.base.kills")
require("base.arena")
require("base.messages");
module("monster.mon_12_beholders", package.seeall)

--To do: Random Messages

function ini(Monster)

init=true;
    monster.base.quests.iniQuests();
    killer={}; --A list that keeps track of who attacked the monster last

    --Random Messages

    msgs = base.messages.Messages();
    msgs:addMessage("#me starrt aus vielen Augen.", "#me stares with multiple eyes.");
    msgs:addMessage("#me guckt.", "#me goggles.");
    msgs:addMessage("#me schwebt einen Meter �ber dem Boden.", "#me floats three feet over the ground.");
    msgs:addMessage("Die Sch�nheit liegt in meinen Augen!", "Beauty is in my eyes!");
    msgs:addMessage("Ich habe das gesehen!", "I saw that!");	
    msgs:addMessage("#me ist eine beeindruckende Sph�re, die wie durch Magie �ber dem Boden schwebt.", "#me is an impressive sphere that floats over the ground by magic.");	
    msgs:addMessage("#me zwinkert mit einem Auge.", "#me blinks with one of its eyes.");
    msgs:addMessage("Ich geh�re keinem Zauberer.", "I am not the property of any wizard.");
    msgs:addMessage("Da werd ich mal ein Auge zudr�cken.","I'll turn a blind eye to you.");
    msgs:addMessage("Gehorche.","Obey me.");
	
end

function onSpawn(Monster)
    
	-- Regeneration for high level monsters >= level 7
	local MonID=Monster:getMonsterType() 
	if MonID == 125 or MonID == 124 or MonID == 123 then --Terror Eyes, Deadly Eye, Eye of Horror
		local find, reg_effect = Monster.effects:find(2);
		if not find then
			Monster.effects:addEffect( LongTimeEffect(2,10) );
		end
	end
end

function enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end
	
    local MonID=Monster:getMonsterType();
	if (MonID==124) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,5,{2000,4000},{{44,5},{4,5},{51,5}},{},40,1,{25,65}) == true );
    else
        return false;
    end
end


function enemyOnSight(Monster,Enemy)
    if init==nil then
        ini(Monster);
        firstWP={};
    end

    monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
	if monster.base.base.isMonsterArcherInRange(Monster, Enemy) then
		return true
	end

    local MonID=Monster:getMonsterType();
    if monster.base.drop.DefaultSlowdown( Monster ) then
        return true
    elseif (MonID==124) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,5,{2000,4000},{{44,5},{4,5},{51,5}},{},40,1,{25,65}) == true );
    else
        return false
    end
end

function onAttacked(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end
    monster.base.kills.setLastAttacker(Monster,Enemy)
    killer[Monster.id]=Enemy.id; --Keeps track who attacked the monster last
end

function onCasted(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end
    monster.base.kills.setLastAttacker(Monster,Enemy)
    killer[Monster.id]=Enemy.id; --Keeps track who attacked the monster last
end

function onDeath(Monster)

    if base.arena.isArenaMonster(Monster) then
        return
    end

	
    if killer and killer[Monster.id] ~= nil then

        murderer=getCharForId(killer[Monster.id]);
    
        if murderer then --Checking for quests

            monster.base.quests.checkQuest(murderer,Monster);
            killer[Monster.id]=nil;
            murderer=nil;

        end
    end

    monster.base.drop.ClearDropping();
    local MonID=Monster:getMonsterType();

    if (MonID==121) then --Gazer, Level: 6, Armourtype: medium, Weapontype: wrestling

        --Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(251,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --raw amethyst
        if not done then done=monster.base.drop.AddDropItem(253,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --raw sapphire
        if not done then done=monster.base.drop.AddDropItem(256,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --raw emerald
        if not done then done=monster.base.drop.AddDropItem(251,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --raw raw amethyst
        if not done then done=monster.base.drop.AddDropItem(257,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --raw topaz

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(198,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --topaz
        if not done then done=monster.base.drop.AddDropItem(284,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --sapphire
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --ruby
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --obsidian
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --emerald

        --Category 3: Rings

        local done=monster.base.drop.AddDropItem(281,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --emerald ring
        if not done then done=monster.base.drop.AddDropItem(277,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --amethyst ring
        if not done then done=monster.base.drop.AddDropItem(68,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --ruby ring
        if not done then done=monster.base.drop.AddDropItem(280,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --diamond ring
        if not done then done=monster.base.drop.AddDropItem(282,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --topaz ring

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(2,5),100,333,0,4); --silver coins


    elseif (MonID==122) then --Googly, Level: 6, Armourtype: light, Weapontype: puncture

        --Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(255,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --raw ruby
        if not done then done=monster.base.drop.AddDropItem(256,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --raw emerald
        if not done then done=monster.base.drop.AddDropItem(251,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --raw amethyst
        if not done then done=monster.base.drop.AddDropItem(253,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --raw sapphire
        if not done then done=monster.base.drop.AddDropItem(252,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --raw obsidian

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(45,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --emerald
        if not done then done=monster.base.drop.AddDropItem(46,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --ruby
        if not done then done=monster.base.drop.AddDropItem(285,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --diamond
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --topaz
        if not done then done=monster.base.drop.AddDropItem(197,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --amethyst

        --Category 3: Rings

        local done=monster.base.drop.AddDropItem(277,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --amethyst ring
        if not done then done=monster.base.drop.AddDropItem(68,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --ruby ring
        if not done then done=monster.base.drop.AddDropItem(282,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --topaz ring
        if not done then done=monster.base.drop.AddDropItem(281,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --emerald ring
        if not done then done=monster.base.drop.AddDropItem(280,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --diamond ring

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(2,5),100,333,0,4); --silver coins


    elseif (MonID==123) then --Eye of Horror, Level: 7, Armourtype: heavy, Weapontype: wrestling

        --Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(255,1,20,(100*math.random(6,7)+math.random(66,77)),0,1); --raw ruby
        if not done then done=monster.base.drop.AddDropItem(253,1,10,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw obsidian
        if not done then done=monster.base.drop.AddDropItem(257,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw topaz
        if not done then done=monster.base.drop.AddDropItem(252,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw obsidian
        if not done then done=monster.base.drop.AddDropItem(256,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw emerald

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(46,1,20,(100*math.random(6,7)+math.random(66,77)),0,2); --ruby
        if not done then done=monster.base.drop.AddDropItem(284,1,10,(100*math.random(6,7)+math.random(66,77)),0,2); end --sapphire
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --topaz
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --obsidian
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --emerald

        --Category 3: Rings

        local done=monster.base.drop.AddDropItem(68,1,20,(100*math.random(6,7)+math.random(66,77)),0,3); --ruby ring
        if not done then done=monster.base.drop.AddDropItem(279,1,10,(100*math.random(6,7)+math.random(66,77)),0,3); end --sapphire ring
        if not done then done=monster.base.drop.AddDropItem(282,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --topaz ring
        if not done then done=monster.base.drop.AddDropItem(278,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --obsidian ring
        if not done then done=monster.base.drop.AddDropItem(281,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --emerald ring

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(10,30),100,333,0,4); --silver coins


    elseif (MonID==124) then --Deadly Eye, Level: 7, Armourtype: medium, Weapontype: slashing

        --Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(251,1,20,(100*math.random(6,7)+math.random(66,77)),0,1); --raw amethyst
        if not done then done=monster.base.drop.AddDropItem(256,1,10,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw emerald
        if not done then done=monster.base.drop.AddDropItem(255,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw ruby
        if not done then done=monster.base.drop.AddDropItem(254,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw diamond
        if not done then done=monster.base.drop.AddDropItem(257,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw topaz

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(197,1,20,(100*math.random(6,7)+math.random(66,77)),0,2); --amethyst
        if not done then done=monster.base.drop.AddDropItem(45,1,10,(100*math.random(6,7)+math.random(66,77)),0,2); end --emerald
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --ruby
        if not done then done=monster.base.drop.AddDropItem(285,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --diamond
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --topaz

        --Category 3: Rings

        local done=monster.base.drop.AddDropItem(277,1,20,(100*math.random(6,7)+math.random(66,77)),0,3); --amethyst ring
        if not done then done=monster.base.drop.AddDropItem(281,1,10,(100*math.random(6,7)+math.random(66,77)),0,3); end --emerald ring
        if not done then done=monster.base.drop.AddDropItem(68,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --ruby ring
        if not done then done=monster.base.drop.AddDropItem(280,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --diamond ring
        if not done then done=monster.base.drop.AddDropItem(282,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --topaz ring

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(10,30),100,333,0,4); --silver coins


    elseif (MonID==125) then --Terror Eye, Level: 8, Armourtype: heavy, Weapontype: dagger

        --Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(256,1,20,(100*math.random(7,8)+math.random(77,88)),0,1); --raw emerald
        if not done then done=monster.base.drop.AddDropItem(252,1,10,(100*math.random(7,8)+math.random(77,88)),0,1); end --raw obsidian
        if not done then done=monster.base.drop.AddDropItem(253,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --raw sapphire
        if not done then done=monster.base.drop.AddDropItem(257,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --raw topaz
        if not done then done=monster.base.drop.AddDropItem(254,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --raw diamond

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(45,1,20,(100*math.random(7,8)+math.random(77,88)),0,2); --emerald
        if not done then done=monster.base.drop.AddDropItem(283,1,10,(100*math.random(7,8)+math.random(77,88)),0,2); end --obsidian
        if not done then done=monster.base.drop.AddDropItem(284,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --sapphire
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --topaz
        if not done then done=monster.base.drop.AddDropItem(item.gems.getMagicGemId(item.gems.SAPPHIRE),1,1,999,item.gems.getMagicGemData(1),2); end --magic sapphire

        --Category 3: Rings

        local done=monster.base.drop.AddDropItem(281,1,20,(100*math.random(7,8)+math.random(77,88)),0,3); --emerald ring
        if not done then done=monster.base.drop.AddDropItem(278,1,10,(100*math.random(7,8)+math.random(77,88)),0,3); end --obsidian ring
        if not done then done=monster.base.drop.AddDropItem(279,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --sapphire ring
        if not done then done=monster.base.drop.AddDropItem(272,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --topaz ring
        if not done then done=monster.base.drop.AddDropItem(280,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --diamond ring

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(30,90),100,333,0,4); --silver coins

    elseif (MonID==126) then
        -- Drops
    elseif (MonID==127) then
        --Drops
    elseif (MonID==128) then
        --Drops
    elseif (MonID==129) then
        --Drops
    else
        --Drops
    end
    monster.base.drop.Dropping(Monster);
end
