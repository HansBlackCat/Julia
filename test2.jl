# include("test.jl")
using ThinkJulia

function printtwice(a)
    println(a)
    println(a)
end

function printtwiceV2(a)
    println(a^2)
end

tur = Turtle()

#=
@svg begin
    forward(tur, 100)
    turn(tur, -90)
    forward(tur, 100)
end
@svg begin
    for i in 1:4
        forward(tur, 100)
        turn(tur, -90)
    end
end
=#

function polygon(t,n,len)
    angle = 360/n
    for i in 1:n
        forward(t,len)
        turn(t,-angle)
    end
end

function circle(t,r)
    circum = 2*π*r
    n = 100
    len = circum/n
    polygon(t,n,len)
end

"""
Draw a arc

arc(Image, Radius, Angle)
"""
function arc(t,r,ang)
    circum = 2*π*r*(ang/360)
    n = trunc(circum/3)+1
    dlength = circum/n
    dangle = ang/n
    for i in 1:n
        forward(t,dlength)
        turn(t,-dangle)
    end
end

#=
function darc(t,dlen,ang)
    turn(t,ang/2)
    forward(t,dleng)
end
=#

function flower_(t,radius,angle)
    repet = 360/angle
    for i in 1:repet
        arc(t,radius,angle)
        turn(t,180+angle)
        arc(t,radius,angle)
        turn(t,180+2*angle)
    end
end

function flower(t,radius,pedal)
    angle = 360/pedal
    flower_(t,radius,angle)
end

# YYYYYYYYY
function archiSpiral(t,a,cir)
    dl = 1
    da = 1
    for i in 1:360*cir
        forward(t,dl)
        turn(t,-a)
    end
end

function draw(t, length, n)
    if n == 0
        return
    end
    angle = 50
    forward(t, length*n)
    turn(t, -angle)
    draw(t, length, n-1)
    turn(t, 2*angle)
    draw(t, length, n-1)
    turn(t, -angle)
    forward(t, -length*n)
end

@svg begin
    # polygon(tur,7,70)
    # circle(tur, 80)
    # arc(tur,100,45)
    # flower(tur,100,16)
    # archiSpiral(tur,2,10)
    draw(tur,10,20)
end
