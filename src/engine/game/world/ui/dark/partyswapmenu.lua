local PartySwapMenu, super = Class(Object)

function PartySwapMenu:init()
    super.init(self, SCREEN_WIDTH / 2 - 480 / 2, SCREEN_HEIGHT / 2 - 320 / 2, 480, 290)

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
    self.new_party = 1
    self.state = "SELECTING"
    self.page = 1
    
    self.leaders = Game:getFlag("unlocked_leaders")
    self.members = Game:getFlag("unlocked_members")
end

function PartySwapMenu:draw()
    if self.state == "SELECTING" then
        love.graphics.setFont(self.font)
        love.graphics.printf("-CHOOSE YOUR PARTY-", 0, 0, self.width, "center")
        for i, v in ipairs(Game.party) do
            local icon = Assets.getTexture("party/"..v.id.."/head")
            Draw.draw(icon, 10 + (i * 100), 50, 0, 2)
        end
        love.graphics.setColor(Game.party[1].soul_color)
        Draw.draw(self.soul, 28 + (self.currently_selected * 100), 95, 0, 1)
        love.graphics.setColor(1, 1, 1)
        love.graphics.printf("PARTY LEADER: "..Game.party[1].name, 0, 130, self.width, "center")
        love.graphics.setFont(self.font_2)
        love.graphics.printf(Game.party[1].leader_desc or "No leader effect.", 0, 165, self.width, "center")
    end
    if self.state == "MEMBERSELECT" then
        if #self.members > self.page*6 then
            Draw.draw(self.down_sprite, 475, 280)
        end
        if self.new_party > 6 then
            Draw.draw(self.up_sprite, 475, 0)
        end
        for i, v in ipairs(self.members) do
            local party = Game:getPartyMember(v)
            local icon = Assets.getTexture("party/"..v.."/head")
            if i > (self.page * 6) - 6 and i <= self.page * 6 then
                if v ~= Game.party[2].id and v ~= Game.party[3].id then
                    love.graphics.setColor(1, 1, 1)
                    Draw.draw(icon, 20, -50 + (i * 50) - ((self.page * 300) - 300), 0, 2)
                    love.graphics.setFont(self.font)
                    love.graphics.print(party.name, 70, -45 + (i * 50) - ((self.page * 300) - 300))
                    love.graphics.print(party.stats.health.." HP", 210, -55 + (i * 50) - ((self.page * 300) - 300))
                    love.graphics.print(party.stats.defense.." DEF", 210, -35 + (i * 50) - ((self.page * 300) - 300))
                    love.graphics.print(party.stats.attack.." ATK", 310, -55 + (i * 50) - ((self.page * 300) - 300))
                    love.graphics.print(party.stats.magic.." MGC", 310, -35 + (i * 50) - ((self.page * 300) - 300))
                else
                    love.graphics.setColor(0.3, 0.3, 0.3)
                    Draw.draw(icon, 20, -50 + (i * 50) - ((self.page * 300) - 300), 0, 2)
                    love.graphics.setFont(self.font)
                    love.graphics.print(party.name, 70, -45 + (i * 50) - ((self.page * 300) - 300))
                    love.graphics.print("Selected", 200, -45 + (i * 50) - ((self.page * 300) - 300))
                end
            end
            love.graphics.setColor(Game.party[1].soul_color)
            Draw.draw(self.soul, 0, -35 + (self.new_party * 50) - ((self.page * 300) - 300), 0, 1)
        end
    end
    if self.state == "LEADERSELECT" then
        if #self.leaders > self.page*6 then
            Draw.draw(self.down_sprite, 475, 280)
        end
        if self.new_party > 6 then
            Draw.draw(self.up_sprite, 475, 0)
        end
        for i, v in ipairs(self.leaders) do
            local party = Game:getPartyMember(v)
            local icon = Assets.getTexture("party/"..v.."/head")
            if i > (self.page * 6) - 6 and i <= self.page * 6 then
                if v ~= Game.party[1].id then
                    love.graphics.setColor(1, 1, 1)
                    Draw.draw(icon, 20, -50 + (i * 50) - ((self.page * 300) - 300), 0, 2)
                    love.graphics.setFont(self.font)
                    love.graphics.print(party.name, 70, -45 + (i * 50) - ((self.page * 300) - 300))
                    love.graphics.print(party.stats.health.." HP", 210, -55 + (i * 50) - ((self.page * 300) - 300))
                    love.graphics.print(party.stats.defense.." DEF", 210, -35 + (i * 50) - ((self.page * 300) - 300))
                    love.graphics.print(party.stats.attack.." ATK", 310, -55 + (i * 50) - ((self.page * 300) - 300))
                    love.graphics.print(party.stats.magic.." MGC", 310, -35 + (i * 50) - ((self.page * 300) - 300))
                else
                    love.graphics.setColor(0.3, 0.3, 0.3)
                    Draw.draw(icon, 20, -50 + (i * 50) - ((self.page * 300) - 300), 0, 2)
                    love.graphics.setFont(self.font)
                    love.graphics.print(party.name, 70, -45 + (i * 50) - ((self.page * 300) - 300))
                    love.graphics.print("Selected", 210, -45 + (i * 50) - ((self.page * 300) - 300))
                end
            end
            love.graphics.setColor(Game.party[1].soul_color)
            Draw.draw(self.soul, 0, -35 + (self.new_party * 50) - ((self.page * 300) - 300), 0, 1)
        end
    end

    super.draw(self)
end

function PartySwapMenu:update()
    if self.state == "SELECTING" then
        if Input.pressed("cancel") then
            self.ui_cancel_small:stop()
            self.ui_cancel_small:play()
            Game.world:closeMenu()
            return
        end
        if Input.pressed("confirm") then
            self.ui_select:stop()
            self.ui_select:play()
            if self.currently_selected == 1 then
                for i, v in ipairs(self.leaders) do
                    if v == Game.party[1].id then
                        self.new_party = i
                    end
                end
                self.state = "LEADERSELECT"
            else
                for i, v in ipairs(self.members) do
                    if v == Game.party[self.currently_selected].id then
                        self.new_party = i
                    end
                end
                self.state = "MEMBERSELECT"
            end
        end
        if Input.pressed("right") then
            if self.currently_selected < 3 then
                self.ui_move:stop()
                self.ui_move:play()
            end
            self.currently_selected = Utils.clamp(self.currently_selected + 1, 1, 3)
        end
        if Input.pressed("left") then
            if self.currently_selected > 1 then
                self.ui_move:stop()
                self.ui_move:play()
            end
            self.currently_selected = Utils.clamp(self.currently_selected - 1, 1, 3)
        end
    end
    if self.state == "LEADERSELECT" or self.state == "MEMBERSELECT" then
        self.page = Utils.roundFromZero(self.new_party/6)
        if Input.pressed("cancel") then
            self.ui_cancel_small:stop()
            self.ui_cancel_small:play()
            self.state = "SELECTING"
            return
        end
    end
    if self.state == "MEMBERSELECT" then
        if Input.pressed("down") then
            self.ui_move:stop()
            self.ui_move:play()
            self.new_party = self.new_party + 1
            if self.new_party > #self.members then
                self.new_party = 1
            end
        end
        if Input.pressed("up") then
            self.ui_move:stop()
            self.ui_move:play()
            self.new_party = self.new_party - 1
            if self.new_party < 1 then
                self.new_party = #self.members
            end
        end
        if Input.pressed("confirm") then
            if self.members[self.new_party] ~= Game.party[2].id and self.members[self.new_party] ~= Game.party[3].id then
                Game:removePartyMember(Game.party[self.currently_selected])
                Game:addPartyMember(Game:getPartyMember(self.members[self.new_party]), self.currently_selected)
                Game.world.followers[self.currently_selected-1]:setActor(Game.party[self.currently_selected].actor)
                self.ui_select:stop()
                self.ui_select:play()
            end
        end
    end
    if self.state == "LEADERSELECT" then
        if Input.pressed("down") then
            self.ui_move:stop()
            self.ui_move:play()
            self.new_party = self.new_party + 1
            if self.new_party > #self.leaders then
                self.new_party = 1
            end
        end
        if Input.pressed("up") then
            self.ui_move:stop()
            self.ui_move:play()
            self.new_party = self.new_party - 1
            if self.new_party < 1 then
                self.new_party = #self.leaders
            end
        end
        if Input.pressed("confirm") then
            if self.leaders[self.new_party] ~= Game.party[1].id then
                Game:removePartyMember(Game.party[1])
                Game:addPartyMember(Game:getPartyMember(self.leaders[self.new_party]), 1)
                Game.world.player:setActor(Game.party[1].actor)
                self.ui_select:stop()
                self.ui_select:play()
            end
        end
    end
    super.update(self)
end

function PartySwapMenu:close()
    Game.world.menu = nil
    self:remove()
end

return PartySwapMenu
