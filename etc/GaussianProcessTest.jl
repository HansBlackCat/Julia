using GaussianProcesses, Optim
using Random
using Plots

# http://stor-i.github.io/GaussianProcesses.jl/latest/Regression/

Random.seed!(20140430)
# Training data
n=10;                          #number of training points
x = 2π * rand(n);              #predictors
y = sin.(x) + 0.05*randn(n);   #regressors

#Select mean and covariance function
mZero = MeanZero()                   #Zero mean function
kern = SE(0.0,0.0)                   #Sqaured exponential kernel (note that hyperparameters are on the log scale)

logObsNoise = -1.0                        #log standard deviation of observation noise (this is optional)
gp = GP(x,y,mZero,kern,logObsNoise)       #Fit the GP

optimize!(gp)                                  #Optimize, method="L-BFGS"
#optimize!(gp; kern = false)                    #Don't optimize kernel hyperparameters
#optimize!(gp; kernbounds = [[-1, -1], [1, 1]]) #Optimize the kernel parameters in a box with lower bounds [-1, -1] and upper bounds [1, 1]

μ, σ² = predict_y(gp,range(0,stop=2π,length=100))

# Plotting
# plot(gp; xlabel="x", ylabel="y", title="Gaussian process", legend=false, fmt=:png)


# ---------------------------------------------------------------------

# Generate random data for Gaussian process
x = 2π * rand(10)
y = sin.(x) + 0.5*rand(10)

# Set-up mean and kernel
se = SE(0.0, 0.0)
m = MeanZero()

# Construct and plot GP
gp = GP(x,y,m,se)
# plot(gp;  xlabel="gp.x", ylabel="gp.y", title="Gaussian process", legend=false, fmt=:png)

# ---------------------------------------------------------------------

# Simulate data for 2D Gaussian process
X = 2π*rand(2, 10)
y = sin.(X[1,:]) .* cos.(X[2,:]) + 0.5*rand(10)
gp2 = GP(X,y,m,se)
# Plot mean and variance
p1 = plot(gp2; title="Mean of GP")
p2 = plot(gp2; var=true, title="Variance of GP", fill=true)
plot(p1, p2; fmt=:png)
