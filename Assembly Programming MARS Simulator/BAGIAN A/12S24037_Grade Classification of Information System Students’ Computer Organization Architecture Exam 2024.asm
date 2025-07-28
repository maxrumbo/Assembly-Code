# Nama Praktikan:Maxwell Rumahorbo
# NIM Praktikan: 12S24037
# Judul Praktikum:  Assembly Programming using MARS Simulator
# Tgl Percobaan: 30 Maret 2025

.data
var_input_string: . asciiz "Enter your score: "
var_aplus: .asciiz "A+"
var_a: .asciiz "A"
var_bplus: .asciiz "B+"
var_b: .asciiz "B"
var_c_plus: .asciiz "C+"
var_c: .asciiz "C"
var_dplus: .asciiz "D+"
var_d: .asciiz "D"

.text
.globl main
main :
	# Prompt user for input
	li $v0, 4
	la $a0, var_input_string
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0	# store user input in $t0
	
	# Classify the score
	bge $t0, 90, Aplus
	bge $t0, 80, A
	bge $t0, 70, Bplus
	bge $t0, 60, B
	bge $t0, 50, Cplus
	bge $t0, 40, C
	bge $t0, 30, Dplus
	j D
	
Aplus:
	li $v0, 4
	la $a0, var_aplus
	syscall
	j end
	
A:
	li $v0, 4
	la $a0, var_a
	syscall
	j end
	
Bplus:
	li $v0, 4
	la $a0, var_bplus
	syscall
	j end

B:
	li $v0, 4
	la $a0, var_b
	syscall
	j end

Cplus :
	li $v0, 4
	la $a0, var_c_plus
	syscall
	j end

C:
	li $v0, 4
	la $a0, var_c
	syscall
	j end

Dplus:
	li $v0, 4
	la $a0, var_dplus
	syscall
	j end

D:
	li $v0, 4
	la $a0, var_d
	syscall

end:
	# Exit program
	li $v0, 10
	syscall

