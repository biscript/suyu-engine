local menu = {}

local widgets = require("src.lib.widgets")

local arial50 = love.graphics.newFont("res/fonts/arialUnicodeMS.otf", 20)

menu.load = function()
    love.graphics.setBackgroundColor(1, 1, 1, 1)
end

menu.update = function(dt)
end

menu.draw = function()
    love.graphics.setColor(0, 0, 0, 1)
    widgets.button.set({
        text = "Click",
        x = 100,
        y = 100,
        width = 200,
        height = 50,
        backgroundColor = {0.25, 0.25, 0.25, 1},
        textColor = {1, 1, 1, 1},
        font = arial50,
        borderRadius = 10
    })
end

return menu