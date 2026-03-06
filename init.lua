
package.path = 
    "./src/?.lua;" ..
    "./src/assets_scripts/?.lua;" ..
    package.path


local pb            = require "PudimBasicsGl"

local colors        = require "src.constants.colors"
local cPlayerGroup  = require "player"
local vectors       = require "vectors"
local rtb           = require "RenderTiledBackground"
local gameC         = require "gamecore"



local   Render,
        Window,
        Texture,
        Camera,
        Sond,
        Input,
        Time,
        Text,
        Pmath,
        shader,
        studio,
        ui
        =
        pb.renderer,
        pb.window,
        pb.texture,
        pb.camera,
        pb.audio,
        pb.input,
        pb.time,
        pb.text,
        pb.math,
        pb.shader,
        pb.studio,
        pb.ui

 
--- game

gameC:setInit(function (self)
    gameC:setName "mathmancer"
    gameC:setVersion "dev-1"
    
    local defalt_size = self.configs.screen_size
    self.win = Window.create(defalt_size[1], defalt_size[2], "mathmancer")
    self.win:set_resizable(false)
    
    Render.init()
    Render.enable_blend(true)
    Render.enable_depth_test(false)

end)



gameC:add_screen{
    name = "game",
    init = function (self, global)
        
        if not self.entitys then self.entitys = {} end

        self.entitys.players = cPlayerGroup()
        
        self.entitys.players:add{
            name = "player",
            position = vectors.CreateVector(0, 0),
            speed = 150,
            cameraId = 0,
        }
          
        if not global.font then global.font = Text.load("./src/fonts/Comic Sans MS.ttf") end
        if not global.floor then global.floor = Texture.load("./src/sprites/floor.png") end

        if not self._virtual_diag then self._virtual_diag =  math.floor(math.sqrt(240*240 + 136*136)) end
    end,

    draw = function (self, global)
        local scrW, scrH = Window.get_size(global.win)

        local s = math.floor(math.sqrt(scrW*scrW + scrH*scrH)) * 0.5
        Camera.set_zoom(math.max(0.01, s / self._virtual_diag))

        Render.clear(0,0,0,1)
        Render.begin(scrW, scrH)
        
        rtb(Camera, global.win, global.floor)

        for idx, ent in pairs(self.entitys) do
            ent:draw(Time.get())
        end


        Render.begin_ui(scrW, scrH)

        global.font:draw(math.floor(Time.fps()), 0, 0, colors["white"])
        Render.end_ui()

        
        Render.finish()
        
        Window.swap_buffers(global.win)
        Window.poll_events()
    end,

    update = function (self, global)
        if global.win:should_close() then gameC:close() end

        Time.update()
        local dt = Time.delta()

        for idx, ent in pairs(self.entitys) do
            ent:update(dt, global.win)
        end
        

        if not global.win then error("not load window") end

        if self.RESTART then self:init() self.RESTART = false end
    end

}




gameC:update()





