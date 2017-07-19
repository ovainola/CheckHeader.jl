# CheckHeader.jl

A simple script to test is header information consistent in source files of
project. Typically the header contains information about license.

Usage is very simple:

```julia
julia> checkheader(pkgname)
```

Script extracts header information from `src/pkgname` and after that loops
all files in src and test directories, comparing other header strings to
this one, and throws error if there is mismatch in header lines. So, with
this script it can be tested does the header string in each source file match
to what is defined in main entry point of package.

Typical application is to add this to `.travis.yml` of project, to make sure
that license information is correct for any new files before merging to
project:

```yaml
before_script:
    - julia --color=yes -e 'Pkg.clone("https://github.com/ahojukka5/CheckHeader.jl.git")'
script:
    - julia --color=yes -e 'using CheckHeader; checkheader("$your_package")'
```
