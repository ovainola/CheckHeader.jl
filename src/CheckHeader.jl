# This file is a part of JuliaFEM.
# License is MIT: see https://github.com/ahojukka5/CheckHeader.jl/blob/master/LICENSE

module CheckHeader

function checkheader(package::String)
    end_idx = 2
    pkg_dir = Pkg.dir(package)
    main_file = joinpath(pkg_dir, "src", package * ".jl")
    header = readlines(open(main_file))[1:end_idx]
    println("Found header:")
    for j=1:end_idx
        println(header[j])
    end
    dirs = ["src", "test"]
    hasdiff = false
    nfiles = 0
    for dir in dirs
        all_files = readdir(joinpath(pkg_dir, dir))
        for file_name in all_files
            endswith(file_name, ".jl") || continue
            nfiles += 1
            src_file = joinpath(pkg_dir, dir, file_name)
            fheader = readlines(open(src_file))[1:end_idx]
            for j=1:end_idx
                if header[j] != fheader[j]
                    warn("Header content difference in file $dir/$file_name:")
                    hasdiff = true
                    break
                end
            end
        end
    end
    if hasdiff
        error("Header differences between source files.")
    end
    info("Header is same in all $nfiles files.")
    return true
end

export checkheader

end
