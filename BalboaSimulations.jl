using LinearAlgebra
using DifferentialEquations

include("control.jl")
include("model.jl")

x0 = [0., 0., 0., 0.]
tspan = (0.0, 100.0)
problem = ODEProblem(Model.f, x0, tspan, Control.constant)

sol = solve(problem, Tsit5())
display(sol)

using Plots
z = zeros((length(sol.t), 4))
for (t, z_t) ∈ enumerate(sol.u) 
    for (j, z_i_t) ∈ enumerate(z_t)
        z[t, j] = z_i_t
    end
end

p1 = plot(sol.t, z[:, 1]; label = "\$ϕ\$")
display(p1)
p2 = plot(sol.t, z[:, 2]; label = "\$x\$")
display(p2)
