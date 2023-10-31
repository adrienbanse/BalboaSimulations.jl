function constant(x, t, val)
    return val
end

function sampled(x, t, list, timestep)
    idx = Int(t ÷ timestep + 1)
    return list[idx]
end

export constant, sampled
