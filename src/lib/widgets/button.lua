local M = {}

local stdColor = function(obj)
    local c = obj
    local r, g, b, a = c[1], c[2], c[3], c[4]
    r = r or 1

    if not g then
        c[1], c[2], c[3], c[4] = r, r, r, 1
    elseif not b then
        c[1], c[2], c[3], c[4] = r, r, r, g
    elseif not a then
        c[1], c[2], c[3], c[4] = r, g, b, 1
    else
        c[1], c[2], c[3], c[4] = r, g, b, a
    end

    return obj
end


local buttonDraw = function(button)
    love.graphics.setColor(button.backgroundColor)

    love.graphics.rectangle(
        "fill",
        button.x - button.width*0.5,
        button.y - button.height*0.5,
        button.width,
        button.height,
        button.radius,
        button.radius
    )

    if button.strokeWeight > 0 then
        love.graphics.setColor(button.strokeColor)
        love.graphics.setLineWidth(button.strokeWeight)

        love.graphics.rectangle(
            "line",
            button.x - button.width*0.5,
            button.y - button.height*0.5,
            button.width,
            button.height,
            button.radius,
            button.radius
        )

    end

    local bc = button.cache
    local font = button.font
    local text = button.text

    if not bc.textSet or bc.textSet[font] or bc.textSet[font][text] then
        bc.textSet = {}
        bc.textSet[font] = {}
        bc.textSet[font][text] = love.graphics.newText(font, text)
    end

    local width = font:getWidth(text)
    local height = font:getHeight()
    local offsetX = width*0.5
    local offsetY = height*0.5

    local c = button.textColor
    love.graphics.setColor(c[1], c[2], c[3], c[4])

    love.graphics.draw(
        bc.textSet[font][text],
        button.x - offsetX, button.y - offsetY
    )
end

local newButton = function(options)
    local options = options or {}
    local text = options.text or "popabobra"
    local x, y = options.x or 0, options.y or 0
    local width, height = options.width or 200, options.height or 80
    local radius = options.radius or 0
    local sw = options.strokeWeight or 0
    local bgc = options.backgroundColor or {0.25, 1} stdColor(bgc)
    local sc = options.strokeColor or {1} stdColor(sc)
    local tc = options.textColor or {1} stdColor(tc)

    local font = options.font or love.graphics.getFont()

    local button = {
        text = text,
        x = x,
        y = y,
        width = width,
        height = height,
        radius = radius,
        strokeWeight = sw,
        backgroundColor = bgc,
        strokeColor = sc,
        textColor = tc,
        font = font,

        cache = {},

        draw = buttonDraw
    }

    return button
end

return newButton