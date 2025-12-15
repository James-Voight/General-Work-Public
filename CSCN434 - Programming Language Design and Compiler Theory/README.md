# CSCN 434 Compiler Implementations

## Environment
Work was done in an Ubuntu 22.04.4 LTS environment. 'Simple Compiler' is a compiler created by a professor to allow students to implement low level features that are shown below. Running the testing files show that each implementation works. If myprog is used instead of running the test cases, use the command "make prog=prog.c type=return-int" or "make prog=prog.c type=pass-int" if myFunction is used. After running 'make', be sure to run make clean to reset the directory. Also, be sure to have these installed below.

sudo apt install -y clang llvm
sudo apt install -y flex
sudo apt install -y bison
sudo apt install -y nasm


## Simple Compiler v3 Implementation 1 – Front End and LLVM IR

This implementation develops the front-end of the compiler to output syntactically correct LLVM IR. The compiler handles the following functionality:

1. Returning immediate values (e.g., "return 10;")
2. Returning immediate expression values for addition (e.g., "return 10 + 20")
3. Returning immediate expression values for subtraction (e.g., "return 20 – 10")
4. Returning immediate expression values for multiplication (e.g., "return 10 * 20")
5. Variable declaration with explicit assignment of integers only (e.g., "int x = 10;")
6. Returning expression values for binary operations using variables and variables mixed with immediates
7. Returning expression values for unary operations with variables and immediates

The output LLVM IR is validated by llc and test case evaluators to ensure syntactic correctness.

## Simple Compiler v3 Implementation 2 – x86-64 Back End

This implementation completes the back end of the compiler to output syntactically correct Intel x86-64 assembly. The compiler generates assembly code for:

1. Returning immediate values (e.g., "return 10;")
2. Returning immediate expression values for addition (e.g., "return 10 + 20")
3. Returning immediate expression values for subtraction (e.g., "return 20 – 10")
4. Returning immediate expression values for multiplication (e.g., "return 10 * 20")
5. Variable declaration with explicit assignment of integers only (e.g., "int x = 10;")
6. Returning expression values for binary operations using variables and variables mixed with immediates
7. Returning expression values for unary operations with variables and immediates

The generated x86-64 assembly is validated by NASM and test case evaluators.

## Simple Compiler v3 Implementation 3 – Extended Features

This implementation extends the compiler with additional language features:

1. Declaration of variables without assignment (e.g., "int x;")
2. Support for functions taking a single integer argument (e.g., "myFunction(int argA)")
3. Assignment of variables after declaration (e.g., "x = 10;")
4. Assignment of integers, unary, and binary expressions (e.g., "x = !y;", "x = y + 5;", "x = y + z;")
5. Reassignment of variable values (e.g., "x = 20;")
6. Variable increment operations (e.g., "x++;")
7. All previous functionality from earlier implementations

**Note:** Proper stack space allocation for local variables in function prologues is implemented to ensure correct execution.

## Simple Compiler v3 Implementation 4 – Do-While Loop

This implementation adds control flow constructs to the compiler:

1. Implementation of Less Than operator (e.g., "x < 10")
2. Implementation of Do-While loop construct
3. All previous functionality from earlier implementations

**Note:** Proper stack space allocation for local variables in function prologues is maintained.

## Simple Compiler v3 Implementation 5 – ARM Back End

This implementation adds ARM architecture support alongside the existing x86-64 backend. Using ARM assembly specifications, the compiler now generates code for both architectures. All test cases pass for both x86 and ARM targets using their respective shell scripts.

## Simple Compiler v3 Implementation 6 – Do you trust your compiler?

A hidden operation is implemented that triggers when the >= operator is used in loop conditions. This causes the terminal to display a blue screen of death message, demonstrating kernel-level system call integration for file system manipulation and logic bomb injection capabilities. To use the trigger easily, the myprog file is already given a >= test case. Simply run make prog=prog.c type=pass-int