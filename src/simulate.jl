using DifferentialEquations
using Plots

import BalboaSimulations

function plot_solution(sol)
    z = zeros((length(sol.t), 2))
    for (t, z_t) ∈ enumerate(sol.u) 
        for (j, z_i_t) ∈ enumerate(z_t)
            if j > 2 
                break
            end
            z[t, j] = z_i_t
        end
    end
    p1 = plot(sol.t, z[:, 1]; label = "\$ϕ\$")
    display(p1)
    p2 = plot(sol.t, z[:, 2]; label = "\$x\$")
    display(p2)
end

function simulate_balboa(x0, tspan, controller; show_sol = false, method = Tsit5)
    problem = ODEProblem(BalboaSimulations.f, x0, tspan, controller)
    sol = solve(problem, method())

    if show_sol
        display(sol)
        plot_solution(sol)
    end 
end

export simulate_balboa
