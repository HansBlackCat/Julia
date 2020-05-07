using Plots

   
f(x) = x^3/(exp(x)-1)
x = [0.1:0.1:50000;]
y = f.(x)



#plot(x, f.(x))