image = {}

function image.draw( filename, x, y )
    local image = love.graphics.newImage(
        filename
    )
    
    love.graphics.draw(
        image,
        x,
        y
    )
end

return image