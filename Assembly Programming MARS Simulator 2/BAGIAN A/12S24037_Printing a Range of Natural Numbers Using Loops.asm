# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data
    var_newline:    .asciiz "\n"
.text
.globl main
main:
    # STEP 1: Identify initial values
    li $8, 0      # initial natural number is 0
    li $9, 10     # exit after printing 10

    # STEP 3: Implement loop body 
    naturalNumber:
        bgt $8, $9, exitLabel  # branch to exitLabel if $8 > 10
        li $v0, 1
        move $a0, $8   # print the value in $8
        syscall

        li $v0, 4
        la $a0, var_newline
        syscall

        # STEP 4: Modify initial values 
        addi $8, $8, 1  # transition to the next natural number
        # STEP 5: Repeat loop body
        b naturalNumber

    # Exit program
    exitLabel:
    li $v0, 10 
    syscall
