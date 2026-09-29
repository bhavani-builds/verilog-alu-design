# 🔢 4-Bit ALU Design Using Verilog HDL

A modular **4-bit Arithmetic Logic Unit (ALU)** designed and verified using **Verilog HDL**.

The ALU performs arithmetic and logical operations and provides **Carry, Zero, and Signed Overflow flags**.

---

## 🚀 Features

- 4-bit data path
- 8 ALU operations
- Addition
- Subtraction
- Bitwise AND
- Bitwise OR
- Bitwise XOR
- Bitwise NOT
- Increment
- Decrement
- Carry flag
- Zero flag
- Signed overflow detection
- Automated testbench
- VCD waveform generation
- GitHub Actions continuous integration

---

## 🧮 ALU Operation Table

| ALU_SEL | Operation | Description |
|--------:|-----------|-------------|
| `000` | ADD | A + B |
| `001` | SUB | A - B |
| `010` | AND | A & B |
| `011` | OR | A \| B |
| `100` | XOR | A ^ B |
| `101` | NOT | ~A |
| `110` | INC | A + 1 |
| `111` | DEC | A - 1 |

---

## 📥 Inputs

| Signal | Width | Description |
|--------|------:|-------------|
| `A` | 4-bit | First input operand |
| `B` | 4-bit | Second input operand |
| `ALU_SEL` | 3-bit | Selects the ALU operation |

---

## 📤 Outputs

| Signal | Width | Description |
|--------|------:|-------------|
| `RESULT` | 4-bit | Operation result |
| `CARRY` | 1-bit | Carry output from arithmetic operation |
| `ZERO` | 1-bit | High when RESULT is zero |
| `OVERFLOW` | 1-bit | Signed arithmetic overflow indicator |

---

## 🧠 Signed Number Range

Because this is a 4-bit signed design using two's complement:

```text
Minimum = -8
Maximum = +7
Example:

 0111 = +7
 0001 = +1
 ----
 1000

Mathematically:

7 + 1 = 8

But +8 cannot be represented using signed 4-bit two's complement.

Therefore:

OVERFLOW = 1
🏗️ Architecture
             ┌───────────────┐
      A ────►│               │
             │               │
      B ────►│   4-BIT ALU   │────► RESULT
             │               │
 ALU_SEL ───►│               │────► CARRY
             │               │────► ZERO
             │               │────► OVERFLOW
             └───────────────┘
📂 Repository Structure
verilog-alu-design/
│
├── .github/
│   └── workflows/
│       └── verilog-test.yml
│
├── src/
│   └── alu_4bit.v
│
├── tb/
│   └── tb_alu_4bit.v
│
└── README.md
🧪 Verification

The testbench automatically checks:

Arithmetic Operations
5 + 3 = 8
7 - 2 = 5
5 + 1 = 6
5 - 1 = 4
Logical Operations
1100 AND 1010 = 1000
1100 OR  1010 = 1110
1100 XOR 1010 = 0110
NOT 1010      = 0101
Zero Flag
0 + 0 = 0

ZERO = 1
Overflow
+7 + +1 → OVERFLOW = 1

-8 - 1  → OVERFLOW = 1

+7 - (-1) → OVERFLOW = 1
📊 Verification Flow
        Verilog RTL
             │
             ▼
       Testbench
             │
             ▼
      Icarus Verilog
             │
             ▼
     Automatic Checks
             │
       ┌─────┴─────┐
       ▼           ▼
     PASS         FAIL
       │
       ▼
 GitHub Actions
⚙️ Simulation

Install Icarus Verilog:

sudo apt-get install iverilog

Compile:

iverilog -o alu_sim \
src/alu_4bit.v \
tb/tb_alu_4bit.v

Run:

vvp alu_sim

Expected output:

======================================
       4-BIT ALU VERIFICATION
======================================

PASS
PASS
PASS
PASS
PASS
PASS
PASS
PASS
PASS | ZERO FLAG
PASS OVERFLOW
PASS OVERFLOW
PASS OVERFLOW

ALL TESTS PASSED
ALU VERIFICATION SUCCESSFUL
======================================
📈 Waveform

The testbench generates:

alu_waveform.vcd

This file can be opened using GTKWave to inspect:

A
B
ALU_SEL
RESULT
CARRY
ZERO
OVERFLOW
🤖 Continuous Integration

GitHub Actions automatically:

Checks out the repository
Installs Icarus Verilog
Compiles the RTL
Compiles the testbench
Runs the simulation
Reports success or failure

Workflow:

Git Push
   ↓
GitHub Actions
   ↓
Compile
   ↓
Simulate
   ↓
Verify
   ↓
PASS / FAIL
🎯 Learning Outcomes

This project demonstrates practical knowledge of:

Verilog HDL
Combinational logic
Arithmetic circuits
Two's complement
Carry detection
Signed overflow
Status flags
RTL design
Testbench development
Automated verification
GitHub Actions / CI
🔮 Future Improvements

Possible future upgrades:

8-bit ALU
16-bit ALU
Comparison operations
Shift operations
Rotate operations
Parameterized data width
FPGA implementation
Seven-segment display
UART interface
Processor datapath integration
👩‍💻 Author

Bhavani

Electronics and Communication Engineering

Areas of Interest
VLSI Design
Digital Electronics
Verilog HDL
FPGA
Embedded Systems
RTL Design

⭐ If you find this project useful, consider starring the repository.


Commit message:

```text
Improve ALU project documentation

Then click Commit changes.

✅ Project status

You now have a proper:

RTL → Testbench → Verification → CI → Documentation

pipeline.

Next we'll add parameterization, allowing the same ALU design to work as 4-bit, 8-bit, 16-bit, etc. instead of being fixed at 4 bits.
