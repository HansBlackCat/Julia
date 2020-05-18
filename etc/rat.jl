
function rat((a,b,c,d,e,f,g,i,j))
    if a//b == c//(10*d+e) && (10*f+g)//(10*i+j) == e//f
        true
    else
        false
    end
end

myList = [(a,b,c,d,e,f,g,i,j) for a=1:9, b=1:9, c=1:9, d=1:9, e=1:9, f=1:9, g=1:9, i=1:9, j=1:9 if a!=b && b!=c && c!=d && d!=e && e!=f && f!=g && g!=i && i!=j]

for a in myList
    if rat(a)
        println(a)
    end
end

function meshing(N)
    tempN = [1:(N-1);]