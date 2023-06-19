# ARM-Processor

Our team of 2 developed a 16-bit processor capable of executing ARM Assembly instructions. Below is a schematic overview of the procesor.

<img width="845" alt="Screenshot 2023-06-19 at 2 25 29 AM" src="https://github.com/ambroseling/ARM-Processor/assets/93873940/f6f95edf-1b1f-49f0-b295-644d44453b23">

Below is a diagram of the control signals coded for the processor.
<img width="761" alt="Screenshot 2023-06-19 at 2 33 02 AM" src="https://github.com/ambroseling/ARM-Processor/assets/93873940/736d01bc-c8b0-45c4-b6db-75d68bc3b671">


Our team implemented  the FSM required to set up control signals for different insturctions at different time steps. We used ModelSim frequently to verify our code and conduct testing on our processor.We connected our processor to external devices such as input devices (KEY buttons, TOGGLE switches) and output devices (LED display, VGA display, 7 SEG display). These devices are used to execute the instructions and display its results. The processor is also connected to the on-board SSRAM for accessing and saving data as well as instructions.
 
