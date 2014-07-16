# Program to find the maximum number in a list.

# VARIABLES:
# %eax - Holds the current value of a list
# %ebx - Holds the largest value found
# %edi - Holds the current index of a list
# data_items - List of numbers. The number 0 will be used to terminate the data.

.section .data

data_items:
	.long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

.section .text

.globl _start

_start:
	# Moving 0 to edi, because this is the first index of a list
	movl $0, %edi

	# Moving the first byte of data from the list to the register
	# data_items(, 0, 4) = value at index 0, containing 4 bytes because we are using .long
	movl data_items(, %edi, 4), %eax

	# This is our first element. Consequently, the largest value is itself.
	movl %eax, %ebx
	
_start_loop:
	# If we have value 0 in the register, we know that we do not have more data to verify and we exit the loop.
	# je = jumps if the values are equal
	cmpl $0, %eax
	je loop_exit

	# Loading the next index in the register
	# incl increments the value of %edi by one
	incl %edi

	# Moving the value of the index to eax register
	movl data_items(, %edi, 4), %eax

	# Comparing the values into the ebx and eax registers
	# If the value in ebx is bigger than eax, we return the loop 
	# jle = Jumps if the second value was less than or equal the first value
	cmpl %ebx, %eax
	jle _start_loop

	# If eax > ebx, we move the value and return the loop
	# jmp = Jump no matter what. This does not need to be preceeded by a comparison.
	movl %eax, %ebx
	jmp _start_loop

loop_exit:
	# Moving the number 1 (exit system call) to the eax register and interrupting the system.
	movl $1, %eax
	int $0x80
