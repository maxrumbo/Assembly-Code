# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025
.data
.text

move $t0, $0
li $s1, 10

main:
startloop:
 beq $t0, $s1, exitloop
 move $a0, $t0
 addi $sp, $sp, -4
 sw $t0, 0($sp)
 jal myfunction
 lw $t0, 0($sp)
 addi $sp, $sp, 4
 addi $t0, $t0, 1
 j startloop
exitloop:

li $v0, 10
syscall

myfunction:
 
 mul $t0, $a0, $a0
 move $a0, $t0
 addi $sp, $sp, -4
 sw $ra, 0($sp)
 jal myfunction2
 lw $ra, 0($sp)
 addi $sp, $sp, 4
 jr $ra
 
myfunction2:
 li $v0, 1
 syscall
 jr $ra
