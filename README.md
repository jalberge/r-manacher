
<!-- README.md is generated from README.Rmd. Please edit that file -->

# manacher

<!-- badges: start -->
<!-- badges: end -->

My own try to implement Manacher’s algorithm to find the longest
palindromic substring. Also works for DNA sequences (with the convention
that a DNA palindrome cannot have a single central nucleotide).

## Installation

You can install the development version of manacher from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("jalberge/r-manacher")
```

## Example

``` r
library(manacher)
## basic example code
manacher("kayak!")
#> [1] "kayak"
manacher_dna("CGGG", dna=TRUE)
#> changed c: 1
#> changed r: 1
#> changed c: 3
#> changed r: 5
#> changed c: 7
#> changed r: 7
#> changed c: 9
#> changed r: 9
#> $center
#> [1] 1.5
#> 
#> $start
#> [1] 1
#> 
#> $match
#> [1] "CG"
#> 
#> $length
#> [1] 2
```
