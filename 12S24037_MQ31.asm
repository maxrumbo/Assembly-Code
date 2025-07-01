# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025


.data
prompt: .asciiz "Enter a floating-point number: "
result: .asciiz "Square root: "

.text
.globl main

main:
    # Display prompt
    li $v0, 4
    la $a0, prompt
    syscall

    # Read a floating-point number
    li $v0, 6
    syscall
    mtc1 $v0, $f12   # Move the input floating-point number to $f12

    # Calculate the square root
    sqrt.s $f0, $f12

    # Display the result
    li $v0, 4
    la $a0, result
    syscall

    # Print the square root
    li $v0, 2
    syscall

    # Exit program
    li $v0, 10
    syscall
