# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data
inputtxt: .asciiz "Enter a number: "   # Message to prompt user input
oddtext: .asciiz "Number is odd."     # Message for odd number
eventext: .asciiz "Number is even."   # Message for even number

.text
.globl main
main:
    # Prompt user to enter a number
    la $a0, inputtxt
    li $v0, 4
    syscall  # Output the prompt
    
    # Read the number from the console
    li $v0, 5
    syscall  # Read integer input
    move $t0, $v0  # Store the input number in $t0
    
    # Check if the number is even or odd
    li $t1, 2  # Divisor for even/odd check
    andi $a0, $t0, 1  # Perform bitwise AND with 1

    # If $a0 is 0, the number is even
    beq $zero, $a0, evennumber  # If remainder is 0, it's even

oddnumber:
    la $a0, oddtext  # Load "odd" message
    li $v0, 4  # Prepare for syscall to output string
    syscall  # Output "odd" message
    j endprog  # Jump to end of program

evennumber:
    la $a0, eventext  # Load "even" message
    li $v0, 4  # Prepare for syscall to output string
    syscall  # Output "even" message

endprog:
    li $v0, 10  # Exit program
    syscall
