LampConfig.Lang = LampConfig.Lang or {}
function LampConfig.AddLang(lang, tbl)
    LampConfig.Lang[lang] = tbl
end

function LampConfig.GetLang(word)
    if SERVER then
        local getlang = LampConfig.Lang[LampConfig.GetSettings()["Lang"]]

        return istable(getlang) and getlang[word] or LampConfig.Lang["English"][word]
    else
        local getlang = LampConfig.Settings["Lang"]

        return getlang and LampConfig.Lang[getlang][word] or LampConfig.Lang["English"][word]
    end
end