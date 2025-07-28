# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data
St4: .asciiz "Result: "

.text
main:
    li $t0, 3
    li $t1, 5

    mul $t2, $t0, $t0   # Fixed: mul $t2, $t0 $t0 should be mul $t2, $t0, $t0
    mul $t2, $t2, 2

    mul $t3, $t1, 3 
    add $t3, $t3, 2

    add $t4, $t3, $t2

    # Print the result
    move $a0, $t4       # Fixed: move $a0, St4 should be move $a0, $t4
    li $v0, 1
    syscall

    # Exit program
    li $v0, 10
    syscall
