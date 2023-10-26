# BalboaSimulations

BalboaSimulations.jl is a Julia package with functions that simulate a wheeled inverted pendulum such as modelled in [1], applied to the Balboa 32U4 Balancing Robot. It is a simplified model where both wheel are controlled in the exact same way, and where the problem is reduced from 3D to 2D.

[1] [U. Zwiers, Modeling of wheeled inverted pendulum systems, 2016, in proceedings of the 16th International Conference on Research and Education in Mechatronics (REM).](https://ieeexplore.ieee.org/document/7380406)

## Example

This package uses `LinearAlgebra` and `DifferentialEquations`. The following is an example where we simulate the robot between $t = 0$ and $t = 100$ with initial states $(x_0, \varphi_0, \dot{x}_0, \dot{\varphi}_0) = (0, 0, 0, 0)$.

```jl
using BalboaSimulations

x0 = [0., 0., 0., 0.]
tspan = (0, 100.0)
sol = simulate_balboa(x0, tspan, constant)
```

Then, `sol` is a `SciMLBase.ODESolution` and can be further analyzed/plotted/...
