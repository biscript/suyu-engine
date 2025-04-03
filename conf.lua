require "love.window"

local w, h = love.window.getDesktopDimensions()

function love.conf(t)
    t.window.title = "Suyu Engine"
    t.window.icon = "/res/images/icons/app-icon.png"
    t.window.width = w / 2
    t.window.height = h / 2
    t.window.minwidth = w /5
    t.window.minheight = h / 5
    t.window.resizable = true
    t.window.borderless = false
    t.window.fullscreen = true
    t.window.fullscreentype = "desktop"
    t.window.usedpiscale = true
    t.window.vsync = true
    t.window.x = nil
    t.window.y = nil
    t.window.centered = true

    t.version = "11.4"
    t.console = false

    t.audio.muc = false
    t.audio.mixwithsystem = false

    t.modules.audio = true
    t.modules.event = true
    t.modules.graphics = true
    t.modules.image = true
    t.modules.joystick = false
    t.modules.keyboard = true
    t.modules.math = true
    t.modules.mouse = true
    t.modules.physics = false
    t.modules.sound = true
    t.modules.system = true
    t.modules.thread = true
    t.modules.timer = true
    t.modules.touch = true
    t.modules.video = true
    t.modules.window = true
end

content =
{
    width = 1280,
    height = 720,
}