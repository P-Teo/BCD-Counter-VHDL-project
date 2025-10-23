# COUNTER BCD -VHDL

## 📘 Project Overview

**COUNTER BCD -** is a 4-bit sequential system implemented on an FPGA using **VHDL**.  
It supports two operating modes:
- **Direct binary counter**
- **Parallel register**

The current value is displayed on a **7-segment display** available on the **BASYS3** development board.  
This project was developed for the **Digital Electronics** course at the Faculty of Automatic Control and Computer Engineering, Iași.

---

## ⚙️ Technical Specifications

- **System type:** 4-bit sequential circuit  
- **Reset:** Priority reset, active high (`1`)  
- **Selection input:** `select_in`  
  - `1` → Direct binary counter mode  
  - `0` → Parallel register mode  
- **Period:** 1 second  
- **Display:** 7-segment display (Basys 3 board)

---

## 🔩 Signal Description

| Signal         | Description                                                                 |
|----------------|------------------------------------------------------------------------------|
| `counter_clk`  | Clock signal from the 100 MHz generator of the BASYS3 board                 |
| `out_div`      | Output signal from the frequency divider (1 Hz)                             |
| `reset_in`     | Resets the counter value to 0                                               |
| `select_in`    | Selects the operating mode (counter / parallel register)                    |
| `Val_in`       | Input value for parallel register mode                                      |
| `an`, `seg`    | Activate and control the 7-segment display                                  |
| `a`            | Internal signal storing the value to be displayed                           |
| `n`            | Variable used in the frequency divider                                      |
<img src="https://github.com/user-attachments/assets/a3a661fe-a872-4de9-8629-fefa179d5552" width="600" />

---

## 🧠 Architecture and Operation

1. **Frequency Divider** – converts the 100 MHz clock signal into a 1 Hz signal.  
2. **Operating Modes:**
   - `select_in = 1` → enables the binary counter mode.
   - `select_in = 0` → displays the value read from `Val_in` (parallel register mode).
3. **Reset:** When `reset_in` is active, the displayed value is reset to `0` regardless of the mode.
4. **Display:** The resulting value is converted into **BCD format** and shown on the 7-segment display.
<p align="center">
  <img src="https://github.com/user-attachments/assets/359938b6-13f5-4d76-8ca4-7d14a02d1c04" width="280" />
  <img src="https://github.com/user-attachments/assets/5e92190a-77d6-4c0c-b017-309e1de41bf4" width="280" />
  <img src="https://github.com/user-attachments/assets/71f95315-f256-49fa-b0e2-b08d95bd7e1d" width="280" />
  <img src="https://github.com/user-attachments/assets/3e5aca43-50db-46c5-8602-f6d19e608f72" width="280" />
  <img src="https://github.com/user-attachments/assets/be622a80-402a-4f96-9647-cc23206fecd5" width="280" />
  <img src="https://github.com/user-attachments/assets/ed4ec6c9-77f8-43ed-a71a-1ef927323341" width="280" />
  <img src="https://github.com/user-attachments/assets/3566d2a6-2ea0-4eec-9cd1-a7bd6f9e79fb" width="280" />
</p>


---

## 🧱 Hardware Implementation

<table>
<tr>
<td width="60%" valign="top">

- **Development Board:** BASYS 3 (Xilinx Artix-7 FPGA)  
- **Language:** VHDL  
- **Toolchain:** Xilinx Vivado  
- **Clock frequency:** 100 MHz (pin W5)  
- **Pin Mapping:**  
  - `reset_in` → SW0  
  - `select_in` → SW1  
  - `Val_in[3:0]` → SW2–SW5  
  - `out_div` → LED8  
  - `an`, `seg` → 7-segment display pins  

</td>
<td width="40%" align="center">
  <img src="https://github.com/user-attachments/assets/1aa4958e-344d-44c1-9da7-f32217a6b6d3" width="500"/>
</td>
</tr>
</table>

---

## 🧪 Synthesis and Testing Steps

1. **Write the VHDL source files**  
2. **Create the constraint file (.xdc)** to map signals to FPGA pins  
3. **Run Behavioral Simulation** in Vivado to verify correct logic behavior  
4. **Synthesize and implement** the design  
5. **Generate the bitstream (.bit)**  
6. **Upload the bitstream** to the BASYS3 board and test in real conditions  

**Test Results:**
- Correct BCD counting behavior  
- Proper reset functionality  
- Correct display output on the 7-segment module  

---

## 🧾 Conclusions

The **COUNTER BCD ** project provided hands-on experience in digital system design — from theoretical concepts to practical FPGA implementation.  
It allowed for deeper understanding of:
- VHDL synthesis and simulation  
- FPGA resource mapping and constraints  
- Hardware debugging and testing  

Overall, it was an excellent opportunity to apply theoretical knowledge to a working digital system.

---

## 📚 References

1. [VHDL Reference Manual](http://www.ics.uci.edu/~jmoorkan/vhdlref/Synario%20VHDL%20Manual.pdf)  
2. [BASYS 3 Reference Manual](https://reference.digilentinc.com/reference/programmable-logic/basys-3/reference-manual)

---

## 🧾 *License*

This project was created for **educational purposes**.  
