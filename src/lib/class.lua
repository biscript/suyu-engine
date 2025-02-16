-- упрощения и локализация
local f = string.format

-- общие методы классов
local classesindex = {}
classesindex.extends = function(class, parent)
    setmetatable(class.__index, {__index = parent.__index or {}})
    class.__super = parent
    class.__index.super = parent.__index
end

-- методы метатаблиц классов
local __index = function(t, k)
    return (
        rawget(t, "__index") and t.__index[k] or
        classesindex[k] or
        rawget(t, "__super") and t.__super[k]
    )
end

local __tostring = function(t)
    return f(
        "Class: name = %s, table = %s",
        t.__index.__name or "NONAME",
        t.__str or "nil"
    )
end

local __call = function(class, ...)
    if class.new then
        return class.new(class, ...)
    else
        return setmetatable({}, class)
    end
end


-- статическая метатаблица для классов
local classesMT = {
    __index = __index,
    __tostring = __tostring,
    __call = __call
}

-- Динамическое создание метатаблицы для класса
local newClassMT = function()
    return {
        __index = __index,
        __tostring = __tostring,
        __call = __call
    }
end



-- Создания класса для классов
local Class = {}
Class.__index = {}

local ClassMT = Class.__index
ClassMT.__name = "creatorClass"

setmetatable(Class, newClassMT())

-- Функция создания нового класса
-- isstatic - boolean, table
Class.new = function(self, name, parent, isstatic)
    if type(parent) ~= "table" then
        isstatic = parent
        parent = nil
    end

    local NewClass = {}
    NewClass.__index = {}

    NewClass.__index.__name = name or "NONAME"
    NewClass.__str = tostring(NewClass):match("0x%x+")

    if parent then
        classesindex.extends(NewClass, parent)
    end

    if type(isstatic) == "table" then
        setmetatable(NewClass, isstatic)
    elseif isstatic then
        setmetatable(NewClass, classesMT)
    else
        setmetatable(NewClass, newClassMT())
    end

    return NewClass
end

Class.notfunc = function()
    print("the function is not implemented")
end

return Class