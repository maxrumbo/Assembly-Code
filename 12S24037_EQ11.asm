# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025
.data

inputtxt: .asciiz "Give a number: "
addtext: .asciiz "Number is odd"
eventext:  .asciiz "Number is even"
negtext: .asciiz "Number is negative"
postext: .asciiz "Number is positive"
zerotext: .asciiz "Number is zero"

.text

# Print "Give a number: " message
la $a0, inputtxt
li $v0, 4
syscall

# Read integer from user input
li $v0, 5
syscall
move $t0, $v0

# Check if number is even or odd
li $t1, 2
div $t0, $t1
mfhi $a0

# Check if number is positive, negative, or zero
bgt $t0, $zero, positive_number
blt $t0, $zero, negative_number

# If the number is not positive nor negative, it must be zero
la $a0, zerotext
li $v0, 4
syscall
j endprog

positive_number:
la $a0, postext
li $v0, 4
syscall
j endprog

negative_number:
la $a0, negtext
li $v0, 4
syscall
j endprog

endprog:
li $v0, 10
syscall
