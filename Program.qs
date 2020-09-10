namespace BellStates {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    

    // Sets a qubit into the desired state of |0⟩ or |1⟩. 
    operation setQubitState(desired_state: Result, qbit: Qubit) : Unit {
        // Measures the current qubit state on the Pauli Z basis. 
        if(desired_state != M(qbit)) {
            // If it's not the desired state, apply the Pauli X-gate. 
            X(qbit); 
        }
    }

    @EntryPoint()
    // Demonstrates properties of quantum superposition and entanglement via the setQubitState() function and quantum gates.
    operation testBellState(count: Int, initial: Result) : (Int, Int) {
        mutable num_ones = 0; // number of |0⟩ states
        mutable num_zeros = 0; // numbber of |1⟩ states

        // Allocates 1 qubit for use, and then releases it at the end of execution.
        using(qubit = Qubit()) {

            for(test in 1..count) {
                setQubitState(initial, qubit);
                let measurement = M(qubit);

                // Count the number of occurences of the |1⟩ state
                if(measurement == One) {
                    set num_ones += 1;
                }
            }
            setQubitState(Zero, qubit);
        }

        set num_zeros = count - num_ones;

        // Return the number of times the states |0⟩ and |1⟩ were observed.
        Message("Test results (# of 0s, # of 1s): ");
        return(num_zeros, num_ones);

    } 
}
