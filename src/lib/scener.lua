local scener =
{
    currectScene = nil,
}

function scener.swich( scene )
    if scener.currectScene and scener.currectScene.exit then
        scener.currectScene.exit()
    end
    scener.currectScene = scene
    if scener.currectScene.load then
        scener.currectScene.load()
    end
end

function scener.update( dt )
    if scener.currectScene and scener.currectScene.update then
        scener.currectScene.update( dt )
    end
end

function scener.draw( dt )
    if scener.currectScene and scener.currectScene.draw then
        scener.currectScene.draw( dt )
    end
end

function scener.keypressed()
    if scener.currectScene and scener.currectScene.keypressed then
        scener.currectScene.keypressed( key )
    end
end

return scener