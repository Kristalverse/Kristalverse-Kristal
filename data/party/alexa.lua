local character, super = Class(PartyMember, "alexa")

function character:init()
    super:init(self)

    -- Display name
    self.name = "Alexa"

    -- Actor ID (handles overworld/battle sprites)
    self:setActor(Game:getFlag("AlexaSprite", "alexa"))
    -- Light World Actor ID (handles overworld/battle sprites in light world maps) (optional)
    self:setLightActor(Game:getFlag("AlexaSprite", "alexa"))

    -- Display level (saved to the save file)
    self.level = 2
    -- Default title / class (saved to the save file)
    self.title = "Deoxynn victim\nFears will drive\nher to insanity."

    -- Determines which character the soul comes from (higher number = higher priority)
    self.soul_priority = 2

    -- Whether the party member can act / use spells
    self.has_act = true
    self.has_spells = true
	self.has_xact = false

    -- X-Action name (displayed in this character's spell menu)
    self.xact_name = "?-Action"
	
	-- Skills
	self:addSpell("tattle")
	self:addSpell("breathe")
	self:addSpell("first_aid")
	self:addSpell("cure")

    -- Current health (saved to the save file)
    self.health = 100

    -- Base stats (saved to the save file)
    self.stats = {
        health = 100,
        attack = 12,
        defense = 2,
        magic = 0
    }

    -- Weapon icon in equip menu
    self.weapon_icon = "ui/menu/equip/sword"
	-- Equipment (saved to the save file)
    self:setWeapon("kitchen_knife")

    -- Character color (for action box outline and hp bar)
    self.color = {253/255, 190/255, 219/255}
    -- Damage color (for the number when attacking enemies) (defaults to the main color)
    self.dmg_color = {1, 0, 0}
    -- Attack bar color (for the target bar used in attack mode) (shouldn't ever show up in this mod)
    self.attack_bar_color = {0, 162/255, 232/255}
    -- Attack box color (for the attack area in attack mode) (shouldn't ever show up in this mod)
    self.attack_box_color = {0, 0, 1}
    -- X-Action color (for the color of X-Action menu items) (shouldn't ever show up in this mod)
    self.xact_color = {0.5, 1, 1}
    self.soul_color = {255/255, 142/255, 248/255}

    -- Head icon in the equip / power menu
    self.menu_icon = Game:getFlag("AlexaHead", "party/alexa/head")
    -- Path to head icons used in battle
    self.head_icons = "party/alexa/icon"
    -- Name sprite (TODO: optional)
    self.name_sprite = "party/alexa/name"

    -- Effect shown above enemy after attacking it
    self.attack_sprite = "effects/attack/cut"
    -- Sound played when this character attacks
    self.attack_sound = "laz_c"
    -- Pitch of the attack sound
    self.attack_pitch = 1

    -- Battle position offset (optional)
    self.battle_offset = {2, 1}
    -- Head icon position offset (optional)
    self.head_icon_offset = nil
    -- Menu icon position offset (optional)
    self.menu_icon_offset = nil
	
	-- Statuses
	self.poison = false
	self.sleep = false
	self.sleep_timer = 0
	self.shock = false
	self.shock_timer = 0

	self.leader_desc = "Refuses to FIGHT unless she reaches her LIMIT.\nCan ACT and use skills to help her party in battle."
end

function character:getSoulColor()
	return 255/255, 142/255, 248/255, 1
end

function character:canEquip(item, slot_type, slot_index)
	if item then
		return super:canEquip(self, item, slot_type, slot_index)
	else
		local item
		if slot_type == "weapon" then
			return false
		else
			return true
		end
		return false
	end
end

function character:onTurnStart(battler)
	if self.sleep then
		Game.battle:pushForcedAction(battler, "SKIP")
	elseif Game.battle and Game.battle.encounter.insane then
		if math.random(1,10) == 7 and string.upper(Game.save_name) ~= "MURPHY" then
			Game.battle:pushForcedAction(battler, "AUTOATTACK", Game.battle:getActiveEnemies()[1], nil, {points = 175})
		else
			Game.battle:pushForcedAction(battler, "AUTOATTACK", Game.battle:getActiveEnemies()[1], nil, {points = 150})
		end
		if Game:getFlag("Route_B", "Sane") == "Sane" then
			Game:setFlag("Route_B", "Pacifist")
		end
	end
end

function character:drawPowerStat(index, x, y, menu)
    if index == 1 then
        local icon = Assets.getTexture("ui/menu/icon/smile")
        love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Insanity:", x, y)
        love.graphics.print(Game:getFlag("Insanity", 0), x+130, y)
        return true
    end
	if index == 2 then
        local icon = Assets.getTexture("ui/menu/icon/heart")
		if Game:getFlag("Route_B") == "Insanity" then
			icon = Assets.getTexture("ui/menu/icon/sword")
		end
        love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
			love.graphics.print(Game:getFlag("Route_B", "Sane"), x, y)
        return true
    end
end

function character:getTitle() return self.title end

return character
