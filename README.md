# Timer - Software for Real-Time and Embedded Systems

This repository contains the first project of the course [Software for Real-Time and Embedded Systems](https://onderwijsaanbod.kuleuven.be/syllabi/e/H04L2AE.htm) taught at KU Leuven as part of the [Master in Computer Science](https://onderwijsaanbod.kuleuven.be/opleidingen/e/SC_52364422.htm) (option Secure Software), during the 1st semester.

The project consists of the design and implementation of a timer using a 18F97J60 Microchip microcontroller. The alarm clock has the following features:
1. It displays the time in the following format hh:mm:ss. The display has to be updated at least once a second;
2. Hours are counted from 0 to 23; thus, the display "jumps" from 23:59.59 to 00:00.00;
3. The clock time and wake up time must be set when the board is powered up. Ringing is replaced by blinking a led every second during 30 secs;
4. When the clock is running, it is possible to change the wake up time without influencing the clock; it is also possible to change the clock time.

The program uses `timer0` interrupts to deal with the time. A small program intended to measure the clock frequency is included (`clkfreq.c`). The file implementing the timer is `timer.c`. The TCPIP_Stack is provided by Microchip, but not used in this project (except for `LCDBlocking`, which updates the LCD display in a blocking way).
     
`Makefile` compiles the project. Instructions of how to download it on the board can be found in the report. In order to compile the source code, the following software must be installed:
- SDCC (20091215-5595), and
- GPUtils, version 0.13.7.
