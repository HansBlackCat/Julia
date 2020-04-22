using PyPlot

function coulomb3D(src_loc, src_charge, loc)
    ϵ₀ = 8.854e-12
    k₀ = 1/(4*π*ϵ₀)
    distance(p1,p2) = √((p1[1]-p2[1])^2+(p1[2]-p2[2])^2+(p1[3]-p2[3])^2)

    dist = distance(src_loc, loc)
    unit = (loc - src_loc) / dist

    E = k₀ * (src_charge*unit / dist^2)
    
    return E 
end

function electrical_energy(charges_loc_array, charges_array)
    # charges_loc_array : nx3 Array{Float64,2}
    # charges_array     : n-element Array{Float64,1}

    ϵ₀ = 8.854e-12
    k₀ = 1/(4*π*ϵ₀)
    distance(p1,p2) = √((p1[1]-p2[1])^2+(p1[2]-p2[2])^2+(p1[3]-p2[3])^2)
    N = length(charges_loc_array[:,1])

    U = 0
    # \sum_{i=1}^{N}\sum_{j≠i}
    for i in 1:N
        for j in 1:N
            if i==j
                break
            end
            U += k₀*(charges_array[i]*charges_array[j]/distance(charges_loc_array[i,:],charges_loc_array[j,:]))
        end
    end

    return (0.5)*U
end


# Line
charge_loc = [collect(-1000:999) zeros(2000) zeros(2000)]
charges_arr = [ones(2000);]
loc = [0 1 0]
