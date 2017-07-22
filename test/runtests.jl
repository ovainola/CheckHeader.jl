# This file is a part of JuliaFEM.
# License is MIT: see https://github.com/ahojukka5/CheckHeader.jl/blob/master/LICENSE

using CheckHeader
using Base.Test

@testset "CheckHeader.jl" begin
    new_file_path = Pkg.dir("CheckHeader", "src", "new_file.jl")
    if isfile(new_file_path)
        rm(new_file_path)
    end
    @test checkheader("CheckHeader")
    fid = open(new_file_path, "w")
    write(fid, """
# This file is not a part of JuliaFEM.
# License is not MIT: don't see https://github.com/ahojukka5/CheckHeader.jl/blob/master/LICENSE

function foo()
    return 1
end
""")
    close(fid)
    @test_throws Exception checkheader("CheckHeader")
end
