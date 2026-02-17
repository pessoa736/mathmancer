local pb = pb or require("PudimBasicsGl") ---@diagnostic disable-line: undefined-global

local function create_player(x, y)
    local player = {
        x = x or 0, 
        y = y or 0,
        speed = 50,
        spr = {
            idle = pb.texture.load("src/sprites/player/idle.png")
        },
        draw = function (self, cam)
            local cam = cam or {x=0, y=0}
            local spr = self.spr.idle
            
            if spr then
                local dx = math.floor(self.x - cam.x)
                local dy = math.floor(self.y - cam.y)
                ---@cast spr Texture
                spr:draw(dx, dy, 32*2, 32*2)
            end
        end,
        update = function (self, dt)
            if pb.input.is_key_pressed(pb.input.KEY_W) then 
                self.y = self.y - self.speed * dt
            end
            if pb.input.is_key_pressed(pb.input.KEY_S) then 
                self.y = self.y + self.speed * dt
            end
            if pb.input.is_key_pressed(pb.input.KEY_A) then 
                self.x = self.x - self.speed * dt
            end
            if pb.input.is_key_pressed(pb.input.KEY_D) then 
                self.x = self.x + self.speed * dt
            end
        end
    }
    return player
end

return create_player