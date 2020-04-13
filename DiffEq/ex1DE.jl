using DifferentialEquations
using Plots

# Ex1) Simple

# ODE with du/dt = f(u,p,t)
f(u,p,t) = 1.01*u

# Ans: μexp(αt)

# Initial Condidtion (u(tspan[1]) = u0)
u0 = 1/2
tspan = (0.0,1.0)
prob = ODEProblem(f,u0,tspan)

# `reltol` == relative tolerance, small, more accuracte
# `saveat n` == solver save every n time points
#   if you only interesting in final stage, `save_everystep=false`
# Tsit5() == Algorithm to solve
sol = solve(prob, Tsit5(), reltol=1e-8, abstol=1e-8)

plot(sol,linewidth=5,title="Solution to the linear ODE with a thick line",
     xaxis="Time (t)",yaxis="u(t) (in μm)",label="My Thick Line!") # legend=false
plot!(sol.t, t->0.5*exp(1.01t),lw=3,ls=:dash,label="True Solution!")

