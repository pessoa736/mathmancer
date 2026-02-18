local vectors = require "vectors"


---@param camera PudimBasicsGl.camera
---@param window Window
---@param Texture Texture
return function (camera, window, Texture)
    local camX, camY = camera.get_position()
    -- local zoom       = camera.get_zoom()
    local scrW, scrH = window:get_size()
    local texW       = Texture:get_width()
    local texH       = Texture:get_height()

    local viewW = scrW
    local viewH = scrH

    local tilesX = math.ceil(viewW / texW) + 2
    local tilesY = math.ceil(viewH / texH) + 2

    local startX = math.floor(camX / texW)
    local startY = math.floor(camY / texH)

    for i = startX, startX + tilesX do
        for j = startY, startY + tilesY do
            Texture:draw(
                i * texW,
                j * texH,
                texW,
                texH
            )
        end
    end
end