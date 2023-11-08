using DelimitedFiles
using BalboaSimulations

FILE = "real_data/Test_Balboa_20231031_15h18.csv"
m = readdlm(FILE, ',', Int, '\n')

timestep = 10 * 1e-3                # [s]
n_steps = size(m)[1]
max_time = (n_steps - 1) * timestep # [s]

tspan = (0, max_time)

v_list = m[:, 1] ./ 1000.0 .* m[:, 2] ./ 400.   # [V]

phi_list = deg2rad.(m[:, 4] ./ 1000.0)          # [rad] 
x_list = m[:, 3] ./ 4. ./ 1000.0                # [m] 
phi_dot_list = deg2rad.(m[:, 5] ./ 1000.0)      # [rad / s]
x_dot_list = m[:, 4] / 4. ./ 1000.0             # [m / s]

controller(x, t) = sampled(x, t, v_list, timestep)

# state = [ϕ, x, ϕ_dot, x_dot]
state0 = [phi_list[1], x_list[1], phi_dot_list[1], x_dot_list[1]]
sol = simulate_balboa(state0, tspan, controller)

using Plots
p_phi = plot(sol.t, sol[1, :], label = "\$\\phi\$ (ODE)")
plot!(p_phi, range(0, max_time, length = n_steps), phi_list, label = "\$\\phi\$ (Real data)")

p_x = plot(sol.t, sol[2, :], label = "\$x\$ (ODE)")
plot!(p_x, range(0, max_time, length = n_steps), x_list, label = "\$x\$ (Real data)")

p_phi_dot = plot(sol.t, sol[3, :], label = "\$\\dot{\\phi}\$ (ODE)")
plot!(p_phi_dot, range(0, max_time, length = n_steps), phi_dot_list, label = "\$\\dot{\\phi}\$ (Real data)")

p_x_dot = plot(sol.t, sol[4, :], label = "\$\\dot{x}\$ (ODE)")
plot!(p_x_dot, range(0, max_time, length = n_steps), x_dot_list, label = "\$\\dot{x}\$ (Real data)")

p = plot(p_phi, p_x, p_phi_dot, p_x_dot, layout=(2,2))
display(p)
