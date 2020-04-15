# Simple Harmonic Oscilliaion
using OrdinaryDiffEq, Plots; gr()

#=
x\hhat + \omega^2 x = 0
=#

ω = 1

x₀ = [0.]
dx₀ = [π/2]
tspan = (0., 2π)
ϕ = atan((dx₀[1]/ω)/x₀[1])
A = √(x₀[1]^2 + dx₀[1]^2)

function harmonicoscillator(ddu,du,u,ω,t)
    ddu .= -ω^2 * u
end

prob = SecondOrderODEProblem(harmonicoscillator, dx₀, x₀, tspan, ω)
sol = solve(prob, DPRKN6())

plot(sol, vars=[2,1], linewidth=2, title ="Simple Harmonic Oscillator", xaxis = "Time", yaxis = "Elongation", label = ["x" "dx"])
plot!(t->A*cos(ω*t-ϕ), lw=3, ls=:dash, label="Analytical Solution x")
plot!(t->-A*ω*sin(ω*t-ϕ), lw=3, ls=:dash, label="Analytical Solution dx")