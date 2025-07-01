# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data
mask: .word 0x20   # Mask to set bit 5 (binary: 00100000)

.text
.globl main

main:
    # Load mask into a register
    lw $t1, mask

    # Load the value of register $t0 (assume it has some initial value)
    # For demonstration, let's assume $t0 contains 0x00 initially
    li $t0, 0

    # Set the specific bit using bitwise OR operation
    or $t0, $t0, $t1

    # Print the value of $t0
    li $v0, 1       # Load system call code for print integer
    move $a0, $t0   # Move the value of $t0 to argument register $a0
    syscall         # Execute system call

    # Exit program
    li $v0, 10
    syscall
