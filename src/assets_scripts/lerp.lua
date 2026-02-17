local clamp = require("src.assets_scripts.clamp")
return function (a, b, t)
    local t = clamp(0, t, 1)
    
    return a*(1-t)+b*t
end