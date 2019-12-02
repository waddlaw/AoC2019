# bench

```
λ stack bench

solve/n=14                               mean 86.57 ns  ( +- 8.008 ns  )
solve/n=1969                             mean 231.5 ns  ( +- 14.86 ns  )
solve/n=100756                           mean 428.3 ns  ( +- 180.0 ns  )

solve2/n=14                              mean 51.66 ns  ( +- 11.43 ns  )
solve2/n=1969                            mean 137.7 ns  ( +- 39.27 ns  )
solve2/n=100756                          mean 199.2 ns  ( +- 21.92 ns  )
```

```
λ stack exec -- time e1
5304147
        0.75 real         0.00 user         0.00 sys

λ stack exec -- time e2
304147
        0.24 real         0.00 user         0.00 sys
```