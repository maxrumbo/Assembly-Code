# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025
.data
var_input_start:  .asciiz "Enter the start of the range: "
var_input_end:    .asciiz "Enter the end of the range: "
var_prime:        .asciiz "Prime: "
var_newline:      .asciiz "\n"

.text
.globl main

main:
    # Prompt user for the start of the range
    li $v0, 4                   # syscall for print string
    la $a0, var_input_start     # address of the prompt string
    syscall

    # Read the start of the range
    li $v0, 5                   # syscall for read integer
    syscall
    move $t0, $v0               # move start of the range to $t0

    # Prompt user for the end of the range
    li $v0, 4                   # syscall for print string
    la $a0, var_input_end       # address of the prompt string
    syscall

    # Read the end of the range
    li $v0, 5                   # syscall for read integer
    syscall
    move $t1, $v0               # move end of the range to $t1

    # Validate the range (start should be less than or equal to end)
    ble $t0, $t1, range_valid   # if start <= end, jump to range_valid
    j exit_program              # otherwise, exit program

range_valid:
    move $t2, $t0               # $t2 = current number (start of the range)

range_loop:
    move $t3, $t2               # $t3 = current number to check for prime
    jal check_prime             # call check_prime subroutine
    bgt $t2, $t1, exit_program  # if current number > end of range, exit
    addi $t2, $t2, 1            # increment current number
    j range_loop                # repeat the loop

check_prime:
    # Edge cases: numbers <= 1
    blez $t3, not_prime         # if $t3 <= 0, jump to not_prime
    li $t4, 2
    beq $t3, $t4, is_prime      # if $t3 == 2, it's prime

    # Prime check loop
    li $t4, 2                   # $t4 = 2 (start divisor)
prime_loop:
    div $t3, $t4                # divide $t3 by $t4
    mfhi $t5                    # get remainder in $t5
    beqz $t5, not_prime         # if remainder == 0, not prime

    addi $t4, $t4, 1            # increment divisor
    mul $t5, $t4, $t4           # $t5 = $t4 * $t4
    bgt $t5, $t3, is_prime      # if $t5 > $t3, number is prime
    j prime_loop                # repeat the loop

is_prime:
    # Print "Prime: [number]"
    li $v0, 4                   # syscall for print string
    la $a0, var_prime           # address of "Prime: "
    syscall

    move $a0, $t3               # move number to $a0
    li $v0, 1                   # syscall for print integer
    syscall

    li $v0, 4                   # syscall for print string
    la $a0, var_newline         # print newline
    syscall
    jr $ra                      # return from subroutine

not_prime:
    jr $ra                      # return from subroutine

exit_program:
    li $v0, 10                  # syscall for exit
    syscall
