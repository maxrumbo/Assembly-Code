# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data
array_size: .word 5        # Size of the array
array_ptr:  .word 0        # Pointer to the allocated memory for the array
newline:    .asciiz "\n"  # Newline character for printing

.text
.globl main

main:
    # Prompt user for the size of the array
    li $v0, 4          # Load syscall code for printing a string
    la $a0, size_prompt  # Load address of the size prompt string
    syscall

    # Read integer input from user for array size
    li $v0, 5          # Load syscall code for reading an integer
    syscall
    move $t0, $v0      # Store array size in $t0

    # Dynamically allocate memory for the array
    li $v0, 9          # Load syscall code for heap memory allocation
    move $a0, $t0      # Pass array size as argument
    syscall
    move $s0, $v0      # Store pointer to allocated memory in $s0

    # Initialize array elements with user input
    la $t1, array_prompt  # Load address of the array input prompt string
    li $t2, 0            # Initialize loop counter to 0

init_loop:
    # Print prompt for array element
    li $v0, 4          # Load syscall code for printing a string
    move $a0, $t1      # Load address of the prompt string
    syscall

    # Read integer input from user for array element
    li $v0, 5          # Load syscall code for reading an integer
    syscall
    sw $v0, ($s0)      # Store the input value at the address pointed by $s0

    # Move to the next element in the array
    addi $s0, $s0, 4  # Increment array pointer by 4 bytes (size of integer)

    # Increment loop counter
    addi $t2, $t2, 1

    # Check if all elements are initialized
    bne $t2, $t0, init_loop

    # Perform operations on the array (e.g., sum)
    li $s1, 0          # Initialize sum variable to 0
    la $s0, array_ptr  # Load the pointer to the beginning of the array

sum_loop:
    lw $t3, ($s0)      # Load array element into $t3
    add $s1, $s1, $t3  # Add array element to sum
    addi $s0, $s0, 4   # Move to the next element in the array

    # Check if reached the end of the array
    bne $s0, $s1, sum_loop

    # Print the sum of the array
    li $v0, 1          # Load syscall code for printing an integer
    move $a0, $s1      # Load the sum into $a0
    syscall

    # Deallocate memory for the array
    li $v0, 10         # Load syscall code for heap memory deallocation
    move $a0, $s0      # Pass the pointer to allocated memory as argument
    syscall

    # Exit the program
    li $v0, 10         # Load syscall code for program exit
    syscall

# Data section
.size_prompt: .asciiz "Enter the size of the array: "
.array_prompt: .asciiz "Enter element value: "
