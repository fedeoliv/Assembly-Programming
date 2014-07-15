# Program that exits and returns a status code back to the Linux kernel

# INPUT: None
# OUTPUT: Return the status code. This code can be viewed by typing echo $? after running the code.

# VARIABLES: 
# %eax - contains the system call number
# %ebx - contains the return status


# Each "." refers to the current directory in Linux and UNIX systems.
# .section .data = Starts the data section, where you list any memory storage you will need for data.
.section .data

# .section .text = Where the program instructions are.
.section .text

# .globl _start = _start is a global variable. Symbols are generally used to mark locations of programs or data, 
# 				  so you can refer to them by name instead of by their location number.
.globl _start

# Defining values to _start.
_start:
# Transfering the number 1 into the A register. Each EAX register is a 4 byte(32-bit).
# We need to use "movl", which "l" is refered to long values (32-bit integer).
# $ = immediate mode addressing.
# Without the "$" it would do direct addressing, loading whatever number is at address 1.
# The number 1 is the number of the exit system call.
# %eax is always required to be loaded with the system call number.
# "e"ax to refer to the extended versions of the register.
# For 64-bit register, we need to use %rax
movl $1, %eax

# Transfering the number 0 into the B register.
# In the exit system call, %ebx is required to be loaded with the exit status.
movl $0, %ebx

# int = interrupt and the 0x80 is the number we use to interrupt.
# An interrupt interrupts the normal program flow, and transfers control from our program to Linux 
# so that it will do a system call.
int $0x80
