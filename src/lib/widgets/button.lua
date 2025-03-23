local button = {}

function button.new( options )

    local self = {}

    local options = options or {}

    self.text = options.text or "Button"
    self.x = options.x or 0
    self.y = options.y or 0
    self.width = options.width or 100
    self.height = options.height or 50
    self.backgroundColor = options.backgroundColor or { 0.25, 0.25, 0.25, 0.4 }
    self.textColor = options.textColor or { 1, 1, 1, 1 }
    self.borderRadius = options.borderRadius or 0
    self.borderColor = options and options.borderColor or { 0.5, 0.5, 0.5, 1 }
    self.borderWeight = options.borderWeight or 1

    return self, options

end

function button.draw( button )

    love.graphics.setColor( button.backgroundColor )

    love.graphics.rectangle(
        "fill",
        button.x,
        button.y,
        button.width,
        button.height,
        button.borderRadius,
        button.borderRadius
    )

    love.graphics.setColor( button.borderColor )
    love.graphics.setLineWidth( button.borderWeight )

    love.graphics.rectangle(
        "line",
        button.x,
        button.y,
        button.width,
        button.height,
        button.borderRadius,
        button.borderRadius
    )

    love.graphics.setColor( button.textColor )
    love.graphics.setFont( love.graphics.getFont() )

    love.graphics.print(
        button.text,
        button.x + button.width / 2 - love.graphics.getFont():getWidth( button.text ) / 2,
        button.y + button.height / 2 - love.graphics.getFont():getHeight( button.text ) / 2
    )

end

return button