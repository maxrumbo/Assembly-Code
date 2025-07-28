# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data

.text
.globl main

main:
    # Initialize $a0 with the input value
    li $a0, 5  # Example input value

    # Call the optimized square function
    jal optimized_square

    # Exit the program
    li $v0, 10
    syscall

optimized_square:
    # Inline assembly for optimized square function
    # $a0 contains the input value
    # $v0 will contain the result

    # Inline assembly code to square the input value
    li $v0, 0       # Initialize the result register to 0
    mul $v0, $a0, $a0  # Square the input value and store the result in $v0

    jr $ra  # Return from the function
