pragma circom 2.0.0;

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

/* Circuit that proves the inputs A (0) & B (1) yields a 0 output.*/

template MyCircuit () {
    // Inputs
    signal input a;
    signal input b;
    
    // Internal signals
    signal x;
    signal y;

    // Output
    signal output q;

    // Components
    component andGate = AND();
    component notGate = NOT();
    component orGate = OR();

    // Wiring the components
    andGate.a <== a;
    andGate.b <== b;
    x <== andGate.out;

    notGate.in <== b;
    y <== notGate.out;

    orGate.a <== x;
    orGate.b <== y;
    q <== orGate.out;

    // Logging the output
    log("Output Q : ", q);
}

// Instantiating the circuit
component main = MyCircuit();
