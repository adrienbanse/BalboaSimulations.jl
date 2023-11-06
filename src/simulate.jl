using DifferentialEquations
using Plots

import BalboaSimulations

function simulate_balboa(x0, tspan, controller; method = nothing)
    problem = ODEProblem(BalboaSimulations.f, x0, tspan, controller)
    if isnothing(method)
        sol = solve(problem)
    else
        sol = solve(problem, method())
    end
    return sol
end

export simulate_balboa
