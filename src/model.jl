using LinearAlgebra

# wheeled inverted pendulum parameters
l = 23.0        # [mm]
r = 40.0        # [mm]
R = 4.0         # [Ω]
θ_r = 444.43    # [kg * mm^2]
m_r = 0.316     # [kg]
θ_w = 26.89     # [kg * mm^2]
m_w = 0.021     # [kg]
g = 9810.0      # [mm / s^2]

# dc motor parameters
K = 25. / 41. * 0.506   # [V / rps]
K_τ = 48.39             # [N * mm]

# z = [ϕ, x, ϕ_dot, x_dot]

M(z1) = [
    (θ_r+m_r*l*l) (-m_r*l*cos(z1))
    (-m_r*r*l*cos(z1)) (θ_w/r+(m_w+m_r)*r)
]
f_p(z1, z3) = m_r * l * sin(z1) * [g; -r * z3 * z3]

function f(x, controller, t)
    z1, _, z3, z4 = x

    v = controller(x, t)
    T = K_τ / R * (v + K * z4 / r)

    tmp = M(z1) \ (f_p(z1, z3) .- [0; 1] * T)
    return [z3, z4, tmp[1], tmp[2]]
end

export f
