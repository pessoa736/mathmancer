local screensSizes = require "src.constants.screenSizes"

local insert = table.insert


---@type GameCore
local GameCore = {
    name = "Game",
    current_screen = 0,
    version = "dev-1",
    screens = {},
    
    _close = false,
    _initialized = false,

    configs = {
        screen_size = screensSizes["HD"],
        Fullscreen = true,
    }
}

---@param fun function
function GameCore:setInit(fun)
    self._initfun = fun
end


---@param name string
function GameCore:setName(name)
    self.name = name
end

---@param id string|number
function GameCore:setCurrentScreen(id)
    self.current_screen = id
end

---@param version number
function GameCore:setVersion(version)
    self.version = version
end


---@param settings screen_settings
function GameCore:add_screen(settings)
    local n_screens = #self.screens

    ---@type screen
    local scr = {}

    scr.id      = settings.id or settings.name or n_screens
    scr.name    = settings.name or ("screen"..n_screens)

    scr.init    = settings.init     or      function()end
    scr.update  = settings.update   or      function()end
    scr.draw    = settings.draw     or      function()end
    scr.exit    = settings.exit     or      function()end
    
    scr.close   = false
    
    if n_screens>=0 then self.current_screen = scr.id end

    self.screens[scr.id] = scr
end


function GameCore:close(bool)
    self._close = bool or true
end


function GameCore:update()
    self._initfun(self)
    while not self._close do
        ---@type screen
        local screen = self.screens[self.current_screen]

        if not self._initialized then
            self._initialized = true
            screen:init(self)
        end

        screen:update(self)
        screen:draw(self)
        screen:exit(self)
    end
end



return GameCore