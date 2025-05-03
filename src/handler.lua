function love.errorhandler(msg)

    msg = tostring(msg)
    local trace = debug.traceback()

    local fullMessage = "Error\n" .. msg .. "\n\n" .. trace

    print( fullMessage )

    local imageLogo = love.graphics.newImage(
        "res/images/logos/game-logo1.png"
    )

    local audioMusic = love.audio.newSource(
        "res/audios/musics/touch-touch.mp3",
        "stream"
    )

    audioMusic:setLooping( true )
    audioMusic:play()

    local function drawError()
    
        love.graphics.clear(0.4, 0.15, 0.4)
    
        local w, h = love.graphics.getDimensions()
    
        love.graphics.setColor(1, 1, 1)
        love.graphics.printf(
            fullMessage,
            50, 50,
            love.graphics.getWidth() - 10
        )
    
        love.graphics.draw(
            imageLogo,
            w/2 - imageLogo:getWidth()/2,
            h/2 - imageLogo:getHeight()/2
        )
    
        love.graphics.present()
    
    end

    return function()
    
        love.event.pump()
    
        for e,a in love.event.poll() do
        
            if e == "quit" or (e == "keypressed" and a == "escape") then
                return 1
            end
        
            if (e == "keypressed" and a == "f11") then
                love.window.setFullscreen( not love.window.getFullscreen() )
            end
        
        end
    
        drawError()
    
        if love.timer then
            love.timer.sleep(0)
        end
    
    end

end