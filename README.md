# Monty Hall Simulator

Simulator for [the Monty Hall problem](https://en.wikipedia.org/wiki/Monty_Hall_problem)

## Usage: Running a Single Simulation

```
ruby monty_hall.rb run_once <number of doors> <strategy>
```

example output:

```
ruby monty_hall.rb run_once 3 change
# setup game with 3 doors with 1 winner and 2 goats.
# selected door 3.
# revealed door 2 to be a goat.
# change selection to door 1.
# You win the prize!
```

## Usage: Running Multiple Simulations

```
ruby monty_hall.rb run_multiple <number of doors> <strategy> <number of simulations>
```

example output:

```
ruby monty_hall.rb run_multiple 4 hold 10000
# won 2499/10000 times, a 24.99% success rate.
```

note: regardless of number of doors, only one goat is revealed when using strategy `change`.
