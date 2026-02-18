require("player_d")


local pb = pb or require("PudimBasicsGl") ---@diagnostic disable-line: undefined-global

local vec       = require("vectors")
local BoolToNum = require "BoolToNum"
local lerp      = require "lerp"


local Input      = pb.input
local Camera     = pb.camera
local is_pressed = Input.is_key_pressed


local insert = table.insert



local function create_player_group()

    ---@type playerGroup | player[]
    local player_group = {}

    player_group.add = function (self, atr)
        local atr = atr or {}
        ---@type player
        local player = {
            idx        = #self,
            name       = atr.name       or "player",
            classnames = {"player"},
            
            position = atr.position or vec.CreateVector(0, 0),
            velocity = vec.CreateVector(0, 0),
            dirx = 1,
            speed    = atr.speed    or 50,

            spr = {
                idle = pb.texture.load("src/sprites/player/idle.png")
            }
        }

        insert(self, player)

        return player.idx
    end

    player_group.draw = function (self, time)
        for idx, player in ipairs(self) do
            ---@type Texture
            local spr = player.spr.idle
            
            if spr then
                    spr:draw_ex(
                        player.position[1] + (player.dirx > 0 and -16 or 16),
                        player.position[2] - 16,
                        player.dirx > 0 and 32 or -32,
                        32,
                        0,
                        player.dirx > 0 and 0 or 32,
                        0
                    )
            end

        end
    end
        

    player_group.update = function (self, dt, win)
        for idx, player in ipairs(self) do
            local up    = is_pressed(Input.KEY_W)
            local down  = is_pressed(Input.KEY_S)
            local left  = is_pressed(Input.KEY_A)
            local rigth = is_pressed(Input.KEY_D)
            
            if is_pressed(Input.KEY_ESCAPE) then _G.RESTART = true end

            local vspeed = BoolToNum(down) - BoolToNum(up)
            local hspeed = BoolToNum(rigth) - BoolToNum(left)

            player.dirx = hspeed~=0 and hspeed or player.dirx

            local v = vec.CreateVector(hspeed, vspeed)
            local dot = v*v
            local uv = v*(1/(dot>0 and dot or 1))

            player.velocity = lerp(player.velocity,  uv * player.speed * dt, 0.05)

            player.position = player.position + player.velocity
            
            local winsize = vec.CreateVector(win:get_size()) * (1/2)
            local cam = vec.CreateVector(Camera.get_position())
            local target = player.position - winsize + vec.CreateVector(16, 16)
            local newCam = lerp(cam, target, 0.05)
            Camera.set_position(newCam[1], newCam[2])
        end
    end
    
    return player_group
end

return create_player_group