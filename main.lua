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
        love.window.setFullscreen( not love.window.getFullscreen() )
    end

    scener.keypressed(key)

end