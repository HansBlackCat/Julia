using XLSX
using Plots
using DataFrames

xm = XLSX.readdata("./impacthammar/data1_impacthammar.xlsx", "Magnitude", "A2:D1002")
xp = XLSX.readdata("./impacthammar/data1_impacthammar.xlsx", "Phase", "A2:D1002")

xm_xaxis = xm[1:end,1]
xp_xaxis = xp[1:end,1]


mxval1, mxindx1 = findmax(xm[1:end,2]; dims=1)
mxval2, mxindx3 = findmax(xm[1:end,3]; dims=1)
mxval3, mxindx3 = findmax(xm[1:end,4]; dims=1)


pl1 = plot(
    plot(xm_xaxis, xm[1:end,2], title="node1"),
    plot(xm_xaxis, xm[1:end,3], title="node2"),
    plot(xm_xaxis, xm[1:end,4], title="node3"),
    layout=(3,1),
    lw=3
)

pl2 = plot(
    plot(xp_xaxis, xp[1:end,2], title="node1"),
    plot(xp_xaxis, xp[1:end,3], title="node2"),
    plot(xp_xaxis, xp[1:end,4], title="node3"),
    layout=(3,1),
    lw=3
)
png(pl1, "Magnitude")
png(pl2, "Phase")


