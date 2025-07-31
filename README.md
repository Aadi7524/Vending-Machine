# Vending Machine FSM (Verilog)

## Overview
A Finite State Machine (FSM)-based Vending Machine implemented in Verilog.  
Supports both coin-based and online payments. Includes a testbench for simulation.

## Features
- 🎯 Product Selection via 3-bit product code
- 💰 Supports both **Coin-Based** and **Online Payments**
- 💸 Automatic **Change Return** calculation (for coin payments)
- 📦 Dispenses multiple product types:
  - Pen
  - Notebook
  - Coke
  - Lays
  - Water Bottle
- 🔁 Cancel Transaction support with full refund
- 🧪 Includes **Testbench** for behavioral simulation in Vivado

## Files Included
- `vendingmachine.v` — Main FSM design (Verilog)
- `VendingMachineTB.v` — Testbench for simulation
- `.gitignore` — Excludes Vivado-generated files (`.sim/`, `.runs/`, `.cache/`, etc.)

## How to Run
Simulate the design using **Vivado 2024.1**:

1. Open the project in Vivado (`Vending_Machine1.xpr`)
2. Run **Behavioral Simulation**.
3. Observe waveforms and outputs in the simulation window.

## Author
Aditya
