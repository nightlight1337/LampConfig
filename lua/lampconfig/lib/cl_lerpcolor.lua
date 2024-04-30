function LampConfig.LerpColor(t, clr, newclr)
    if not clr then
        clr = Color(255, 255, 255)
    end

    clr.r = Lerp(t, clr.r, newclr.r)
    clr.g = Lerp(t, clr.g, newclr.g)
    clr.b = Lerp(t, clr.b, newclr.b)
    clr.a = Lerp(t, clr.a, newclr.a)

    return clr
end