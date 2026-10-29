function mp_normal_rnd ()
    repeat
        u = randomx()
        v = randomx()
        s = u^2 + v^2
    until s < 1.0

    x = u * math.sqrt((-2*math.log(s))/s)
    y = v * math.sqrt((-2*math.log(s))/s)

    return x, y
end

function randomx ()
    return math.random() * 2 - 1
end

function bm_normal_rnd ()
    u = math.random()
    v = math.random()
    x = math.sqrt(-2*math.log(u)) * math.cos(2*math.pi*v)
    y = math.sqrt(-2*math.log(u)) * math.sin(2*math.pi*v)
    return x, y
end

function normal_ranges ()
    low = 0.0
    high = 0.0
    for i = 1, 100000000 do
        x, y = bm_normal_rnd()
        low = math.min(low, x)
        high = math.max(high, x)
        low = math.min(low, y)
        high = math.max(high, y)
    end
    return low, high
end