using PyPlot

function coulomb(src_loc, src_charge, loc)
    ϵ₀ = 8.854e-12
    k₀ = 1/(4*π*ϵ₀)
    distance(p1,p2) = √((p1[1]-p2[1])^2+(p1[2]-p2[2])^2)

    dist = distance(src_loc, loc)
    unit = (loc - src_loc) / dist

    E = k₀ * (src_charge*unit / dist^2)
    
    return E 
end

# TestPlotting
R = -10:1:9
X = [R;]'
Y = [R;]'
Mesh = [[j,i] for i=R, j=R]

Src = [0 0]
Sol = zeros(length(X),length(Y))
for i in 1:length(Src[:,1])
    Sol += map(x -> coulomb(Src[i,:],+10,x), Mesh) 
end

Sol_x = map(x -> x[1], Sol)
Sol_y = map(x -> x[2], Sol)

fig = figure("pyplot_quiverplot",figsize=(10,10))
q = quiver(X,Y,Sol_x,Sol_y)
ax = gca()
ax.quiverkey(q,X=0.07,Y = 0.05, U = 10,coordinates="figure", label="Quiver key, length = 10",labelpos = "E")
PyPlot.title("Quiver Plot Example")

