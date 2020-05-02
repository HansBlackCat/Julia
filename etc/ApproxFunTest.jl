using ApproxFun, Plots

f  = Fun(Taylor(), [1,2,3]) # 1+2x+3x^2 (Taylor) 
f₀ = x -> 1+2x+3x^2 

# Chebyshev Poly 
# cos(kt) <==> cos(t)Pₖ

# Chebyshev space
# f(x) = ∑ fₖTₖ(x)
# Tₖ(x) = cos(k)*acos(x)
f2 = Fun(exp,Chebyshev())

Tk(k,x) = cos(k)*acos(x)

# Plottting
X = [-1:0.05:1;]
plot(X, map(x->1/(sqrt(1-x^2)), X))
plot!(X, map(x->Tk(1,x), X))
plot!(X, map(x->Tk(2,x), X))
plot!(X, map(x->Tk(3,x), X))
