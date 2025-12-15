# CSCN342 - Assembly Language Programming

This repository contains a comprehensive collection of assembly language programming projects covering multiple processor architectures including 6502, x86-64, and ARM. The projects progress from basic assembly concepts to advanced low-level programming techniques including self-modifying code, custom calling conventions, and hardware I/O operations.

## Project Overview

The assembly programming projects demonstrate proficiency across multiple architectures and programming paradigms, from 8-bit microcontroller programming to modern 64-bit system development. Each project builds upon fundamental assembly concepts while introducing architecture-specific techniques and low-level system interactions.

---

## Project 1: 6502 Assembly - Self-Modifying Code

**Objective:** Implement a power-of-two division algorithm in 6502 assembly language with a self-modifying code component that generates and executes the division program.

**Technical Details:**
- **Architecture**: MOS 6502 (8-bit microprocessor)
- **Memory Location**: Program assembled at $C000
- **Constraints**: Maximum 20 bytes, no STA (store) instructions allowed
- **Registers**: Input in A and Y registers, output in X register

**Project Components:**

### Part I: Power-of-Two Division Algorithm
- **Algorithm Design**: Bit manipulation for power-of-two division
- **Register Usage**:
  - A register: Dividend (larger operand)
  - Y register: Divisor (smaller operand, must be power of 2)
  - X register: Result output
- **Implementation Constraints**:
  - Maximum 20 bytes total program size
  - No store instructions (STA, STX, STY) permitted
  - Pure register-based computation
- **Power-of-Two Range**: Same range as previous assignments

### Part II: Self-Modifying Code Generator
- **Self-Modification Technique**: Program overwrites itself to generate Part I code
- **Execution Flow**:
  1. Part II generates Part I program at $C000
  2. Self-destruction during code generation
  3. Jump to generated Part I program
  4. Execute power-of-two division
- **Code Generation**: Dynamic assembly instruction creation
- **Memory Management**: Precise code placement and execution transition

**Technical Challenges:**
- **Size Optimization**: Fitting complex logic in 20-byte constraint
- **Self-Modification**: Code that writes and then executes itself
- **Register Constraints**: Limited register availability (A, X, Y only)
- **Instruction Restrictions**: No store operations allowed

**Key Learning Outcomes:**
- 6502 instruction set mastery
- Self-modifying code techniques
- Memory-constrained programming
- Bit manipulation algorithms
- Dynamic code generation

---

## Project 2: Multi-Architecture Assembly Programming

**Objective:** Implement looping constructs and data structures across x86-64 and ARM architectures, demonstrating cross-platform assembly programming skills.

**Technical Details:**
- **Architectures**: x86-64 (Intel syntax) and ARM
- **Output Format**: Hexadecimal countdown with specific formatting
- **Loop Structure**: Nested inner/outer loop architecture

**Project Components:**

### Part I: x86-64 Looping Program
- **File**: `loops.asm`
- **Output Specification**:
  - 13 lines of hexadecimal countdown from 0x18 to 0
  - First line blank, subsequent lines decrement by increasing values
  - Line 1: decrement by 1, Line 2: decrement by 2, ..., Line 12: decrement by 12
- **Loop Architecture**:
  - Outer loop: Controls line count (13 iterations)
  - Inner loop: Controls character output per line
  - Register allocation: rbx for line tracking, rcx for character count
- **Assembly Instructions**: mov, push, pop, xor, call, syscall, jge, dec, cmp
- **Intel Syntax**: Strict adherence to Intel assembly conventions

### Part II: ARM Looping Program
- **File**: `loops.s`
- **Functionality**: Identical output to Part I using ARM instructions
- **External Integration**: printf function for output formatting
- **Loop Structure**: Inner and outer loop implementation
- **Register Usage**: r7 for line tracking, r8 for character count
- **Documentation**: Screenshots of code and execution required

### Part III: x86 Struct Implementation
- **Requirements**: 5+ element struct with mixed data types
- **Mandatory Elements**: At least one float, one array/multidimensional array
- **Function Implementation**: Struct modification and screen output
- **Output Format**: Each struct element on separate line (5+ lines total)
- **Design Approval**: Email professor for struct design approval required
- **Documentation**: APA format paper with screenshots and scholarly reference
- **Constraints**: No assembler macros permitted

**Struct Design Considerations:**
- **Data Types**: Integer, float, character, array elements
- **Memory Layout**: Proper alignment and padding
- **Access Methods**: Indirect addressing for array elements
- **Output Formatting**: Appropriate format specifiers for each data type

**Key Learning Outcomes:**
- Cross-architecture assembly programming
- Nested loop implementation
- Data structure design in assembly
- External function integration (printf)
- Memory alignment and addressing modes

---

## Project 3: x86-64 Custom Calling Conventions

**Objective:** Implement a complete arithmetic calculator using custom x86-64 calling conventions, demonstrating advanced function call mechanics and stack frame management.

**Technical Details:**
- **Architecture**: x86-64 assembly with custom calling convention
- **Operations**: Add, Subtract, Multiply, Divide, Logical Negation
- **Arguments**: Fixed operands (8 and 2)
- **Output**: Console display of all operation results

**Custom Calling Convention Specification:**

### Function Calling Protocol
- **Return Values**: All results stored in RAX register
- **First Argument**: Passed in RCX register
- **Second Argument**: Passed in RDX register
- **Function Calls**: CALL and RET instructions only
- **Stack Frames**: Each function creates 16-byte stack frame
- **Argument Storage**: RCX → [RBP-8], RDX → [RBP-16]

### Function Implementations

**Main Function:**
- **Initialization**: arg1 = 8, arg2 = 2
- **Execution Chain**: add → subtract → multiply → divide → logical negation
- **Termination**: syscall 60 for process exit
- **Result Chaining**: Each operation uses previous result as first operand

**Arithmetic Functions (Add, Subtract, Multiply, Divide):**
- **Stack Frame**: 16-byte reservation with RBP setup
- **Argument Handling**: Store RCX/RDX to local stack variables
- **Computation**: Perform respective arithmetic operation
- **Output**: printf display of result to console
- **Return Protocol**: Store result in RAX, cleanup stack, RET

**Logical Negation Function:**
- **Unary Operation**: Single operand in RCX
- **Logic Implementation**: Logical NOT (not bitwise)
- **Stack Management**: Same 16-byte frame protocol
- **Output**: printf display of logical negation result

**Stack Frame Management:**
- **Prologue**: PUSH RBP, MOV RBP, RSP, SUB RSP, 16
- **Local Variables**: [RBP-8] and [RBP-16] for arguments
- **Epilogue**: MOV RSP, RBP, POP RBP, RET

**Key Learning Outcomes:**
- Custom calling convention design and implementation
- Stack frame management and local variables
- Function prologue/epilogue implementation
- Arithmetic and logical operations in assembly
- printf integration with assembly code

---

## Project 4: BIOS Interrupt Programming

**Objective:** Implement a complete input/output system using BIOS interrupts for keyboard input capture and serial port communication.

**Technical Details:**
- **Architecture**: x86 real mode with BIOS interrupts
- **Input Method**: Keyboard buffer polling via BIOS int 16h
- **Output Method**: Serial port transmission via I/O instructions
- **Termination**: Carriage return (CR) detection for input end

**System Components:**

### Input Processing (BIOS Interrupt 16h)
- **Prompt Display**: Message output using BIOS int 10h
- **Keyboard Polling**: Character-by-character input capture
- **Buffer Management**: Keyboard buffer content storage
- **Termination Detection**: ASCII CR (0x0D) as input delimiter

### Serial Output (COM1 Port)
- **Port Configuration**: COM1 serial port initialization
- **Data Transmission**: Byte-by-byte buffer content sending
- **I/O Instructions**: OUT instruction for hardware communication
- **Synchronization**: Proper timing for serial data transmission

**BIOS Interrupt Integration:**
- **INT 10h**: Video services for prompt display
- **INT 16h**: Keyboard services for input capture
- **Serial I/O**: Direct hardware port communication

**Program Flow:**
1. **Initialization**: Display input prompt
2. **Input Loop**: Character capture until CR detected
3. **Transition**: Jump to serial output routine
4. **Transmission**: Send buffer contents to COM1
5. **Completion**: Program termination

**Technical Features:**
- **Multiple Addressing Modes**: Register, immediate, memory addressing
- **Conditional Evaluation**: Input validation and loop control
- **Loop Constructs**: Input processing and output transmission loops
- **Hardware I/O**: Serial port communication protocols

**Development Environment:**
- **Emulator**: QEMU with serial output redirection
- **Testing**: Dual output verification (display and serial)
- **Documentation**: Screenshots of both QEMU display and serial output

**Key Learning Outcomes:**
- BIOS interrupt programming and services
- Hardware I/O operations and port communication
- Real-mode x86 programming techniques
- Serial communication protocols
- Interrupt-driven I/O handling

---

## Technical Environment

### Development Tools
- **6502 Development**: Py65 emulator and 6502 resources
- **x86-64 Assembly**: NASM assembler, Linux environment
- **ARM Assembly**: GCC ARM toolchain, printf integration
- **BIOS Programming**: QEMU emulator with serial support

### Assembly Syntax
- **6502**: MOS Technology assembly syntax
- **x86-64**: Intel syntax with AT&T alternatives
- **ARM**: ARM assembly with GNU assembler directives

### Key Concepts Covered
1. **Processor Architecture**: Register usage, instruction sets, addressing modes
2. **Memory Management**: Stack frames, local variables, memory addressing
3. **I/O Operations**: BIOS interrupts, hardware ports, serial communication
4. **Function Calls**: Custom calling conventions, stack management
5. **Self-Modifying Code**: Dynamic code generation and execution
6. **Cross-Platform Development**: Architecture-specific programming techniques

## Educational Value

The assembly programming projects provide comprehensive experience with:

- **Low-Level Programming**: Direct hardware interaction and memory management
- **Architecture-Specific Development**: 6502, x86-64, and ARM assembly programming
- **System-Level Concepts**: BIOS interrupts, calling conventions, I/O operations
- **Algorithm Implementation**: Arithmetic, logical, and control flow operations
- **Code Optimization**: Size constraints and efficient instruction usage
- **Debugging Techniques**: Hardware-level program analysis and validation

## Project Progression

The assembly projects follow a systematic advancement:

1. **Foundation**: 6502 assembly with self-modifying code (Project 1)
2. **Multi-Architecture**: x86-64 and ARM programming with data structures (Project 2)
3. **Advanced Functions**: Custom calling conventions and arithmetic operations (Project 3)
4. **Hardware Integration**: BIOS interrupts and serial communication (Project 4)

Each project builds critical assembly programming skills while demonstrating fundamental computer organization and low-level system programming principles.
