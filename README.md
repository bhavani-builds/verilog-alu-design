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
