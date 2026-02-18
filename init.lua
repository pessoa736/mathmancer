

---@diagnostic disable: param-type-mismatch

package.path = 
    "./src/?.lua;" ..
    "./src/assets_scripts/?.lua;" ..
    package.path


--- imports
local pb            = require "PudimBasicsGl"
local colors        = require "colors"
local cPlayerGroup  = require "player"
local vectors       = require "vectors"
local clamp         = require "clamp"
local rtb           = require "RenderTiledBackground"



local   Render,
        Window,
        Texture,
        Camera,
        Sond,
        Input,
        Time,
        Text
        =
        pb.renderer,
        pb.window,
        pb.texture,
        pb.camera,
        pb.audio,
        pb.input,
        pb.time,
        pb.text

 
--- game


local win, font, floor

win = Window.create(800, 600, "mathmancer")
win:set_resizable(true)
Render.init()
Render.enable_blend(true)
Render.enable_depth_test(true)

local Game = {}
Game.name = "mathmancer"
Game.version = "dev-1"
Game.entitys = {}



Game.init = function (self)
    

    Game.entitys.players = cPlayerGroup()
    Game.entitys.players:add{
        name = "player",
        position = vectors.CreateVector(0, 0),
        speed = 150,
        cameraId = 0,
    }
    
    ---@cast font Font    
    font = Text.load("./src/fonts/Comic Sans MS.ttf")

    floor = Texture.load("./src/sprites/floor.png")
end





Game.draw = function (self)
    
    local scrW, scrH = Window.get_size(win)
    Render.begin(scrW, scrH)

    local s = math.sqrt(scrW*scrW + scrH*scrH)//2
    local vs = math.sqrt(240*240 + 136*136)//1
    Camera.set_zoom(math.max(0.01, s/vs))

    Render.clear(0,0,0,0)
    Render.flush()

    for idx, ent in pairs(self.entitys) do
        ent:draw(Time.get())
    end

    rtb(Camera, win, floor)

    Render.begin_ui(scrW, scrH)
    ---@cast font Font
    font:draw("test", 0, 0, colors["white"])
    Render.end_ui()

    Texture.flush()
    
    Render.finish()
    
    Window.swap_buffers(win)
    Window.poll_events()

end





Game.loop = function (self)

    while not Window.should_close(win) do

        Time.update()
        local dt = Time.delta()

        for idx, ent in pairs(self.entitys) do
            ent:update(dt, win)
        end
        

        if not win then error("not load window") end

        self:draw()
        if _G.RESTART then Game:init() _G.RESTART = false end
    end
end

Game:init()
Game:loop()





