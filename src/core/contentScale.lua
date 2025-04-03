--[[

    contentScale.lua
    ----------------
    This module is used to scale the content of the game to fit the window size.
    It is used in the main.lua file to scale the content of the game to fit the window size.

]]

local contentScale = {}

function contentScale.resize( w, h )
        local config = display
    
        local width = config.width
        local height = config.height
        
        if w > h  then
            width = config.height * w/h 
            height = config.height 
            
        else
            width = config.width * h/w
            height = config.width 
        end
    
        if width*(w/width)<config.width then
            width = config.width 
            height = config.width * h/w
        end
    
        if height<config.height then
            width = config.height * w/h
            height = config.height
        end
    
        display.xScale = w/width
        display.yScale = h/height
    
        display.x = w/2 - (config.width * display.xScale)/2
        display.y = h/2 - (config.height * display.xScale)/2
    
        config.left = -(width/2-config.width/2)
        config.right = (width/2+config.width/2)
        config.top = -(height/2-config.height/2)
        config.bottom = (height/2+config.height/2)
    
        config.contentWidth = width
        config.contentHeight = height
end

function contentScale.draw()
    love.graphics.translate( display.x, display.y )
    love.graphics.scale( display.xScale, display.yScale )
end

return contentScale