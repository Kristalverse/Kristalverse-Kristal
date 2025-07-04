local Knight, super = Class(PartyMember)

function Knight:init()
    super.init(self)

    self.name = "The Knight"
    self:setActor("knight")

    self.level = 1
    self.title = "An empty shell."

    self.soul_color = {0.2, 0.2, 0.2}

    self.has_spells = true
    self.has_act = false
    self.has_xact = false
    self:addSpell("vengefulspirit")
    --self:addSpell("quickfocus")
    --self:addSpell("quickslash")

    self:setArmor(1, "armors/voidheart")

    self.stats = {
        health = 90,
        attack = 10,
        defense = 3,
        magic = 13,
    }
    self.health = 90
    self.lifeblood = 0

    self.weapon_icon = "ui/menu/equip/sword"

    self.color = {0.8,0.8,0.8}
    self.dmg_color = {0.8,0.8,0.8}
    self.menu_icon = "party/knight/head"
    self.menu_icon_offset = {5, 0}
    self.head_icons = "party/knight/icon"
    self.name_sprite = "party/knight/name"
    self.battle_offset = {14,0}

    self.attack_sprite = "effects/attack/cut"
    self.attack_sound = "laz_c"
    self.attack_pitch = 0.8

    self.leader_desc = "Uses a Nail SOUL in combat, standard SOUL movement.\nCan swing the nail using \"Z\" and focus to heal using \"X\"."
end

--[[function Knight:getStat(name, default)
    local stat = (self.stats[name] or (default or 0)) + self:getEquipmentBonus(name)
    local bindings = Game:getFlag("bindings", {})
    if name == "attack" then
        if bindings.nail then
            stat = stat*0.7
        end
        if self:getArmor(2).id == "armors/fury" and self.health <= 15 then
            stat = stat*1.75
        end
    elseif name == "magic" and bindings.magic then
        stat = Utils.round(stat*0.8)
    end
    return stat
end]]

function Knight:canEquip(item, slot_type, slot_index)
    if slot_type == "armor" and slot_index == 1 then
        return false
    end
    return super:canEquip(self, item, slot_type, slot_index)
end

function Knight:getTitle()
    local title = "Vessel"
    --[[if self.level == 2 then
        title = "Attuned Vessel"
    elseif self.level == 3 then
        title = "Ascended Vessel"
    elseif self.level == 3 then
        title = "Pure Vessel"
    end]]
    return title.."\n"..self.title
end

return Knight
