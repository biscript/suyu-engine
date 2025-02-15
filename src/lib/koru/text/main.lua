text = {}

function text.font( filename, size )
    love.graphics.setFont(
        love.graphics.newFont(
            filename,
            size
        )
    )
end

function text.print( text, x, y )
    love.graphics.print(
        text,
        x,
        y
    )
end

return text