# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data
prompt: .asciiz "Enter temperature in Celsius: "
result: .asciiz "Temperature in Fahrenheit: "

.text
.globl main

main:
    # Display prompt
    li $v0, 4
    la $a0, prompt
    syscall

    # Read Celsius temperature
    li $v0, 5
    syscall
    move $t0, $v0   # Store the input Celsius temperature in $t0

    # Convert Celsius to Fahrenheit: F = (C * 9/5) + 32
    li $t1, 9
    li $t2, 5
    mul $t0, $t0, $t1   # Multiply Celsius by 9
    div $t0, $t0, $t2   # Divide by 5
    addi $t0, $t0, 32   # Add 32 to the result

    # Display the result
    li $v0, 4
    la $a0, result
    syscall

    # Print the Fahrenheit temperature
    move $a0, $t0
    li $v0, 1
    syscall

    # Exit program
    li $v0, 10
    syscall
