# Nama Praktikan: Zefanya Ecklezia Saragih
# NIM Praktikan: 11S23050
# Judul Praktikum: Assembly Programming using MARS Simulator
# Tgl Percobaan: 11/11/2024

.data
    message: .asciiz "Hello, "
    userInput: .space 20

.text
main:
    # Getting user's input as text
    li $v0, 8
    la $a0, userInput
    li $a1, 20
    syscall

    # Displays hello
    li $v0, 4
    la $a0, message
    syscall

    # Displays the name
    li $v0, 4
    la $a0, userInput
    syscall

    # Tell the system this is the end of main.
    li $v0, 10
    syscall
