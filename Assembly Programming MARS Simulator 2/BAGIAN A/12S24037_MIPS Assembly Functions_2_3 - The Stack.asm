# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.text
  li $t0, 3
  li $s0, 4
  move $a0, $t0
  move $a1, $s0
  addi $sp, $sp, -4
  sw $t0, ($sp)
  jal multi
  lw $t0, ($sp)
  addi $sp, $sp, 4
  
  move $a0, $v0
  li $v0, 1
  syscall
  
  move $a0, $t0
  syscall
  move $a0, $s0
  syscall
  
  li $v0, 10
  syscall
  
multi:
 
 addi $sp, $sp, -4
 sw $a0, ($a0)
 move $t0, $a0
 move $s0, $a1
 mul $v0, $t0, $s0
 lw $s0, ($sp)
 addi $sp, $sp, 4
multi_exit:
 jr $ra
