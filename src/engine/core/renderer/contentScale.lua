--[[

    contentScale.lua
    ----------------
    This module is used to scale the content of the game to fit the window size.
    It is used in the main.lua file to scale the content of the game to fit the window size.

]]

local contentScale = {}

function contentScale.resize( w, h )
        local scale = display
    
        local width = scale.width
        local height = scale.height
        
        if w > h  then
            width = scale.height * w/h 
            height = scale.height 
        else
            width = scale.width * h/w
            height = scale.width 
        end
    
        if width*(w/width)<scale.width then
            width = scale.width 
            height = scale.width * h/w
        end
    
        if height<scale.height then
            width = scale.height * w/h
            height = scale.height
        end
    
        display.xScale = w/width
        display.yScale = h/height
    
        display.x = w/2 - (scale.width * display.xScale)/2
        display.y = h/2 - (scale.height * display.xScale)/2
    
        scale.left = -(width/2-scale.width/2)
        scale.right = (width/2+scale.width/2)
        scale.top = -(height/2-scale.height/2)
        scale.bottom = (height/2+scale.height/2)
    
        scale.contentWidth = width
        scale.contentHeight = height
end

function contentScale.draw()
    love.graphics.translate( display.x, display.y )
    love.graphics.scale( display.xScale, display.yScale )
end

return contentScale