
local min, max = math.min, math.max

return function (mi, value, ma)
    return min(ma, max(value, mi))
end