# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data
var_input_number: .asciiz "Enter an integer: "
var_is_prime:     .asciiz "Number is prime\n"
var_is_not_prime: .asciiz "Number is not prime\n"

.text
.globl main

main:
    # Prompt user for input
    li $v0, 4                # syscall for print string
    la $a0, var_input_number # address of the prompt string
    syscall

    # Read integer input
    li $v0, 5                # syscall for read integer
    syscall
    move $t0, $v0            # move input to $t0 for processing

    # Handle edge cases: numbers <= 1
    blez $t0, not_prime      # if $t0 <= 0, jump to not_prime
    li $t1, 2
    beq $t0, $t1, is_prime   # if $t0 == 2, jump to is_prime

    # Prime check loop
    li $t1, 2                # $t1 = 2 (start divisor)
check_loop:
    div $t0, $t1             # divide $t0 by $t1
    mfhi $t2                 # get remainder in $t2
    beqz $t2, not_prime      # if remainder == 0, not prime

    addi $t1, $t1, 1         # increment divisor
    mul $t2, $t1, $t1        # $t2 = $t1 * $t1
    bgt $t2, $t0, is_prime   # if $t2 > $t0, number is prime
    j check_loop             # repeat the loop

# Print "Number is prime"
is_prime:
    li $v0, 4                # syscall for print string
    la $a0, var_is_prime     # address of "Number is prime"
    syscall
    j exit_program           # exit program

# Print "Number is not prime"
not_prime:
    li $v0, 4                # syscall for print string
    la $a0, var_is_not_prime # address of "Number is not prime"
    syscall

# Exit program
exit_program:
    li $v0, 10               # syscall for exit
    syscall
