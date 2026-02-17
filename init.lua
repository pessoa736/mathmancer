---@diagnostic disable: param-type-mismatch

local pb = require("PudimBasicsGl")
local colors = require"src.assets_scripts.colors"
local colorConv = require("src.colorConverter")
local create_player = require("src.assets_scripts.player")


local win = pb.window.create(800, 600, "mathmancer")

local plr = create_player(0,0)
local cam = require("src.assets_scripts.camera")

pb.window.set_resizable(win, true) 

pb.renderer.init()

while not pb.window.should_close(win) do
    pb.time.update()
    local dt = pb.time.delta()
    local scrW, scrH = pb.window.get_size(win)

    cam:update({plr}, {w=scrW/2, h=scrH/2}, dt)
    plr:update(dt)

    pb.renderer.begin(scrW, scrH)

    pb.renderer.clear(colorConv(colors["black"]))

    plr:draw(cam)

    pb.texture.flush()
    
    pb.renderer.finish()
    
    pb.window.swap_buffers(win)
    pb.window.poll_events()
end


