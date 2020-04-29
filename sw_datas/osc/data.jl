using XLSX, DataFrames, PyPlot

df_1000RPM = DataFrame(XLSX.readtable("1000RPM.xlsx","Sheet1")...)
df_1500RPM = DataFrame(XLSX.readtable("1500RPM.xlsx","Sheet1")...)
df_1800RPM = DataFrame(XLSX.readtable("1800RPM.xlsx","Sheet1")...)
df_1900RPM = DataFrame(XLSX.readtable("1900RPM.xlsx","Sheet1")...)
df_2000RPM = DataFrame(XLSX.readtable("2000RPM.xlsx","Sheet1")...)
df_2100RPM = DataFrame(XLSX.readtable("2100RPM.xlsx","Sheet1")...)
df_2400RPM = DataFrame(XLSX.readtable("2400RPM.xlsx","Sheet1")...)
df_3000RPM = DataFrame(XLSX.readtable("3000RPM.xlsx","Sheet1")...)
df_3600RPM = DataFrame(XLSX.readtable("3600RPM.xlsx","Sheet1")...)
df_FRMag   = DataFrame(XLSX.readtable("Frequency Response_Magnitude.xlsx","Sheet1")...)
df_FRPhs   = DataFrame(XLSX.readtable("Frequency Response_Phase.xlsx","Sheet1")...)
dfs = [df_1000RPM, df_1500RPM, df_1800RPM, df_1900RPM, df_2000RPM, df_2100RPM, df_2400RPM, df_3000RPM, df_3600RPM, df_FRMag, df_FRPhs]

# Change DataFrames' elements type to Float64
for df_i in dfs
    df_col_length = length(names(df_i))
    for i in 1:df_col_length
        df_i[!,i] = map(x->parse(Float64,x),df_i[!,i])
    end
end

fig = figure("N-RPM")
grid(); gca()
plot(25*df_1000RPM.B, 1.25*df_1000RPM.C)
plot(25*df_1500RPM.B, 1.25*df_1500RPM.C)
plot(25*df_1800RPM.B, 1.25*df_1800RPM.C)
plot(25*df_1900RPM.B, 1.25*df_1900RPM.C)
plot(25*df_2000RPM.B, 1.25*df_2000RPM.C)
plot(25*df_2100RPM.B, 1.25*df_2100RPM.C)
plot(25*df_2400RPM.B, 1.25*df_2400RPM.C)
plot(25*df_3000RPM.B, 1.25*df_3000RPM.C)
plot(25*df_3600RPM.B, 1.25*df_3600RPM.C)
