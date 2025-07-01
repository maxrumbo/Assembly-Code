# Nama Praktikan:Maxwell Rumahorbo
# NIM Praktikan: 12S24037
# Judul Praktikum:  Assembly Programming using MARS Simulator
# Tgl Percobaan: 30 Maret 2025

.data
    message: .asciiz "Hi, how are you?"

.text
main:
    addi $s0, $zero, -10        # Set $s0 to -10
    bgtz $s0, displayHi         # Branch to displayHi if $s0 > 0

    # End of main
    li $v0, 10                  # Exit program
    syscall

displayHi:
    li $v0, 4                   # Set syscall for print string
    la $a0, message             # Load address of message into $a0
    syscall
