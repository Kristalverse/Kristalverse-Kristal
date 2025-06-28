local BossFightMenu, super = Class(Object)

function BossFightMenu:init()
    super.init(self, SCREEN_WIDTH / 2 - 480 / 2, SCREEN_HEIGHT / 2 - 320 / 2, 480, 320)

    self.parallax_x = 0
    self.parallax_y = 0

    self.draw_children_below = 0

    self.bg = UIBox(0, 0, self.width, self.height)
    self.bg.layer = -1
    self.bg.debug_select = false
    self:addChild(self.bg)

    self.font = Assets.getFont("main")
    self.font_2 = Assets.getFont("plain")

    self.ui_move = Assets.newSound("ui_move")
    self.ui_select = Assets.newSound("ui_select")
    self.ui_cant_select = Assets.newSound("ui_cant_select")
    self.ui_cancel_small = Assets.newSound("ui_cancel_small")

    self.up_sprite = Assets.getTexture("ui/page_arrow_up")
    self.down_sprite = Assets.getTexture("ui/page_arrow_down")
    self.soul = Assets.getTexture("player/heart")

    self.currently_selected = 1
    self.page = 1

    self.bosses = {
        {"Dummy", "dummy"}
    }
end

function BossFightMenu:draw()
    if #self.bosses > self.page*10 then
        Draw.draw(self.down_sprite, 475, 310)
    end
    if self.currently_selected > 10 then
        Draw.draw(self.up_sprite, 475, 0)
    end
    love.graphics.setFont(self.font)
    love.graphics.printf("-BOSS REMATCH-", 0, 0, self.width, "center")
    love.graphics.setFont(self.font_2)
    love.graphics.printf("Press [B] to fight all bosses in a boss rush.", 0, -10, self.width, "center")
    for i, v in ipairs(self.bosses) do
        if i > (self.page * 10) - 10 and i <= self.page * 10 then
            love.graphics.setFont(self.font)
            love.graphics.print(v[1], 30, 0 + (i * 30) - ((self.page * 300) - 300))
        end
    end
    love.graphics.setColor(Game.party[1].soul_color)
    Draw.draw(self.soul, 0, 10 + (self.currently_selected * 30) - ((self.page * 300) - 300), 0, 1)

    super.draw(self)
end

function BossFightMenu:update()
    self.page = Utils.roundFromZero(self.currently_selected/10)
    if Input.pressed("cancel") then
        self.ui_cancel_small:stop()
        self.ui_cancel_small:play()
        Game.world:closeMenu()
        return
    end
    if Input.pressed("down") then
        self.ui_move:stop()
        self.ui_move:play()
        self.currently_selected = self.currently_selected + 1
        if self.currently_selected > #self.bosses then
            self.currently_selected = 1
        end
    end
    if Input.pressed("up") then
        self.ui_move:stop()
        self.ui_move:play()
        self.currently_selected = self.currently_selected - 1
        if self.currently_selected < 1 then
            self.currently_selected = #self.bosses
        end
    end
    if Input.pressed("confirm") then
        self.ui_select:stop()
        self.ui_select:play()
        Game.world:closeMenu()
        Game:encounter(self.bosses[self.currently_selected][2], true)
    end
    if Input.pressed("b") then
        self.ui_select:stop()
        self.ui_select:play()
        Game.world:closeMenu()
        Game.world:startCutscene(function(cutscene)
            for i, v in ipairs(self.bosses) do
                cutscene:text("* "..#self.bosses - (i-1).." left to go.[wait:10]\n* Up next:[wait:5] "..v[1]..".")
                Game:encounter(v[2], true)
                cutscene:wait(1)
            end
            cutscene:text("* Congratulations![wait:10] You win absolutely nothing!")
        end)
    end

    super.update(self)
end

function BossFightMenu:close()
    Game.world.menu = nil
    self:remove()
end

return BossFightMenu
