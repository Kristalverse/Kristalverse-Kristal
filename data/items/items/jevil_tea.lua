local item, super = Class(HealItem, "jevil_tea")

function item:init()
    super.init(self)

    self.name = "Jevil Tea"
    self.use_name = nil

    self.type = "item"
    self.icon = nil

    self.effect = "Healing\nvaries"
    self.shop = ""
    self.description = "It's own-flavored tea.\nThe flavor just says \"Jevil.\""

    self.heal_amount = 50
    self.heal_amounts = {
        ["kris"] = 60, --placeholder
        ["susie"] = 60, --placeholder
        ["ralsei"] = 60, --placeholder
        ["noelle"] = 60, --placeholder
        ["alexa"] = 60, --placeholder
        ["knight"] = 60, --placeholder
        ["jevil"] = 10,
    }

    self.price = 10
    self.can_sell = true

    self.target = "ally"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

    self.bonuses = {}
    self.bonus_name = nil
    self.bonus_icon = nil

    self.can_equip = {}

    self.reactions = {
    }
end

function item:getBattleHealAmount(id)
    return math.max(40, super.getBattleHealAmount(self, id))
end

return item