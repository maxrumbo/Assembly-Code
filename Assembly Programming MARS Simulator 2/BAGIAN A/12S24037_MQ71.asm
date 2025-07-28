# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025
.data
N: .word 10  
sum: .word 0

.text
.globl main
main:
    la $t0, N  
    lw $t1, 0($t0)
    la $t2, sum  
    li $t3, 0  

    loop:
        add $t3, $t3, 1
        bgt $t3, $t1, end  
        lw $t4, 0($t2) 
        add $t4, $t4, $t3  
        sw $t4, 0($t2)  
        j loop  

    end:
        lw $a0, 0($t2)  
        li $v0, 1
        syscall

        li $v0, 10  
        syscall
