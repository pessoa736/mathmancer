
local clamp = require("src.assets_scripts.clamp")

---@param a number|Vector
---@param b number|Vector
---@param t number 
---@return number|Vector
return function (a, b, t)
    ---@type number
    local t = clamp(0, t, 1)
    
    return a*(1-t)+b*t
end