local project = require("config")
local widgets = require("src.lib.widgets")
local flags = require("src.data.window-mode-flags")

function love.load()
    love.window.setTitle(project.title .. " (" .. project.version .. ")")
    
    love.window.setIcon( love.image.newImageData(project.icon) )

    local w, h = project.window.width, project.window.height
    
    for k, v in pairs(project.window) do
        if not flags[k] then
            project.window[k] = nil
        end
    end

    love.window.setMode(w, h, project.window)
end

function love.update(dt)
end