local scener = require("src.lib.scener")

function love.load()
    scener.swich( require "src.scenes.menu" )
end

function love.update(dt)
    scener.update(dt)
end

function love.draw()
    scener.draw()
end

function love.keypressed(key)
    scener.keypressed(key)
end