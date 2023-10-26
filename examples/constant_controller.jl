using BalboaSimulations
x0 = [0., 0., 0., 0.]
tspan = (0, 100.0)
sol = simulate_balboa(x0, tspan, constant)

using Plots
p = plot(sol)
display(p)
