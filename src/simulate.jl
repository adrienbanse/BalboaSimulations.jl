using DifferentialEquations
using Plots

import BalboaSimulations

function simulate_balboa(x0, tspan, controller; method = Tsit5)
    problem = ODEProblem(BalboaSimulations.f, x0, tspan, controller)
    sol = solve(problem, method())
    return sol
end

export simulate_balboa
