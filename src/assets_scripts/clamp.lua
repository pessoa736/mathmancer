
local min, max = math.min, math.max


---@param mi number
---@param value number
---@param ma number
---@return number
return function (mi, value, ma)
    return min(ma, max(value, mi))
end