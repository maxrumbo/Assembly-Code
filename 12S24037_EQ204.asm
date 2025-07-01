# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data
    var_input_birth:  .asciiz "Enter year of birth: "
    var_input_current: .asciiz "Enter current year: "
    var_string1: .asciiz "You are "
    var_string2: .asciiz " Years old"
    var_invalid_input: .asciiz "Invalid input. Please enter a valid year between 1900 and 2025.\n"
    
.text
.globl main
main:
    # Prompt user for year of birth
    li $v0, 4
    la $a0, var_input_birth
    syscall

    # Loop for checking year of birth input
input_birth:
    li $v0, 5           # syscall to read integer (year of birth)
    syscall
    move $t0, $v0       # Save year of birth in $t0

    # Check if year of birth is valid (must be between 1900 and 2025)
    blt $t0, 1900, invalid_input   # If year < 1900, invalid
    bge $t0, 2025, invalid_input   # If year > 2025, invalid
    j input_done

invalid_input:
    # Display error message if input is invalid
    li $v0, 4
    la $a0, var_invalid_input
    syscall
    j input_birth       # Ask for year of birth again

input_done:
    # Prompt user for current year
    li $v0, 4
    la $a0, var_input_current
    syscall

    li $v0, 5           # syscall to read integer (current year)
    syscall
    move $t1, $v0       # Save current year in $t1

    # Calculate age (current year - birth year)
    sub $t2, $t1, $t0   # $t2 = $t1 (current year) - $t0 (birth year)

    # Display "You are"
    li $v0, 4
    la $a0, var_string1
    syscall

    # Print age
    li $v0, 1
    move $a0, $t2
    syscall

    # Display "Years old"
    li $v0, 4
    la $a0, var_string2
    syscall

    # Exit
    li $v0, 10
    syscall
