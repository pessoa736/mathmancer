local lerp = require("src.assets_scripts.lerp")

local cam = {
    x = 0,
    y = 0,
    update = function (self, targets, winsize, dt)
        local winsize = winsize or {w=0,h=0}
        for idx, tar in ipairs(targets or {}) do
            self.x = lerp(self.x, tar.x-winsize.w, 0.05*(dt or 1))
            self.y = lerp(self.y, tar.y-winsize.h, 0.05*(dt or 1))
        end
    end
}

return cam