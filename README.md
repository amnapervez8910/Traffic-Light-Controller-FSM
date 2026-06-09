# 🚦 Traffic Ligh Controller Using FSM

A Verilog-based Traffic Light Controller designed using a Moore Finite State Machine for a 4-way intersection.

## Inputs & Outputs

| Type | Name | Description |
|------|------|-------------|
| Input | `clk` | 100 MHz clock |
| Input | `rst` | Active-high reset |
| Output | `light_M1` | Main Road 1 (3-bit) |
| Output | `light_M2` | Main Road 2 (3-bit) |
| Output | `light_MT` | Main Through Road (3-bit) |
| Output | `light_S` | Side Road (3-bit) |

## Light Encoding
| Code | Color |
|------|-------|
| 001 | Green |
| 010 | Yellow |
| 100 | Red |

## State Sequence
S1 (7 cycles) → S2 (2) → S3 (5) → S4 (2) → S5 (3) → S6 (2) → back to S1

## Files
- `traffic_light_controller.v` - Main Verilog code
- `traffic_light_controller_tb.v` - Testbench
- `traffic-light-report.pdf` - Full report

## How to Run
1. Open ModelSim
2. Add both .v files
3. Compile and run
4. View waveform

## Applications
- 4-way traffic intersections
- Smart city traffic control
