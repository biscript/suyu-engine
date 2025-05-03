local engine = require("src.engine")
local scener = require("src.lib.scener")

require( "src.handler" )

function love.load(arg)

    if arg[#arg] == "-debug" then
        require( "mobdebug" ).start()
    end

    local w, h = love.graphics.getPixelDimensions()

    engine.core.renderer.resize( w, h )
    scener.swich( require "src.scenes.welcome.main" )

end

function love.resize()

    local w, h = love.graphics.getPixelDimensions()

    engine.core.renderer.resize( w, h )
    scener.resize( w, h )

end

function love.update(dt)

    scener.update(dt)

end

function love.draw()

    love.graphics.push()

    engine.core.renderer.draw()
    scener.draw()
    love.graphics.setColor( boom )

    love.graphics.pop()

end

function love.keypressed(key)

    if key == "f11" then
        love.window.setFullscreen(not love.window.getFullscreen())
    end

    scener.keypressed(key)

end
