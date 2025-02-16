local project = require("config")

local koru = require("src.lib.koru.init")

function love.load()
    love.window.setTitle(
        project.title .. " (" .. project.version .. ")"
    )
    love.window.setIcon(
        love.image.newImageData(
            project.icon
        )
    )
    love.window.setMode(
        project.window.size.width.def,
        project.window.size.height.def,
        {
            minwidth = project.window.size.width.min,
            minheight = project.window.size.height.min,
            resizable = project.window.size.resizable.mode,
            fullscreen = project.window.size.fullscreen.mode,
            fullscreentype = project.window.size.fullscreen.type,
            borderless = project.window.borderless.mode,
            x = project.window.position.x,
            y = project.window.position.y,
            centered = project.window.position.centered.mode
        }
    )
end

function love.update( dt )
end

function love.draw()
    koru.button.draw(
        "Hello, World!",
        200,
        50,
        100,
        100,
        {
            radius = 10,
        }
    )
end
