---@class playerAtr
---@field name       string
---@field position   Vector
---@field speed      number

---@class player: playerAtr
---@field idx        number
---@field spr        table
---@field velocity   Vector
---@field dirx       number
---@field classnames string | string[]

---@class playerGroup
---@field draw  fun(self: playerGroup, time?: number)
---@field update fun(self: playerGroup, dt?: number, win: Window)
---@field add   fun(self: playerGroup, atr?: playerAtr): number
