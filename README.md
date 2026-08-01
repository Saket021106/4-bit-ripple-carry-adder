# 4-Bit Ripple Carry Adder (Structural Verilog)

## 📌 Project Overview
This repository contains a structural Verilog implementation of a 4-bit Binary Ripple Carry Adder (RCA). The design is strictly structural, building up from basic logic gates to a complete 4-bit arithmetic unit. 

The modular architecture demonstrates proper instantiation and signal mapping in SystemVerilog, breaking down complex logic into reusable, foundational hardware blocks.

## 🏗️ Architecture Hierarchy
The project follows a bottom-up design methodology:
1. **Half Adder (`half_adder`)**: Computes the sum and carry of two single-bit inputs using `XOR` and `AND` logic.
2. **Full Adder (`full_adder`)**: Constructed by instantiating two Half Adders and an `OR` gate to account for a Carry-In signal.
3. **4-Bit Binary Adder (`binary_adder`)**: Utilizes a `generate` block to chain four Full Adders together, routing the `cout` (Carry-Out) of one stage directly into the `cin` (Carry-In) of the next.

## 📂 File Structure
* `design.sv`: Contains the RTL modules (`half_adder`, `full_adder`, `binary_adder`).
* `testbench.sv`: Contains the simulation environment, test vectors, and self-checking assertions for edge cases.
* `waveform.png`: A capture of the GTKWave/EDA simulation output verifying the logic.

## 🚀 How to Run the Simulation
You can simulate this design using any standard HDL simulator (e.g., Icarus Verilog, ModelSim, Vivado, or EDA Playground). 

**Using Icarus Verilog (CLI):**
```bash
# Compile the design and testbench
iverilog -o adder_sim design.sv testbench.sv

# Run the simulation
vvp adder_sim
