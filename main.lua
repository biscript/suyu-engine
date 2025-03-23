baseWidth, baseHeight = love.window.getDesktopDimensions()
screenWidth, screenHeight = love.window.getMode()

local scener = require("src.lib.scener")

function love.load()

    scener.swich( require "src.scenes.menu" )

end

function love.resize( w, h )

    scale = math.min(
        w / baseWidth,
        h / baseHeight
    )

    scener.resize( w, h )
    
end

function love.update(dt)

    scener.update(dt)

end

function love.draw()
    
    love.graphics.push()
    love.graphics.scale( scale, scale )

    scener.draw()

    love.graphics.pop()

end

function love.keypressed(key)

    if key == "f11" then
        if love.window.getFullscreen() == true then
            love.window.setFullscreen( false )
        elseif love.window.getFullscreen()  == false then
            love.window.setFullscreen( true )
        end
    end

    scener.keypressed(key)

end