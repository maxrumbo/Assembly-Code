# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data
prompt: .asciiz "Enter a number: "
result_msg: .asciiz "The square of the number is: "

.text
.globl main

# Function to calculate the square of a number
square:
    # Function prologue
    addi $sp, $sp, -4       # Allocate space on stack for local variable
    sw $ra, 0($sp)          # Save return address on stack

    move $t0, $a0           # Copy input argument to temporary register
    mul $v0, $t0, $t0       # Calculate square and store result in $v0

    # Function epilogue
    lw $ra, 0($sp)          # Restore return address from stack
    addi $sp, $sp, 4        # Deallocate space on stack
    jr $ra                  # Return to caller

main:
    # Ask user for input
    li $v0, 4               # System call for print string
    la $a0, prompt          # Load address of prompt into $a0
    syscall

    # Read user input
    li $v0, 5               # System call for read integer
    syscall
    move $a0, $v0           # Move input to $a0 as argument for square function

    # Save return address
    move $s0, $ra

    # Call the square function
    jal square

    # Restore return address
    move $ra, $s0

    # Display the result
    li $v0, 4               # System call for print string
    la $a0, result_msg      # Load address of result_msg into $a0
    syscall

    # Print the result
    move $a0, $v0           # Move result to $a0
    li $v0, 1               # System call for print integer
    syscall

    # Exit program
    li $v0, 10              # System call for exit
    syscall
