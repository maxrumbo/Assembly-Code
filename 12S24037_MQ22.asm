# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025


.data
prompt: .asciiz "Enter an integer: "
result: .asciiz "Extracted bits: "

.text
.globl main

main:
    # Display prompt
    li $v0, 4
    la $a0, prompt
    syscall

    # Read an integer
    li $v0, 5
    syscall
    move $t0, $v0   # Store the input integer in $t0

    # Mask to extract bits 4 to 7
    li $t1, 0xF0    # Binary: 11110000

    # Extract bits 4 to 7
    and $t2, $t0, $t1    # Apply AND operation to isolate desired bits
    srl $t2, $t2, 4      # Shift right to align the extracted bits to the rightmost positions

    # Display the result
    li $v0, 4
    la $a0, result
    syscall

    # Print the extracted bits
    li $v0, 1
    move $a0, $t2
    syscall

    # Exit program
    li $v0, 10
    syscall
