# Nama Praktikan: 	Zefanya Ecklezia Saragih
# NIM Praktikan:  11S23050
# Judul Praktikum:  MIPS Mars Simulator
# Tgl Percobaan: 10/11/2024

.data
string1: .asciiz "Enter a number:"
string2: .asciiz "Enter the second number: "
string3: .asciiz "Sum:"
endLine: .asciiz "\n"

.text
main:

	li $v0, 4				# print string1
	la $a0, string1
	syscall

	li $v0, 5				# read integer
	syscall

	move $t0, $v0			# Store the entered integer value in a temporary register.

	li $v0, 4
	la $a0, endLine			# Print a newline for spacing.
	syscall

	li $v0, 4
	la $a0, string2
	syscall

	li $v0, 5
	syscall

	move $t1, $v0

	li $v0, 4
	la $a0, string3
	syscall

	add $t2, $t1, $t0		# Add the two entered integer values and store the result in $t2.
	li $v0, 1				# print integer
	move $a0, $t2			# Transfer the temporary value to a0.
	syscall

	li $v0, 10				# exit
	syscall
