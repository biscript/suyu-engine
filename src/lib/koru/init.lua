local root = (...):gsub("%init$", "")

local koru =
{
    button = require( root .. "button" )
}

return koru