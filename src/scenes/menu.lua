local widgets = require("src.lib.widgets")

local button = widgets.newButton(
    "popabobra",
    display.config.width/2,
    display.config.width/2,
    300, 100, -- w, h
    {
        radius = 10
    }
)