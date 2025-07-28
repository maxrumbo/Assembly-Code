# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.text
.globl main
main:
    # Print a prompt for the user
    li $v0, 4
    la $a0, prompt
    syscall

    # Read a floating-point number from the user
    li $v0, 6
    syscall
    mov.s $f12, $f0

    # Compute the square root
    sqrt.s $f0, $f12

    # Print the result
    mov.s $f12, $f0
    li $v0, 2
    syscall

    # Exit the program
    li $v0, 10
    syscall

.data
prompt: .asciiz "Masukkan angka: "
