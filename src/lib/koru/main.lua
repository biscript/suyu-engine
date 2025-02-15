package.path = package.path .. ";src/lib/koru/?.lua"

koru =
{
    text = require( "./text/main" ),
    image = require( "./image/main" ),
}

return koru