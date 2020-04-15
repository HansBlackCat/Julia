using OrdinaryDiffEq, Plots; gr()

C₁ = 5.730 # years

u₀ = 1.0
tspan = (0., 1.)

radioactivedecay(u,p,t) = -C₁*u
prob = ODEProblem(radioactivedecay,u₀,tspan)
sol = solve(prob,Tsit5())

plot(sol,linewidth=2,title ="Carbon-14 half-life", 
     xaxis = "Time in thousands of years", yaxis = "Percentage left", label = "Numerical Solution")
plot!(sol.t, t->exp(-C₁*t),lw=3,ls=:dash,
      label="Analytical Solution")
      