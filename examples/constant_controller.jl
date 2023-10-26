using BalboaSimulations

x0 = [0., 0., 0., 0.]
tspan = (0, 100.0)
simulate_balboa(x0, tspan, constant; show_sol = true)
