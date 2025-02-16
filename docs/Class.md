# RU
Class -- это библиотека для работы с классами и объектами, поддерживающая создание классов, наследование и настройку метатаблиц.

#### Подключение
перед началом работы нужно подключить модуль:
```lua
local Class = require("src.lib.class")
```

---

#### Создание классов
```lua
local Slime = Class.new("Slime")
local Human = Class("Human")
```
Создаются классы с именами `Slime` и `Human`.

##### *Полная сигнатура:*
```lua
Class.new(name [, parent] [, isstatic])
```


| Параметр | Описание                                                               |
| -------- | ---------------------------------------------------------------------- |
| name     | Имя класса. Передаётся объектам, используется в tostring               |
| parent   | Родительский класс (Если есть, родительский класс наследует его)       |
| isstatic | Определяет метатаблицу класса. Может быть true, false/nil или таблицей |
###### Значение isstatic:
- true -- устанавливает общую статическую метатаблицу
- false/nil -- создаёт уникальную метатаблицу для каждого класса
- Таблица -- используется в качестве метатаблицы

##### Примеры создания классов:
```lua
local MyClass = Class:new("MyClass") -- обычный класс
local SubClass = Class.new("SubClass", MyClass) -- наследование
local StaticClass = Class("StaticClass", nil, true) -- статический класс
```

---
#### Добавление методов и свойств
```lua
local Slime = Class("Slime")

Slime.maxhp = 100 -- свойство только у класса

Slime.__index.damage = 10 -- доступно и у класса,  у объекта

local MT = Slime.__index -- упрощение

MT.attack = function(self, target)
	target.hp = target.hp - self.damage
end
```

---
#### Создание объектов
```lua
Slime.new = function(class)
    local slime = {
	    hp = class.maxhp
    }
    setmetatable(slime, class)
    return slime
end

local slime1 = Slime()
local slime2 = Slime()

Slime.attack(slime1, slime2)

slime2:attack(slime1) -- slime2 атакует slime1
slime2:attack(slime1)
slime2:attack(slime1)

print(slime1.hp) -- 70
print(slime2.hp) -- 90
```

---

#### Наследование
###### При создании
```lua
local RedSlime = Class("RedSlime", Slime)
```

###### После создания
```lua
local GreenSlime = Class("GreenSlime")
Class.extends(GreenSlime, Slime)

local BlueSlime = Class("BlueSlime")
BluaSlime:extends(Slime)
```
#### Дополнительно
##### Имя класса
Каждый класс и его объекты содержат `__name`:
```lua
print(Slime.__index.__name) -- Slime

local myslime = Slime()
print(myslime.__name) -- Slime
```

##### `tostring` для классов
Классы поддерживают преобразования в строку:
```lua
local Human = Class("Human")
print(Human) -- Class: name = Human, table = 0x...
```

Можно явно получить строку
```lua
local str = tostring(Human)
print(str) -- Class: name = Human, table = 0x...
```

---
##### Доступ к родительскому классу
Классы хранят ссылку на родителя в __super
```lua
print(RedSlime.__super.__index.__name) -- Slime
```

Если у класса нет своего метода или свойства, то используется тот, что у родительского класса:
```lua
print(GreenSlime.maxhp) -- 100
```

Так же и с объектами класса, если у родителя методы или свойства в `parent.__index`:
```lua
local slime3 = BlueSlime() -- метод new для BlueSlime не определён по этому используется родительский

slime3:attack(slime1) -- используется метод Slime.__index.attack
print(slime1.hp) -- (уменьшилось на 10)
```

---
##### Нереализованные методы:
Если метод не реализован, это можно легко обозначить через заглушку:
```lua
Slime.run = Class.notfunc

slime2.run() -- the function is not implemented
```