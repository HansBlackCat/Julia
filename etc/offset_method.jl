using PyPlot
using GLM, DataFrames, Random

Δt = randn(Float64, 12)
x = [1.0:12.0;]
X = [ones(12) x]
y = x + Δt
data = DataFrame()
data.X = x; data.Y = y

ols = lm(@formula(Y ~ X), data)
xycoef = coef(ols)

xycoef2 = X \ y

p = plot(x, y, c="k")
p = plot(x, xycoef[1] .*x .+ xycoef[2], c="r")
p = plot(x, xycoef2[1] .*x .+ xycoef2[2], c = "b")
