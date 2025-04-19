local welcome = {}

local logoImage

function welcome:load()
    logoImage = love.graphics.newImage("res/images/logos/game-logo1.png")
end

function welcome:update(dt)
end

function welcome:draw()
    love.graphics.setColor( 1, 1, 1, 1 )
    love.graphics.draw(
        logoImage,
        display.width / 2 - logoImage:getWidth() / 2,
        display.height / 2 - logoImage:getHeight() / 2
    )
end

function welcome:keypressed(key)
end

return welcome