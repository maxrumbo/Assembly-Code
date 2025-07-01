# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data
    input_string:   .space 100    # Allocate space for input string
    prompt:         .asciiz "Enter a line of text: "
    reversed_msg:   .asciiz "Reversed line: "

.text
.globl main

main:
    # Prompt user to enter a line of text
    li $v0, 4
    la $a0, prompt
    syscall

    # Read the input string
    li $v0, 8
    la $a0, input_string
    li $a1, 100   # Maximum length of the input string
    syscall

    # Find the length of the input string
    move $t0, $a0   # Save the address of the input string
find_length_loop:
    lb $t1, 0($t0)   # Load a character from the input string
    beqz $t1, reverse_string   # If null-terminator is reached, go to reverse_string
    addi $t0, $t0, 1   # Move to the next character
    j find_length_loop   # Repeat the loop to find the length

reverse_string:
    # Reverse the string
    sub $t0, $t0, 1   # Move back to the last character of the string
    la $t2, reversed_msg   # Load the address of the reversed message
    li $v0, 4
    move $a0, $t2   # Print "Reversed line: "
    syscall

reverse_loop:
    lb $t1, 0($t0)   # Load a character from the input string
    beqz $t0, exit_program   # If null-terminator is reached, exit the program
    li $v0, 11
    move $a0, $t1   # Print the reversed character
    syscall

    sub $t0, $t0, 1   # Move to the previous character
    j reverse_loop   # Repeat the loop to reverse the string

exit_program:
    # Exit program
    li $v0, 10
    syscall
