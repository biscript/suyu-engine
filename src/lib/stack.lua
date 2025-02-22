local Stack = {}

setmetatable(Stack, {
    __index = Stack.__index,
    __call = function(class, ...)
        if class.new then
            return class.new(class, ...)
        else
            return setmetatable({}, class)
        end
    end
})

Stack.new = function(class)
    return setmetatable({}, class)
end

Stack.__index = {}
local MT = Stack.__index

MT.push = function(stack, element)
    stack[#stack+1] = element

    return element
end

MT.pop = function(stack)
    if #stack == 0 then return nil end
    local element = stack[#stack]
    stack[#stack] = nil

    return element
end

MT.peek = function(stack)
    return stack[#stack]
end

MT.size = function(stack)
    return #stack
end

MT.top = MT.peek
MT.length = MT.size


return Stack