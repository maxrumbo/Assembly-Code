# Nama Praktikan:Maxwell Rumahorbo
# NIM Praktikan: 12S24037
# Judul Praktikum:  Assembly Programming using MARS Simulator
# Tgl Percobaan: 30 Maret 2025

.data
    message: .asciiz "The number is less than the other."

.text
main:
    addi $t0, $zero, 400      # Set $t0 to 400
    addi $t1, $zero, 200      # Set $t1 to 200

    slt $s0, $t0, $t1         # Set $s0 to 1 if $t0 < $t1, else 0
    bne $s0, $zero, printMessage # Branch to printMessage if $s0 is not equal to 0

    # End program
    li $v0, 10
    syscall

printMessage:
    li $v0, 4                 # Set syscall for print string
    la $a0, message           # Load address of message into $a0
    syscall
