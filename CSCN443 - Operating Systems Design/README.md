# CSCN443 - Operating Systems Implementation

This repository contains a comprehensive implementation of SimpleOS, a custom 32-bit x86 operating system built from scratch. The project progresses through six major assignments, each building upon the previous to create a fully functional operating system with file system support, memory management, process scheduling, and system calls.

## Project Overview

SimpleOS is developed incrementally across six assignments, starting with low-level bootloader implementation and progressing to advanced operating system features. Each assignment builds upon the previous one, requiring a fully functional solution before proceeding to the next phase.

---

## Assignment 1: Multi-Stage Bootloader Implementation

**Objective:** Implement a complete multi-stage bootloader for 32-bit x86 systems with VGA text mode support.

**Technical Details:**
- **Architecture**: 32-bit x86 real mode bootloader
- **Boot Process**: Multi-stage loading from disk to RAM
- **Display System**: VGA text mode implementation

**Core Components:**

**Stage 1 Bootloader (bootloader-stage1.asm):**
- **BIOS Interrupt Integration**: Direct hardware communication for disk I/O
- **Sector Loading Algorithm**:
  - Load first 128 sectors (64KB) from fs.img to memory address 0x8000
  - Load second 128 sectors (64KB) to memory address 0x18000
  - Handle x86 real mode segmentation limitations using ES register
- **BIOS Parameters**: Cylinder 0, Head 0, Sector 2 start location
- **Error Handling**: Robust sector reading with status verification

**VGA Text Mode Implementation (screen.cpp):**
- **clearScreen()**: Zero out entire video RAM (0xB8000) for clean display
- **printCharacter()**: Character rendering with control code handling:
  - Line Feed (0x0A): Proper newline advancement
  - Tab (0x09): Horizontal tabulation with spacing
  - Carriage Return (0x0D): Consume without action
- **printString()**: String output with newline handling for both 0x0A and 0x0D
- **printHexNumber()**: Hexadecimal number display for debugging

**Technical Constraints:**
- **Function Signatures**: Cannot modify provided function interfaces
- **Constants Usage**: Mandatory use of constants.h definitions
- **Build System**: Fixed Makefile with no modifications allowed
- **Output Verification**: Exact match required with reference screenshot

**Key Learning Outcomes:**
- BIOS interrupt programming for hardware control
- x86 real mode memory segmentation and addressing
- VGA text mode memory-mapped I/O operations
- Low-level bootloader development principles

---

## Assignment 2: EXT2 File System Operations

**Objective:** Implement core file system operations for EXT2 file system support, including disk I/O and ELF file loading.

**Technical Details:**
- **File System**: EXT2 implementation with inode-based structure
- **Hardware Interface**: Direct ATA controller programming
- **Executable Format**: ELF binary loading and parsing

**Core Functions (fs.cpp):**

**diskReadSector(int sectorNumber, char *destinationMemory):**
- **ATA Command Sequence**:
  - Primary ATA status verification via diskStatusCheck()
  - Sector count register set to 1
  - LBA addressing: Low/mid/high byte configuration from sectorNumber
  - Drive/head register: 0xE0 for LBA mode
  - ATA read command execution
  - Status verification and data transfer
- **Data Transfer**: ioPortWordToMem() for 256-word sector copy

**diskWriteSector(int sectorNumber, char *sourceMemory):**
- **Symmetric Implementation**: Mirror read process with write commands
- **Data Direction**: Memory-to-disk transfer protocol
- **Error Handling**: Comprehensive status checking

**loadElfFile(char *elfHeaderLocation):**
- **ELF Header Parsing**: Program header table analysis
- **Segment Loading**:
  - Text segment identification and p_vaddr extraction
  - memoryCopy() operations for text segment (p_memsz bytes)
  - Data segment processing with identical methodology
- **Memory Management**: Virtual address space population

**loadFileFromInodeStruct(char *inodeStructMemory, char *fileBuffer):**
- **Inode Processing**: Direct block array parsing
- **Block Loading**: Sequential block copying with zero-block handling
- **Indirect Block Management**:
  - Single indirect block processing (256 additional pointers)
  - EXT2_INDIRECT_BLOCK array interpretation
  - Recursive block loading algorithm
- **File Reconstruction**: Complete file assembly in memory buffer

**File System Architecture:**
- **Inode Structure**: File metadata and block pointer management
- **Block Addressing**: Direct and indirect block pointer schemes
- **Data Integrity**: Block size alignment and boundary checking

**Key Learning Outcomes:**
- File system implementation principles
- ATA controller programming for disk I/O
- ELF executable format parsing and loading
- Block device driver development
- Memory-mapped data structures

---

## Assignment 3: Virtual Memory Management

**Objective:** Implement complete virtual memory subsystem with paging, frame allocation, and page table management.

**Technical Details:**
- **Memory Model**: 32-bit x86 paging architecture
- **Allocation Strategy**: Physical frame management with ownership tracking
- **Page Tables**: Two-level paging implementation

**Frame Allocator Implementation (frame-allocator.cpp):**

**createPageFrameMap():**
- **Memory Map Creation**: 4MB RAM page frame tracking (1 byte per 4KB page)
- **Ownership Assignment**:
  - Frame 0: KERNEL_OWNED
  - KEYBOARD_BUFFER: KERNEL_OWNED
  - USER_PID_INFO: KERNEL_OWNED
  - GDT_LOC: KERNEL_OWNED
  - VIDEO_AND_BIOS_RESERVED_START to END: KERNEL_OWNED
  - KERNEL_BASE to KERNEL_LIMIT: KERNEL_OWNED
  - Remaining frames: PAGEFRAME_AVAILABLE

**allocateFrame():**
- **Synchronization**: PAGEFRAME_MAP_BASE lock acquisition
- **Allocation Logic**: First available frame assignment to requesting PID
- **Resource Management**: Lock release and frame number return

**freeAllFrames():**
- **Bulk Deallocation**: Complete frame release for terminated processes
- **Synchronization**: PAGEFRAME_MAP_BASE exclusive access
- **State Management**: PAGEFRAME_AVAILABLE marking for all PID frames

**Virtual Memory Implementation (vm.cpp):**

**initializePageTables():**
- **Table Positioning**: PID-based page directory and table calculation
  - PID 1: PAGE_DIR_BASE
  - PID 2: PAGE_DIR_BASE + MAX_PG_TABLES_SIZE
- **Page Directory Setup**:
  - First entry: PG_USER_PRESENT_RW
  - Keyboard buffer: PG_USER_PRESENT_RW
  - User PID info: PG_USER_PRESENT_RO
  - GDT location: PG_USER_PRESENT_RO
  - Video RAM: PG_USER_PRESENT_RW
  - Kernel space: PG_KERNEL_PRESENT_RW

**requestSpecificPage():**
- **Address-Specific Allocation**: Targeted virtual address mapping
- **Synchronization**: PROCESS_TABLE_LOC exclusive access
- **Page Table Update**: Frame insertion with specified permissions
- **Success Validation**: Boolean return for allocation status

**findBuffer():**
- **First-Fit Algorithm**: Contiguous virtual memory search
- **Size Requirements**: Page count-based buffer identification
- **Address Range**: TEMP_FILE_START_LOC minimum boundary
- **Allocation Preparation**: Buffer location return without commitment

**requestAvailablePage():**
- **Dynamic Allocation**: First available virtual page assignment
- **Synchronization**: PROCESS_TABLE_LOC lock management
- **Frame Acquisition**: Physical memory allocation
- **Page Table Management**: Virtual-to-physical mapping establishment
- **Address Calculation**: Frame number to physical address conversion

**Memory Architecture:**
- **Two-Level Paging**: Page directory and page table hierarchy
- **Permission System**: Read/write and kernel/user space protection
- **Address Translation**: Virtual-to-physical address mapping
- **Synchronization**: Lock-based concurrent access protection

**Key Learning Outcomes:**
- Virtual memory management principles
- x86 paging architecture implementation
- Frame allocation and deallocation algorithms
- Page table manipulation and protection
- Memory synchronization techniques

---

## Assignment 4: System Call Implementation

**Objective:** Implement core system calls for process management, file operations, and inter-process communication.

**Technical Details:**
- **System Call Interface**: Kernel-user space boundary management
- **Process Lifecycle**: Creation, termination, and state management
- **File Descriptor Management**: Open file tracking and resource cleanup

**System Call Implementations (syscalls.cpp):**

**sysClose():**
- **File Descriptor Cleanup**: Active descriptor invalidation
- **Memory Deallocation**: Userspace buffer release and page cleanup
- **Resource Management**: Open file table entry clearing
- **Validation**: File descriptor existence verification

**sysFree():**
- **Process Termination Handling**: ZOMBIE/KILLED state processing
- **Resource Reclamation**: Complete frame deallocation for PID
- **Data Structure Cleanup**: Task struct and page table zeroing
- **Memory Management**: Page directory and table reset

**sysKill():**
- **Process Termination**: PID validation and state modification
- **File Cleanup**: Associated file descriptor closure
- **Parent Reassignment**: Orphaned process parent ID correction (PID 1)
- **State Management**: PROC_KILLED status assignment

**sysSwitch():**
- **Context Switching**: Process state transitions
- **State Changes**:
  - Current process: PROC_SLEEPING
  - Target process: PROC_RUNNING
- **Memory Updates**: RUNNING_PID_LOC modification
- **Validation**: Process state verification before switching
- **Memory Operations**: readValueFromMemLoc() and storeValueAtMemLoc() usage

**System Call Validation:**
- **Parameter Verification**: Input value legitimacy checking
- **State Consistency**: Process state validation before operations
- **Resource Availability**: Memory and file descriptor limit enforcement
- **Error Handling**: Appropriate error code generation

**Integration Testing:**
- **Shell Interface**: Command-line system call testing
- **Editor Program**: File operation validation
- **Process Management**: Creation, switching, and termination verification

**Key Learning Outcomes:**
- System call design and implementation
- Process lifecycle management
- Context switching mechanisms
- Resource cleanup and deallocation
- Kernel-user space interaction

---

## Assignment 5: Process Scheduling Implementation

**Objective:** Implement a priority-based process scheduler with starvation prevention and fair CPU time allocation.

**Technical Details:**
- **Scheduling Algorithm**: Priority-proportional time allocation
- **Starvation Prevention**: Sleeping process runtime guarantees
- **Kernel Integration**: System call interrupt-based activation

**Scheduler Design (schedule.cpp):**

**scheduler() Function:**
- **Configuration Check**: KERNEL_CONFIGURATION validation for scheduler activation
- **Priority-Based Allocation**: CPU time proportional to process priority
  - Priority 80 process: 4x runtime of priority 20 process
  - Natural accumulation through syscall iterations
- **Fair Scheduling**: Runtime ratio achievement without process blocking
- **Starvation Elimination**: Sleeping process execution guarantees

**Algorithm Implementation:**
- **Runtime Tracking**: Process execution time monitoring
- **Priority Calculation**: CPU allocation based on priority ratios
- **Process Selection**: Fair process switching logic
- **State Management**: Running/sleeping process coordination

**Technical Constraints:**
- **No Interrupt Manipulation**: Hardware interrupt control prohibited
- **No Artificial Delays**: sysWait() or similar blocking calls forbidden
- **Data Structure Usage**: Task struct elements (recentRuntime, nice) utilization
- **Preserved Fields**: Task->runtime and Task->priority read-only access

**Performance Characteristics:**
- **Fairness**: Priority-proportional CPU distribution
- **Responsiveness**: Interactive process priority handling
- **Efficiency**: Minimal scheduling overhead
- **Stability**: Long-term runtime ratio maintenance

**Testing Methodology:**
- **Shell Testing**: Runtime distribution verification
- **Priority Validation**: Different priority level behavior confirmation
- **Starvation Prevention**: Sleeping process activation assurance

**Key Learning Outcomes:**
- Process scheduling algorithm design
- Priority-based resource allocation
- Starvation prevention techniques
- Kernel scheduling integration
- Performance monitoring and validation

---

## Assignment 6: Frogger Game Implementation

**Objective:** Implement a complete Frogger game within the SimpleOS environment, demonstrating advanced user-space programming capabilities.

**Technical Details:**
- **Game Engine**: Custom implementation in SimpleOS user space
- **Graphics Mode**: Character-based game rendering
- **Audio System**: Sound effect integration
- **Difficulty Progression**: Easy, medium, hard level implementation

**Game Components:**

**Player Character:**
- **Representation**: Capital 'X' character
- **Movement**: Directional controls (up, down, left, right)
- **Collision Detection**: Enemy and obstacle interaction

**Enemy System:**
- **Car Types**: Small cars (⇐) and large trucks (⇐===)
- **Movement Patterns**: Left and right directional movement
- **Speed Variation**: Level-based velocity scaling
- **Population Density**: Difficulty-dependent enemy count

**Game Environment:**
- **Multiple Maps**: Level-specific layouts and obstacles
- **Terrain Types**:
  - Road: Car navigation areas
  - Water: Log and lily pad crossing challenges
- **Obstacles**: Blocking elements restricting player movement

**Water Crossing Mechanics:**
- **Lily Pads**: Green 'O' characters for safe crossing
- **Logs**: Brown '====' sequences for floating transport
- **Movement Synchronization**: Log speed matching requirements

**Difficulty Levels:**
- **Easy Mode**: Reduced speed and enemy count
- **Medium Mode**: Moderate challenge parameters
- **Hard Mode**: Maximum speed and density with complex maps

**Audio Integration:**
- **Level Start**: Introduction sound effects
- **Player Death**: Failure audio feedback
- **Level Completion**: Success sound effects
- **Sound Engine**: SimpleOS audio subsystem utilization

**Game Features:**
- **Scoring System**: Points for successful crossings
- **Lives System**: Multiple attempt allowance
- **Progress Tracking**: Level advancement mechanism
- **Input Handling**: Keyboard control processing

**Technical Implementation:**
- **Memory Management**: Efficient resource utilization
- **Timing Control**: Frame rate and movement synchronization
- **Graphics Rendering**: Character-based display system
- **State Management**: Game state and progression tracking

**Key Learning Outcomes:**
- User-space application development in custom OS
- Game development principles and algorithms
- Graphics and audio programming in constrained environments
- Real-time system programming and synchronization
- Human-computer interaction design

---

## Technical Environment

### Development Tools
- **Assembler**: NASM for bootloader development
- **Compiler**: GCC for C/C++ kernel components
- **Build System**: Custom Makefile with QEMU testing
- **Emulator**: QEMU for system testing and validation
- **Debug Tools**: GDB with QEMU integration

### QEMU Testing Command
```bash
qemu-system-i386.exe -drive file=fs.img,format=raw
```

### Hardware Architecture
- **CPU**: 32-bit x86 processor
- **Memory**: 4MB RAM with paging support
- **Storage**: ATA hard disk with EXT2 file system
- **Display**: VGA text mode (80x25 characters)
- **Input**: PS/2 keyboard interface

### System Constraints
- **No External Libraries**: Pure system-level implementation
- **Memory Limitations**: 4MB total system memory
- **Real Mode Boot**: 16-bit to 32-bit transition
- **Hardware Abstraction**: Direct hardware programming

## Learning Progression

The SimpleOS implementation follows a systematic development approach:

1. **Foundation**: Bootloader and basic I/O (Assignment 1)
2. **File System**: Disk operations and executable loading (Assignment 2)
3. **Memory Management**: Virtual memory and paging (Assignment 3)
4. **Process Management**: System calls and context switching (Assignment 4)
5. **Scheduling**: CPU time allocation and fairness (Assignment 5)
6. **Application Development**: User-space game implementation (Assignment 6)

Each assignment builds critical operating system components while demonstrating fundamental computer science principles and low-level programming techniques.

## Educational Value

This comprehensive operating system implementation provides hands-on experience with:
- Computer organization and architecture
- System programming and kernel development
- Memory management and virtual addressing
- File system design and implementation
- Process scheduling algorithms
- Hardware-software interface design
- Real-time system constraints and optimization

The project serves as a complete foundation for understanding modern operating system design and implementation principles.
