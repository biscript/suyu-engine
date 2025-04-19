local menu = {}

local ui = require("src.scenes.menu.ui")

menu.load = function()
    love.graphics.setBackgroundColor( 1, 1, 1, 1 )
    ui.load()
end

menu.resize = function()
    ui.resize()
end

menu.update = function(dt)
end

menu.draw = function()
    ui.draw()
end

return menu