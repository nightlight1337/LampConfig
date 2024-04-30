LampConfig.ImageCache = LampConfig.ImageCache or {}
LampConfig.ImageDownload = LampConfig.ImageDownload or {}
local loading = Material("icon16/arrow_rotate_clockwise.png")
function LampConfig.GetImage(url)
    local name = string.Explode("/", url)
    local namew = string.StripExtension(url)
    if LampConfig.ImageCache[namew] then return LampConfig.ImageCache[namew] end
    if LampConfig.ImageDownload[name] then return loading end
    LampConfig.ImageDownload[name] = true
    http.Fetch(
        url,
        function(body)
            file.Write(name[#name], body)
            timer.Simple(
                0,
                function()
                    LampConfig.ImageDownload[name] = nil
                    LampConfig.ImageCache[namew] = Material("../data/" .. name[#name])
                end
            )
        end
    )

    return loading
end