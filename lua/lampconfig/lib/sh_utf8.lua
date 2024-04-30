-- https://github.com/Be1zebub
-- incredible-gmod.ru
-- https://github.com/Be1zebub/Small-GLua-Things/blob/master/sh_utf8.lua
if not utf8 then
    utf8 = {}
end

local pattern, rawget, gsub, lower, upper = "[%z\x01-\x7F\xC2-\xF4][\x80-\xBF]*", rawget, string.gsub, string.lower, string.upper
local upper2lower = {
    ["А"] = "а",
    ["Б"] = "б",
    ["В"] = "в",
    ["Г"] = "г",
    ["Д"] = "д",
    ["Е"] = "е",
    ["Ё"] = "ё",
    ["Ж"] = "ж",
    ["З"] = "з",
    ["И"] = "и",
    ["Й"] = "й",
    ["К"] = "к",
    ["Л"] = "л",
    ["М"] = "м",
    ["Н"] = "н",
    ["О"] = "о",
    ["П"] = "п",
    ["Р"] = "р",
    ["С"] = "с",
    ["Т"] = "т",
    ["У"] = "у",
    ["Ф"] = "ф",
    ["Х"] = "х",
    ["Ц"] = "ц",
    ["Ч"] = "ч",
    ["Ш"] = "ш",
    ["Щ"] = "щ",
    ["Ъ"] = "ъ",
    ["Ы"] = "ы",
    ["Ь"] = "ь",
    ["Э"] = "э",
    ["Ю"] = "ю",
    ["Я"] = "я"
}

local lower2upper = {}
for upper2, lower2 in pairs(upper2lower) do
    lower2upper[lower2] = upper2
end

setmetatable(
    upper2lower,
    {
        __index = function(self, char) return rawget(self, char) or lower(char) end
    }
)

setmetatable(
    lower2upper,
    {
        __index = function(self, char) return rawget(self, char) or upper(char) end
    }
)

function utf8.lower(s)
    return gsub(s, pattern, upper2lower)
end

function utf8.upper(s)
    return gsub(s, pattern, lower2upper)
end