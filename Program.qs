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
    operation testBellState(count: Int, initial: Result) : (Int, Int, Int) {
        mutable num_ones = 0; // number of |0⟩ states
        mutable num_zeros = 0; // numbber of |1⟩ states
        mutable entangle = 0; // confirms the number of occurences where both qubits are entangled

        // Allocates 1 qubit for use, and then releases it at the end of execution.
        using((qubit_0, qubit_1) = (Qubit(), Qubit())) {

            for(test in 1..count) {
                setQubitState(initial, qubit_0);
                setQubitState(Zero, qubit_1);
                H(qubit_0); // Performs the Hadamard operation on qubit
                CNOT(qubit_0, qubit_1); // Executes a CNOT gate on both qubits
                let measurement = M(qubit_0);

                if(M(qubit_1) == measurement) {
                    set entangle += 1;
                }

                // Count the number of occurences of the |1⟩ state
                if(measurement == One) {
                    set num_ones += 1;
                }
            }
            setQubitState(Zero, qubit_0);
            setQubitState(Zero, qubit_1);
        }

        set num_zeros = count - num_ones;

        // Return the number of times the states |0⟩ and |1⟩ were observed.
        Message("Test results: (# of 0s, # of 1s, # of agreements between 2 entangled qubits)");
        return(num_zeros, num_ones, entangle);

    } 
}
