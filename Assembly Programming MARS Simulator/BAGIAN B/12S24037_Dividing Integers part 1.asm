# Nama Praktikan:Maxwell Rumahorbo
# NIM Praktikan: 12S24037
# Judul Praktikum:  Assembly Programming using MARS Simulator
# Tgl Percobaan: 30 Maret 2025

.data

.text
    # Initialize values
    addi $t0, $zero, 30  # Set $t0 to 30
    addi $t1, $zero, 5   # Set $t1 to 5

    # Perform division
    div $s0, $t0, $t1    # Divide $t0 by $t1 and store result in $s0

    # Print the result
    li $v0, 1            # Load print integer syscall code into $v0
    add $a0, $zero, $s0  # Move the result in $s0 to $a0 for printing
    syscall              # Make the syscall to print the result
