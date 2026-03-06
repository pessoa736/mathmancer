
---@class screen_settings
---@field id string|number|nil
---@field name string|nil
---@field init function|nil
---@field update function|nil
---@field draw function|nil
---@field exit function|nil


---@class screen: screen_settings
---@field id string|number
---@field name string
---@field init function
---@field update function
---@field draw function
---@field exit function
---@field close boolean


---@class GameCore
---@field name string
---@field current_screen string|number
---@field version string|number
---@field screens screen[]
---@field _close boolean
---@field _initialized boolean
---@field setName fun(self: GameCore, name: string)
---@field setCurrentScreen fun(self: GameCore, id: string|number)
---@field setVersion fun(self: GameCore, version: string|number)
---@field add_screen fun(self: GameCore, settings: screen_settings)
---@field close fun(self: GameCore, bool?: boolean)
---@field update function
---@field setInit fun(self: GameCore, fun: function)
---@field _initfun function



