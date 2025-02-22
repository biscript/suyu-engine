local project = require("config")
local flagsList = {
    fullscreen = true,
    fullscreentype = true,
    vsync = true,
    msaa = true,
    stencil = true,
    depth = true,
    resizable = true,
    borderless = true,
    centered = true,
    display = true,
    minwidth = true,
    minheight = true,
    highdpi = true,
    usedpiscale = true,
    x = true,
    y = true
}

local json = require("src.lib.json")
local Stack = require("src.lib.stack")

Scenes = {}
Scenes._stack = Stack()
Scenes.menu = require("src.scenes.menu")

local flags = {}
for k, v in pairs(flagsList) do
    if project.window[k] then
        flags[k] = project.window[k]
    end
end

config = {
    width = project.content.width,
    height = project.content.height,

    flags = flags
}

local windowWidth, windowHeight = 1, 1

function love.load()
    love.window.setTitle(project.title .. " (" .. project.version .. ")")
    
    love.window.setIcon( love.image.newImageData(project.icon) )

    local w, h = project.window.width, project.window.height
    
    love.window.setMode(w, h, config.flags)
    windowWidth, windowHeight = love.graphics.getPixelDimensions()

    Scenes._stack:push(Scenes.menu)
    Scenes.menu.start()
end

function love.resize()
    windowWidth, windowHeight = love.graphics.getPixelDimensions()
end

function love.draw()
    for i = 1, #Scenes._stack do
        Scenes._stack[i].draw(windowWidth, windowHeight)
    end
end

function love.update(dt)
end