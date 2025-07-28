# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025


.data
hellow: .asciiz "Hello word\n"

.text

move $t0, $0
li $t1, 10

startloop:
	beq $t0, $t1, exitloop
	la $a0, hellow
	li $v0, 4
	syscall
	addi $t0, $t0, 1
	j startloop
exitloop:
