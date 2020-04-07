using DifferentialEquations
using Plots; gr()

# Lotka-Volterra ODE
"""
x' = ax - bxy
y' = -cy + dxy
"""

p = (1., 2., 1.5, 1.25) # a,b,c,d
f = function (du,u,p,t) #
    a,b,c,d = p
    du[1] = a*u[1] - b*u[1]*u[2]
    du[2] = -c*u[2] + d*u[1]*u[2]
end

u0 = [1.; 1.]
tspan = (0., 10.)
prob = ODEProblem(f, u0, tspan, p)

sol = solve(prob)
plot(sol, title="All Plots.jl Attributes are Available")
