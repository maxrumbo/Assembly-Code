# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data

inputtxt1: .asciiz "Give the first number: "
inputtxt2: .asciiz "Give the second number: "
addtext: .asciiz "Number is odd"
eventext:  .asciiz "Number is even"
negtext: .asciiz "Number is negative"
postext: .asciiz "Number is positive"
zerotext: .asciiz "Number is zero"
comparetext: .asciiz "The larger number is: "

.text

# Print "Give the first number: " message
la $a0, inputtxt1
li $v0, 4
syscall

# Read first integer from user input
li $v0, 5
syscall
move $t0, $v0

# Print "Give the second number: " message
la $a0, inputtxt2
li $v0, 4
syscall

# Read second integer from user input
li $v0, 5
syscall
move $t1, $v0

# Compare the two numbers
bgt $t0, $t1, first_is_larger
blt $t0, $t1, second_is_larger
beq $t0, $t1, both_are_equal

first_is_larger:
move $a0, $t0
j print_larger_number

second_is_larger:
move $a0, $t1
j print_larger_number

both_are_equal:
la $a0, zerotext
j print_larger_number

print_larger_number:
li $v0, 4
syscall

endprog:
li $v0, 10
syscall
