using DifferentialEquations
using Plots; gr()

params = (1., 2., 1.5, 1.25)

function lv(du, u, p, t) 
    α, β, γ, δ = p
    du[1] = α*u[1] - β*u[1]*u[2]
    du[2] = -γ*u[2] + δ*u[1]*u[2]
end

μ₀ = [1., 1.]
tspan = (0., 10.)
prob = ODEProblem(lv, μ₀, tspan, params)
sol = solve(prob)

#=
p1 = plot(sol, title="Lotka-Volerra ODE")
p2 = plot(sol, title="Phase Diagram", vars=(1,2))
p3 = plot(sol, title="test", vars=(0,1))
plot(p1,p2,p3, layout=(3,1), legend=true)
=#
plot(sol, title="Phase Diagram", vars=(1,2))
plot!(x->x)
