# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data
result_prompt: .asciiz "Hasil faktorial: "
enter_prompt: .asciiz "Masukkan bilangan bulat: "

.text
.globl main

main:
    # Prompt user to enter the integer for which factorial will be calculated
    li $v0, 4
    la $a0, enter_prompt
    syscall

    # Read the integer from user input
    li $v0, 5
    syscall
    move $a0, $v0   # Move user input to $a0 for factorial calculation

    # Call the factorial function
    jal factorial

    # Display the result
    li $v0, 4
    la $a0, result_prompt
    syscall

    # Print the result
    move $a0, $v0
    li $v0, 1
    syscall

    # Exit program
    li $v0, 10
    syscall

# Recursive function to calculate factorial
factorial:
    # Base case: if input is 0 or 1, return 1
    beq $a0, $zero, factorial_exit
    beq $a0, 1, factorial_exit

    # Save return address
    addi $sp, $sp, -4
    sw $ra, ($sp)

    # Decrement input by 1 and call factorial recursively
    addi $a0, $a0, -1
    jal factorial

    # Retrieve return address
    lw $ra, ($sp)
    addi $sp, $sp, 4

    # Multiply return value of recursive call with current input
    mul $v0, $v0, $a0

    # Return from function
    jr $ra

factorial_exit:
    # Base case: return 1
    li $v0, 1
    jr $ra
