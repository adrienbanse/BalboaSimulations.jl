using BalboaSimulations

x0 = [0.0, 0.0, 0.0, 0.0]
tspan = (0, 100.0)

voltage = 1.0
controller(x, t) = constant(x, t, voltage)

sol = simulate_balboa(x0, tspan, controller)

using Plots
p = plot(sol)
display(p)
