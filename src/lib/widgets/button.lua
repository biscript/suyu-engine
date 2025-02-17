local button = {}

function button.draw(text, x, y, width, height, options)
    local backgroundColor = options and options.backgroundColor or { 0.25, 0.25, 0.25, 1 }
    local borderRudius = options and options.borderRudius or 0

    love.graphics.setColor( backgroundColor )

    love.graphics.rectangle(
        "fill",
        x,
        y,
        width,
        height,
        borderRudius,
        borderRudius
    )

    local borderWeight = options and options.borderWeight or 0

    if borderWeight > 0 then

        local borderColor = options and options.borderColor or { 1, 1, 1, 1 }

        love.graphics.setColor( borderColor )
        love.graphics.setLineWidth( borderWeight )

        love.graphics.rectangle(
            "line",
            x,
            y,
            width,
            height,
            borderRudius,
            borderRudius
        )

    end

    local textColor = options and options.textColor or { 1, 1, 1, 1 }
    local font = options and options.font or love.graphics.getFont()

    love.graphics.setColor( textColor )
    love.graphics.setFont( font )

    love.graphics.print(
        text,
        x + width / 2 - love.graphics.getFont():getWidth( text ) / 2,
        y + height / 2 - love.graphics.getFont():getHeight( text ) / 2
    )
end

return button