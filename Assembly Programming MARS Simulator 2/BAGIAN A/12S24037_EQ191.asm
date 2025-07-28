# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data
    array:      .word 3, 7, 2, 8, 5   # Example array of integers
    array_size: .word 5                # Size of the array

    result_msg: .asciiz "Sum of the integers: "

.text
.globl main

main:
    lw $t0, array_size         # Load the size of the array
    la $t1, array              # Load the base address of the array
    li $t2, 0                  # Initialize sum to zero

    loop:
        lw $t3, 0($t1)         # Load the current element of the array
        add $t2, $t2, $t3      # Add the element to the sum
        addi $t1, $t1, 4       # Move to the next element in the array
        addi $t0, $t0, -1      # Decrement the loop counter
        bnez $t0, loop         # Repeat the loop if counter is not zero

    # Print the result
    li $v0, 4
    la $a0, result_msg
    syscall

    move $a0, $t2             # Load the sum into $a0
    li $v0, 1
    syscall

    # Exit program
    li $v0, 10
    syscall
