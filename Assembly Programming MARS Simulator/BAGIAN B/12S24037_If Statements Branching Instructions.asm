# Nama Praktikan:Maxwell Rumahorbo
# NIM Praktikan: 12S24037
# Judul Praktikum:  Assembly Programming using MARS Simulator
# Tgl Percobaan: 30 Maret 2025


.data
    message: .asciiz "The numbers are different."
    message2: .asciiz "Nothing happened."

.text
main:
    addi $t0, $zero, 5       # Set $t0 to 5
    addi $t1, $zero, 20      # Set $t1 to 20

    b numbersDifferent       # Branch to numbersDifferent

    # Syscall to end program
    li $v0, 10
    syscall

numbersDifferent:
    li $v0, 4                # Set syscall for print string
    la $a0, message          # Load address of message into $a0
    syscall
