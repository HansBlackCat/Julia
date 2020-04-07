using Plots; gr()
# Shift+Ctrl+p -> open plot 
# Shift+Enter

x = 1:10; y = rand(10,2); # These are the plotting data
display(plot(x, y,))

z = rand(10)
display(plot!(x, z))

x = 1:10; y = rand(10,2);
display(plot(x, y, title="Two Lines", label=["Line1" "Line2"], lw=3))
savefig("myplot.png")

display(plot(x, y, seriestype=:scatter, title="My Scatter Plot"))

