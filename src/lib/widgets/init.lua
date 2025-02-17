-- local root = (...):gsub("%.init$", "") .. "."
local root = ... .. "."

return {
    button = require(root .. "button")
}