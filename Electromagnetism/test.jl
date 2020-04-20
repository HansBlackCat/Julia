using PyPlot

src_x = [5,-5]'
src_y = [0,0]'

R = -10:1:9
X = [R;]'
Y = [R;]'
U = repeat([R;]',length(X))
V = repeat([R;],1,length(Y))

#=
Plot a 2D field of arrows.

Call signature::

  quiver([X, Y], U, V, [C], **kw)

Where *X*, *Y* define the arrow locations, *U*, *V* define the arrow
directions, and *C* optionally sets the color.
=#

fig = figure("pyplot_quiverplot",figsize=(10,10))
q = quiver(X,Y,U,V)
d = scatter(src_x, src_y, color="r")
ax = gca()
ax.quiverkey(q,X=0.07,Y = 0.05, U = 10,coordinates="figure", label="Quiver key, length = 10",labelpos = "E")
PyPlot.title("Quiver Plot Example")

