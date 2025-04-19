local ui = {}

local widgets = require("src.lib.widgets")

local arial50 = love.graphics.newFont("res/fonts/arialUnicodeMS.otf", 20)
local button1, button2

local styles =
{
    button =
    {
        width = 200,
        height = 50,
        backgroundColor = { 0.25, 0.25, 0.25, 1 },
        textColor = { 1, 1, 1, 1 },
        borderRadius = 10,
    },
}

function ui.load()
    love.graphics.setFont( arial50 )

    button1 = widgets.button.new
    {
        text = "Click",
        x = display.left + 100,
        y = display.top + 10,
        width = styles.button.width,
        height = styles.button.height,
        backgroundColor = styles.button.backgroundColor,
        textColor = styles.button.textColor,
        borderRadius = styles.button.borderRadius,
    }

    button2 = widgets.button.new
    {
        text = "Click",
        x = display.left + 400,
        y = display.top + 10,
        width = styles.button.width,
        height = styles.button.height,
        backgroundColor = styles.button.backgroundColor,
        textColor = styles.button.textColor,
        borderRadius = styles.button.borderRadius,
    }
end

function ui.resize()
    button1.x = display.left + 100
    button1.y = display.top + 10
    button2.x = display.left + 400
    button2.y = display.top + 10
end

function ui.draw()
    love.graphics.setColor( 0.3, 0.3, 0.3, 1 )

    love.graphics.rectangle(
        "fill",
        display.left,
        display.top,
        display.contentWidth,
        80
    )

    widgets.button.draw( button1 )
    widgets.button.draw( button2 )
end

return ui