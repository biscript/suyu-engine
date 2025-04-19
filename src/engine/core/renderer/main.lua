
local contentScale = require("src.engine.core.renderer.contentScale")

local renderer = {}

function renderer.resize(w, h)
    contentScale.resize(w, h)
end

function renderer.draw()
    contentScale.draw()
end

return renderer