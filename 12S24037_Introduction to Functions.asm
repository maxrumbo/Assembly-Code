# Nama Praktikan: Zefanya Ecklezia Saragih
# NIM Praktikan: 11S23050
# Judul Praktikum: Assembly Programming using MARS Simulator
# Tgl Percobaan: 11/11/2024

.data
message: .asciiz "Hi, everybody. \nMy name is Amell.\n"

.text
main:
    # Call the displayMessage procedure
    jal displayMessage

    # Load the number 5 into $s0
    addi $s0, $zero, 5

    # Print number 5 to the screen
    li $v0, 1           # Load print integer syscall code into $v0
    add $a0, $zero, $s0 # Move the number in $s0 to $a0 for printing
    syscall             # Make the syscall to print the number

    # Indicate program completion
    li $v0, 10          # Load exit syscall code into $v0
    syscall             # Make the syscall to exit the program

displayMessage:
    # Print the message
    li $v0, 4           # Load print string syscall code into $v0
    la $a0, message     # Load the address of the message into $a0
    syscall             # Make the syscall to print the message

    jr $ra              # Return to main
