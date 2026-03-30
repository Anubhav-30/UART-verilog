# 🐍 UART Communication Protocol in Verilog

**Author: Anubhav**  

[![Language](https://img.shields.io/badge/Language-Verilog-blue)](https://www.verilog.com/)  
[![Status](https://img.shields.io/badge/Status-Completed-success)](https://github.com/)  
[![Simulation](https://img.shields.io/badge/Tool-GTKWave-orange)](https://gtkwave.sourceforge.net/)  
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)  

---

## 📌 Overview

This project implements a **UART (Universal Asynchronous Receiver/Transmitter)** using Verilog.  
It allows **serial communication** between two devices, transmitting and receiving 8-bit data frames asynchronously.

The design demonstrates **serial-to-parallel and parallel-to-serial data conversion**, along with waveform-based verification of correct communication.

---

## ⚙️ Features

- Asynchronous serial communication (TX/RX)  
- 8-bit data frame with **start and stop bits**  
- Configurable **baud rate**  
- Waveform-based verification for TX and RX  
- Modular and reusable design  

---

## 🧠 UART Architecture

### 🔹 Block Diagram

![Block Diagram](blockdiagram.jpeg)  
**Explanation:**

- **TX Module:** Converts parallel data to serial data  
- **RX Module:** Converts serial data to parallel data  
- **Baud Rate Generator:** Controls timing for correct bit duration  
- **Registers / Buffers:** Store data before transmission and after reception  

---

### 🔹 UART Frame

![UART Frame](framediagram.jpeg)  
**Explanation:**

- **Start Bit:** Signals beginning of transmission  
- **Data Bits:** 8 bits of actual data (LSB first)  
- **Stop Bit:** Signals end of transmission  
- Optional **Parity Bit** for error checking (if implemented)  

---

## 📊 Waveform Results

### 🔹 GTKWave Output

![GTKWave](wavegtk.png)  
**Description:**

- Shows TX and RX line activity  
- Data bits transmitted and received correctly  
- Start/Stop bits verified  
- Confirms baud rate timing  

---

### 🔹 VS Code VCD Waveform

![VCD Waveform](wavevs.png)  
**Description:**

- Displays signal transitions over time  
- Confirms correct UART frame transmission  
- Matches expected TX/RX behavior  

---

## 🚀 How It Works

1. **Data Input:** Parallel data is given to TX module  
2. **Transmission:** TX converts data to serial format  
3. **Serial Communication:** Bits transmitted over the line at configured baud rate  
4. **Reception:** RX samples incoming bits and reconstructs parallel data  
5. **Output:** Received data is available for verification  

Multiple frames can be transmitted sequentially with correct timing.

---

## ⚠️ Limitations

- No hardware flow control (RTS/CTS)  
- No parity error handling implemented  
- Single baud rate only (can be extended)  

---

## 🏁 Conclusion

This project demonstrates a **fully functional UART module in Verilog**, verified with GTKWave and VCD waveforms.  
It serves as a solid foundation for learning **serial communication** and hardware interface design.

---

## 📂 Project Structure

```text
├── src/
│   ├── uart_tx.v
│   ├── uart_rx.v
│   ├── baud_gen.v
│   └── uart_tb.v
├── images/
│   ├── blockdiagram.jpeg
│   ├── framediagram.jpeg
│   ├── wavegtk.png
│   ├── wavevs.png
│   └── uart_demo.gif (optional)
└── README.md