# Nama Praktikan:Maxwell Rumahorbo
# NIM Praktikan: 12S24037
# Judul Praktikum:  Assembly Programming using MARS Simulator
# Tgl Percobaan: 30 Maret 2025

.data

.text
main:
    # Initialize values in $a1 and $a2
    addi $a1, $zero, 50   # Load 50 into $a1
    addi $a2, $zero, 100  # Load 100 into $a2

    # Call the addNumbers function
    jal addNumbers

    # Print the result
    li $v0, 1             # Load syscall code for print integer into $v0
    addi $a0, $v1, 0      # Move the result in $v1 to $a0 for printing
    syscall               # Make the syscall to print the result

    # Exit the program
    li $v0, 10            # Load syscall code for exit into $v0
    syscall               # Make the syscall to terminate the program

addNumbers:
    # Add $a1 and $a2, store the result in $v1
    add $v1, $a1, $a2     # $v1 = $a1 + $a2

    # Return from the function
    jr $ra                # Jump back to the caller
