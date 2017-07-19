# This file is a part of JuliaFEM.
# License is MIT: see https://github.com/ahojukka5/CheckHeader.jl/blob/master/LICENSE

using CheckHeader
using Base.Test

@testset "CheckHeader.jl" begin
    @test checkheader("CheckHeader")
end
