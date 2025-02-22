local scene = {}

local widgets = require("src.lib.widgets")
local letterbox = require("src.lib.scaleModes.letterbox")

local displayGroup = {}

local arial50 = love.graphics.newFont("res/fonts/arialUnicodeMS.otf", 50)

scene.start = function()
    local button = widgets.newButton({
        text = "popabobra",
        x = config.width/2,
        y = config.height/2,
        width = 400,
        height = 200,
        radius = 25,

        font = arial50
    })
    displayGroup[#displayGroup+1] = button
end

scene.draw = function(w, h)
    love.graphics.push()
    letterbox(config, w, h)

    for i = 1, #displayGroup do
        displayGroup[i]:draw(w, h)
    end

    love.graphics.pop()
end

return scene