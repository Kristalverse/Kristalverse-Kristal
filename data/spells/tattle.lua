local spell, super = Class(Spell, "tattle")

function spell:init()
    super:init(self)

    -- Display name
    self.name = "Tattle"

    -- Battle description
    self.effect = "Learn\nEnemy"
    -- Menu description
    self.description = "I can figure out about enemies and see how I can spare them!"

    -- TP cost
    self.cost = 0

    -- Target mode (party, enemy, or none/nil)
    self.target = "enemy"

    -- Tags that apply to this spell
    self.tags = {"check"}
end

function spell:getCastMessage(user, target)
    return target:getTattleText()
end

return spell