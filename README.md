# Booth Multiplier

## Overview
This project implements signed binary multiplication using Booth's Algorithm in Verilog HDL, following an FSM + datapath architecture. A finite state machine controller sequences the shift-add/subtract operations of the datapath, which integrates an ALU, PIPO registers, a shift register, and a down-counter. The design is functionally verified using a dedicated Verilog testbench.

## Features
- Signed multiplication using Booth's Algorithm
- FSM-based controller driving a modular datapath
- Datapath built from reusable blocks: ALU, PIPO registers, shift register, down-counter
- Shift-add/subtract sequencing based on Booth recoding of the multiplier bits
- Modular, hierarchical RTL design
- Functional verification using a Verilog testbench across signed operand pairs

## Tools Used
- Verilog HDL
- Xilinx Vivado
- ModelSim (or your simulator)

## Author
**Pratiksha Upadhye**

Electronics & Telecommunication Engineering Student | Aspiring RTL Design & Verification Engineer

GitHub: https://github.com/upadhyepratiiksha-dot

LinkedIn: https://linkedin.com/in/pratiksha-upadhye
