
# Elevator Problem in PDDL

Consider the problem of controlling the trajectory of an elevator in the following situation:
- The elevator is empty on floor i
- The building has 50 floors
- The elevator has capacity for n people
- There is a list of demands as follows: [(o1, d1), (o2, d2) ...] where oi is a floor where a passenger is waiting, and di is another floor where the passenger wants to go.
The solution to the problem is a sequence of operations up/down/in/out:
- up: the elevator goes up one floor
- down: the elevator goes down one floor
- in: a passenger enters
- out: a passenger exits
