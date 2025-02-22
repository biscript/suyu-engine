local _, _, flags = love.window.getMode()
local w, h = love.window.getDesktopDimensions(flags.display)

return {
    title = "Suyu Engine",
    version = "0.0.1",
    author = "Mehentenep",
    icon = "/res/images/icons/app-icon.png",
    window =
    {
        width = w/2,
        height = h/2,
        minwidth = w/5,
        minheight = h/5,
        resizable = true,
        fullscreen = false,
        fullscreentype = "desktop",
        borderless = false,
        x = nil,
        y = nil,
        centered = true
    },
    content = {
        width = 720,
        height = 1280
    }
}