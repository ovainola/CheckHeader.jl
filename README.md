# CheckHeader.jl

A simple script to test are is header consistent in source files of project.
Typically the header contains information about license.

Usage is very simple:

```julia
julia> checkheader(pkgname)
```

Script extracts header information from `src/pkgname` and after that loops
all files in src and test directories, comparing other header strings to
this one, and throws error if there is mismatch in header lines.
