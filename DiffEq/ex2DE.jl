using Plots
using DifferentialEquations

# Ex2) Lorenz Eq

function lorenz!(du,u,p,t)
    du[1] = 10.0*(u[2]-u[1])
    du[2] = u[1]*(28.0-u[3]) - u[2]
    du[3] = u[1]*u[2] - (8/3)*u[3]
end

function parameterized_lorenz!(du,u,p,t)
    du[1] = p[1]*(u[2]-u[1])
    du[2] = u[1]*(p[2]-u[3]) - u[2]
    du[3] = u[1]*u[2] - p[3]*u[3]
end

#=
function parameterized_lorenz!(du,u,p,t)
    x,y,z = u
    σ,ρ,β = p
    du[1] = dx = σ*(y-x)
    du[2] = dy = x*(ρ-z) - y
    du[3] = dz = x*y - β*z
  end
=#

# 3-element Array
u0 = [1.; 0.; 0.]
tspan = (0., 100.)

prob = ODEProblem(lorenz!,u0,tspan)
sol = solve(prob)

# Parameter
pp = [10.0,28.0,8/3]
probp = ODEProblem(parameterized_lorenz!,u0,tspan,pp)
solp = solve(probp)

plot(solp,vars=(1,2,3))

