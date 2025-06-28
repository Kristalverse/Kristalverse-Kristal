local item, super = Class(Item, "demonscythe")

function item:init()
    super.init(self)

    self.name = "DemonScythe"

    self.type = "weapon"
    self.icon = "ui/menu/icon/scythe"

    self.effect = ""
    self.shop = ""
    self.description = "A basic scythe made using the horn of a demon."

    self.price = 80
    self.can_sell = true

    self.target = "none"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

    self.bonuses = {
        attack = 0,
    }
    self.bonus_name = nil
    self.bonus_icon = nil

    self.can_equip = {}

    self.reactions = {
        jevil = "Nah, I've outgrown that thing.",
        susie = "Nope, I'm not using that.",
        ralsei = "Th-that's too heavy for me, hah.",
        noelle = "U-um, I feel like I shouldn't touch it."
    }
end

return item