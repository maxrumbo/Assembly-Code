# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data
string: .asciiz "Hello, World!"  # Example string

.text
.globl main

main:
    # Load the address of the string into $a0
    la $a0, string

    # Call the string_length function
    jal string_length

    # Print the length of the string
    move $a0, $v0  # Move the result (length) to $a0 for printing
    li $v0, 1      # Load the syscall code for printing an integer
    syscall

    # Exit the program
    li $v0, 10
    syscall

string_length:
    # Function to calculate the length of a string
    # Input: Address of the string (in $a0)
    # Output: Length of the string (returned in $v0)

    # Initialize the counter to 0
    li $v0, 0

loop:
    # Load a byte from the memory address pointed by $a0
    lb $t0, 0($a0)

    # Check if the byte is null (end of string)
    beqz $t0, end_loop

    # Increment the counter
    addi $v0, $v0, 1

    # Move to the next character in the string
    addi $a0, $a0, 1

    # Repeat the loop
    j loop

end_loop:
    # Return the length of the string in $v0
    jr $ra
