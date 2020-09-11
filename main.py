import qsharp
from BellStates import setQubitState, testBellState

print("\nThis is a program created in Q# that demonstrates the concepts of superposition and entanglement in the context of quantum computing.")
print("A qubit is passed through a Hadamard gate, putting it in a superposition of 1/√2(|0⟩ + |1⟩)")
print("This qubit is then entangles with a secondary qubit by sending both of them through a CNOT gate.\n")

count = int(input("How many times should the simulation be run? "))
init = int(input("What is the inital state of the first qubit? Enter 0 or 1. "))
assert init == 0 or init == 1, "Invalid input. Terminating program."
print("\n")

sim = testBellState.simulate(count = count, initial = init)

print(sim)