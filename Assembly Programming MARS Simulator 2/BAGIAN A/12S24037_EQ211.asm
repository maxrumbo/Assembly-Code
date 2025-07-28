# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data
numbers: .word 3, 7, 5, 2, 9, -4, 8, 1, -6, 10
count:   .word 10
result:  .word 0

.text
.globl main

main:
    # --- FOR Loop ---
    la $t0, numbers         # Load the address of the array
    lw $t1, count           # Load the count of elements
    li $t3, 0               # Initialize sum to 0

    for_loop:
        lw $t4, 0($t0)      # Load the current element
        add $t3, $t3, $t4   # Add the current element to sum
        addi $t0, $t0, 4    # Move to the next element
        addi $t1, $t1, -1   # Decrement the loop counter
        bnez $t1, for_loop  # Continue the loop if counter is not zero

    la $t2, result          # Load address of result
    sw $t3, 0($t2)          # Store the sum in result

    # --- WHILE Loop ---
    la $t0, numbers         # Load the address of the array
    lw $t1, count           # Load the count of elements
    li $t3, 0               # Initialize sum to 0

    while_loop:
        beqz $t1, while_done # Exit if counter is zero
        lw $t4, 0($t0)      # Load the current element
        add $t3, $t3, $t4   # Add the current element to sum
        addi $t0, $t0, 4    # Move to the next element
        addi $t1, $t1, -1   # Decrement the loop counter
        j while_loop        # Continue the loop

    while_done:
    la $t2, result          # Load address of result
    sw $t3, 0($t2)          # Store the sum in result

    # --- DO-WHILE Loop ---
    la $t0, numbers         # Load the address of the array
    lw $t1, count           # Load the count of elements
    li $t3, 0               # Initialize sum to 0

    do_while_loop:
        lw $t4, 0($t0)      # Load the current element
        add $t3, $t3, $t4   # Add the current element to sum
        addi $t0, $t0, 4    # Move to the next element
        addi $t1, $t1, -1   # Decrement the loop counter
        bnez $t1, do_while_loop # Continue the loop if counter is not zero

    la $t2, result          # Load address of result
    sw $t3, 0($t2)          # Store the sum in result

    # Exit program
    li $v0, 10
    syscall
