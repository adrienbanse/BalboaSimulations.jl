module Model
export f

# definition of function 
# f s.t. dx/dt = f(x, p, t)

# wheeled inverted pendulum parameters
l = 23.0        # [mm]
r = 40.0        # [mm]
θ_r = 26.89     # [kg * mm^2]
m_r = 0.316     # [kg]   
θ_w = 444.43    # [kg * mm^2]
m_w = 0.021     # [kg]
g = 0.981       # [mm / s^2]

# dc motor parameters
K = 25.64       # [V / rps]
K_τ = 48.39     # [N * mm]

M(z1) = [
    (θ_r + m_r * l * l)         (- m_r * l * cos(z1)); 
    (- m_r * r * l * cos(z1))   (θ_w / r + (m_w + m_r) * r)
]
f_p(z1, z3) = m_r * l * sin(z1) * [g ; - r * z3 * z3]

function f(x, p, t)
    # v = p
    # T = K_τ / r * (v + z4 / r)

    controller = p
    z1, _, z3, z4 = x

    v = controller(x)
    T = K_τ / r * (v + z4 / r)

    x = M(z1) \ (f_p(z1, z3) - [0 ; 1] * T)
    return [z3, z4, x[1], x[2]]
end

end