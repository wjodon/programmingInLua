function cone_volume (h, a)
    r = math.tan(math.rad(a)) * h
    return (1/3)*math.pi*r^2*h
end