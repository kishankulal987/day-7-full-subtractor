Full Subtractor in Verilog

Overview

This project implements a single-bit Full Subtractor in Verilog using structural modeling. The Full Subtractor performs binary subtraction on three single-bit inputs: a (minuend), b (subtrahend), and bin (borrow-in), producing a difference (diff) and a borrow-out (bout). The design is based on the logical expressions derived from the truth table and K-map:





Difference: D = (A ⊕ B) ⊕ Bin



Borrow-out: Bout = A'B + BBin + A'Bin

A testbench is included to verify functionality through simulation in Vivado.

Module: full_subtractor





Description: A single-bit Full Subtractor designed structurally.



Inputs:





a: Minuend (single-bit).



b: Subtrahend (single-bit).



bin: Borrow-in from the previous stage (single-bit).



Outputs:





diff: Difference output (A ⊕ B ⊕ Bin).



bout: Borrow-out output (A'B + BBin + A'Bin).



Functionality:





Difference: Computed using two XOR gates: t0 = A ⊕ B, diff = t0 ⊕ Bin.



Borrow-out: Computed using one NOT gate (A'), three AND gates (A'B, BBin, A'Bin), and one OR gate to combine results.



Style: Structural modeling with NOT, XOR, AND, and OR gates.

Testbench: testbench_sub





Description: A testbench to simulate and verify the Full Subtractor.



Functionality:





Inputs: Single-bit a, b, and bin.



Tests all input combinations (a, b, bin = 000 to 111) using a for loop with {a, b, bin} = i for i from 0 to 7.



Applies a 10ns delay between test cases.



Monitors and displays inputs (a, b, bin) and outputs (diff, bout) using $monitor.



Time Scale: Defined as 1ns / 1ps for simulation precision.



Purpose: Verifies the Full Subtractor correctly computes the difference and borrow-out for all input combinations.

Files





full_subtractor.v: Verilog module for the Full Subtractor.



full_subtractor_tb.v: Testbench for simulation.

Circuit Diagram

Below is the circuit diagram for the Full Subtractor.
<img width="656" alt="image" src="https://github.com/user-attachments/assets/569e01b9-7f4c-4795-8378-4f9b6440d09f" />


Simulation in Vivado





Setup:





Open Xilinx Vivado (e.g., 2023.2 or later).



Create a new RTL project and specify a project name/location.



Add Files:





Add full_subtractor.v and full_subtractor_tb.v via "Add Sources."



Set full_subtractor_tb as the top module for simulation.



Run Simulation:





Go to "Flow" > "Run Simulation" > "Run Behavioral Simulation."



Vivado’s XSim simulator executes the testbench.



View Results:





Check the console for $monitor output (see below).



Open the waveform viewer to visualize signals.

Simulation Waveform

Below is the simulation waveform from Vivado, showing inputs a, b, bin, and outputs diff, bout over time.
![Screenshot 2025-06-07 122820](https://github.com/user-attachments/assets/0eb1a40d-8317-435b-8262-c693d122a022)


Console Output



Below is the console output from the testbench simulation.

![Screenshot 2025-06-07 122919](https://github.com/user-attachments/assets/bb1e524c-62bc-4e46-a122-93a75d03761d)






0 a=0, b=0, bin=0, diff=0, bout=0



10 a=0, b=0, bin=1, diff=1, bout=1



20 a=0, b=1, bin=0, diff=1, bout=1



30 a=0, b=1, bin=1, diff=0, bout=1



40 a=1, b=0, bin=0, diff=1, bout=0



50 a=1, b=0, bin=1, diff=0, bout=0



60 a=1, b=1, bin=0, diff=0, bout=0



70 a=1, b=1, bin=1, diff=1, bout=1

Features





Structural Design: Built with primitive gates (NOT, XOR, AND, OR) for a hardware-level implementation.



Exhaustive Testing: Testbench covers all 8 input combinations.



Educational: Ideal for learning Verilog, Full Subtractor circuits, and digital arithmetic.



Synthesizable: Suitable for FPGA implementation.
