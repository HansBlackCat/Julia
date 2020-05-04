using ForwardDiff, Plots, DataFrames

f(x) = exp(x)+1000
X = [-10:0.1:10;]
Y = f.(X)
Y′ = ForwardDiff.derivative.(f, X)

g = x -> ForwardDiff.gradient(f, x) # g = ∇f

XY  = transpose([1 2 3; 4 5 6])
XY2 = DataFrame(A=[1:2:10;], B=[1:3:15;]) 

#plot(X,Y)
#plot!(X,Y′)

# --

f1(X)    = sin(X[1]+X[2]) + exp(X[1]) * exp2(X[2])
f2(x,y)  = sin(x+y) + exp(x) * exp(y)
X = reshape([1:20;],:,2)
XX = reshape([[i,j] for i=-10:10, j=-10:10],:,1)


