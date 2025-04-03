local menu = {}

local widgets = require("src.lib.widgets")

local arial50 = love.graphics.newFont("res/fonts/arialUnicodeMS.otf", 20)
local button1, button2

menu.load = function()
    love.graphics.setBackgroundColor( 1, 1, 1, 1 )

    love.graphics.setFont( arial50 )

    button1 = widgets.button.new
    {
        text = "Click",
        x = 100,
        y = 100,
        width = 200,
        height = 50,
        backgroundColor = { 0.25, 0.25, 0.25, 1 },
        textColor = { 1, 1, 1, 1 },
        font = arial50,
        borderRadius = 10,
    }
    button2 = widgets.button.new
    {
        text = "Click",
        x = 400,
        y = 100,
        width = 200,
        height = 50,
        backgroundColor = { 0.25, 0.25, 0.25, 1 },
        textColor = { 1, 1, 1, 1 },
        font = arial50,
        borderRadius = 10,
    }
end

menu.update = function(dt)
end

menu.draw = function()
    love.graphics.setColor( 0.3, 0.3, 0.3, 1 )
    love.graphics.rectangle( "fill", display.left, display.top, display.contentWidth, 80 )
    widgets.button.draw( button1 )
    widgets.button.draw( button2 )
end

return menu