for T in [Int8,Int16,Int32,Int64,Int128,UInt8,UInt16,UInt32,UInt64,UInt128]
    println("$(lpad(T,7)): [$(typemin(T)), $(typemax(T))]")
end
print("\n")


println("$(bitstring(-.0))")
println("1/Inf == $(1/Inf)")
println("1/0   == $(1/0)")
println("0/0   == $(0/0)")
println("")

println("<Machine epsilon>")
println("eps(Float32) == $(eps(Float32))")

println("[1,2,3].^3 == $([1,2,3].^3)")
print("\n")

# `im` is for complex number
println("(1+2im)*(3-3im) == $((1+2im)*(3-3im))")
println("sqrt(-1+0im) == $(sqrt(-1+0im))")

str = "long string"
substr = SubString(str,1,4)

hello = "hello"
world = "world"
hello_world = String(hello, " ", world, "\n")

function f(x,y)
    x+y
end

g = f
# g(2,3) == 5

