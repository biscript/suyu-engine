local button = {}

function button.draw( text, width, height, x, y, options )

    local backgroundColorRed = options and options.backgroundColorRed or 0.25
    local backgroundColorGreen = options and options.backgroundColorGreen or 0.25
    local backgroundColorBlue = options and options.backgroundColorBlue or 0.25
    local backgroundColorAlpha = options and options.backgroundColorAlpha or 1

    love.graphics.setColor(
        backgroundColorRed,
        backgroundColorGreen,
        backgroundColorBlue,
        backgroundColorAlpha
    )

    local radius = options and options.radius or 0

    love.graphics.rectangle(
        "fill",
        x,
        y,
        width,
        height,
        radius,
        radius
    )

    local textColorRed = options and options.textColorRed or 1
    local textColorGreen = options and options.textColorGreen or 1
    local textColorBlue = options and options.textColorBlue or 1
    local textColorAlpha = options and options.textColorAlpha or 1

    love.graphics.setColor(
        textColorRed,
        textColorGreen,
        textColorBlue,
        textColorAlpha
    )

    love.graphics.print(
        text,
        x + width / 2 - love.graphics.getFont():getWidth( text ) / 2,
        y + height / 2 - love.graphics.getFont():getHeight( text ) / 2
    )
end

return button