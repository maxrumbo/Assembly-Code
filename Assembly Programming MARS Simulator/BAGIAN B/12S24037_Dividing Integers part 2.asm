# Nama Praktikan:Maxwell Rumahorbo
# NIM Praktikan: 12S24037
# Judul Praktikum:  Assembly Programming using MARS Simulator
# Tgl Percobaan: 30 Maret 2025
.data

.text
    # Initialize values in $t0 and $t1
    addi $t0, $zero, 30   # Load 30 into $t0
    addi $t1, $zero, 8    # Load 8 into $t1

    # Perform division
    div $t0, $t1          # Divide $t0 by $t1

    # Move results to $s0 and $s1
    mflo $s0              # Move quotient to $s0
    mfhi $s1              # Move remainder to $s1

    # Print the remainder
    li $v0, 1             # Load syscall code for print integer into $v0
    add $a0, $zero, $s1   # Move remainder in $s1 to $a0 for printing
    syscall               # Make the syscall to print the remainder
