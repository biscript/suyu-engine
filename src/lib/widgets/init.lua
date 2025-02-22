-- local root = (...):gsub("%.init$", "") .. "."
local root = ... .. "."

return {
    newButton = require(root .. "button")
}