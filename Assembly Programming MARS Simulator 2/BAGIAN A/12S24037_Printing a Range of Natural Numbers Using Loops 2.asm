# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

# Write an assembly language program that prompts a user to enter a natural number and prints whether number is prime or not. 
# STEP 1: Identify initial values
#STEP 2: Identify conditions
#STEP 3: Implement loop body 
# STEP 4: Modify initial values
# STEP 5: Repeat loop body
.data
var_input_number: .asciiz "Enter integer to check if prime: "
var_is_prime: .asciiz "Input is a prime number"
var_is_not_prime:.asciiz "Input is NOT a prime number"
.text
.globl main
main:
# prompt user to enter value
li $v0, 4
la $a0, var_input_number
syscall

li $v0, 5
syscall

move $8, $v0

li $9, 2 # Initial value to be used for processing

# exclude number less than or equal to 1
blt $8, 1, isNotPrime
beq $8, 1, isNotPrime
beq $8, 2, isPrime

LoopPrime:
beq $9, $8, isPrime # branch when done processing numbers in range
div $8, $9 # successively divide input by numbers in range
mfhi $10 # move division remainder to register 10
beq $10, $0, isNotPrime
addi $9, $9, 1

b LoopPrime

#Label for processing prime numbers
isPrime:
li $v0, 4
la $a0, var_is_prime
syscall

b exitLabel

# Label for processing non-prime numbers
isNotPrime:
li $v0, 4
la $a0, var_is_not_prime
syscall

b exitLabel

# Gracefully exit program
exitLabel:
li $v0, 10
syscall
