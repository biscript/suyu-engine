local button = {}

function button.set( options )
    local options = options or {}
    local text = options.text or "Button"
    local x = options.x or 0
    local y = options.y or 0
    local width = options.width or 100
    local height = options.height or 50
    local backgroundColor = options.backgroundColor or { 0.25, 0.25, 0.25, 1 }
    local textColor = options.textColor or { 1, 1, 1, 1 }
    local font = options.font or love.graphics.getFont()
    local borderRadius = options.borderRadius or 0
    local borderWeight = options.borderWeight or 0

    love.graphics.setColor( backgroundColor )

    love.graphics.rectangle(
        "fill",
        x,
        y,
        width,
        height,
        borderRadius,
        borderRadius
    )
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
            borderRadius,
            borderRadius
        )

    end

    love.graphics.setColor( textColor )
    love.graphics.setFont( font )

    love.graphics.print(
        text,
        x + width / 2 - love.graphics.getFont():getWidth( text ) / 2,
        y + height / 2 - love.graphics.getFont():getHeight( text ) / 2
    )

    return options
end

return button