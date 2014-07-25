# Program to find the minimum value in a list

# VARIABLES:
# %edi - Holds the current index of a list
# %eax - Holds the current value of a list
# %ebx - Holds the minimum value found
# data_items - List of number. The value 100 represents the end of the list.

.section .data

data_items:
	.long 3,67,100

.section .text

.globl _start

_start:
	movl $0, %edi
	movl data_items(, %edi, 4), %eax
	movl %eax, %ebx

_start_loop:
	cmpl $100, %eax
	je loop_exit

	incl %edi
	movl data_items(, %edi, 4), %eax

	cmpl %eax, %ebx
	jle _start_loop

	movl %eax, %ebx
	jmp _start_loop

loop_exit:
	movl $1, %eax
	int $0x80
