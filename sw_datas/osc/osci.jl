using XLSX, DataFrames

# https://en.wikibooks.org/wiki/Introducing_Julia/Working_with_text_files
# https://en.wikibooks.org/wiki/Introducing_Julia/Strings_and_characters
open("./Q2DATA/3600RPM.txt") do file
    resPhaseLine = readlines(file)
    resPhaseLine2 = map(x -> split(x, r"(\t|\s|\n)", keepempty=false), resPhaseLine)

    # https://discourse.julialang.org/t/adding-a-new-row-to-a-dataframe/1331/4
    df = DataFrame(A=String[],B=String[],C=String[])
    for i in 1:length(resPhaseLine2)
        push!(df, resPhaseLine2[i])
    end
    XLSX.writetable("3600RPM.xlsx", collect(DataFrames.eachcol(df)), DataFrames.names(df))
    df
    # resPhaseDf = convert(DataFrame, resPhaseLine2)
    # split(resPhaseLine, r"\t|\s|\n")
end