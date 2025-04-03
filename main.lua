local core = require("src.core")
local scener = require("src.lib.scener")

function love.load()

    scener.swich( require "src.scenes.menu" )

end

function love.resize()
    local w, h = love.graphics.getPixelDimensions()

    core.contentScale.resize( w, h )
    scener.resize( w, h )

end

function love.update(dt)

    scener.update(dt)

end

function love.draw()
    
    love.graphics.push()

    core.contentScale.draw()
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