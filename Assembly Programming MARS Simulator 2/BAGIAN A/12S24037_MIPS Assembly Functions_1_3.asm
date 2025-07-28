# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data
.text

move $t0, $0
li $t1, 10

main:
startloop:
	beq $t0, $t1, exitloop
	move $a0, $t0
	jal myfunction
	addi $t0, $t0, 1
	j startloop
exitloop:

li $v0, 10
syscall

myfunction:
	li $v0,1
	syscall
	jr $ra
