# This file is a part of JuliaFEM.
# License is MIT: see https://github.com/ahojukka5/CheckHeader.jl/blob/master/LICENSE

using CheckHeader
using Base.Test

@testset "CheckHeader.jl" begin
    @test checkheader("CheckHeader")
    fid = open(Pkg.dir("CheckHeader", "src", "new_file.jl"), "w")
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
