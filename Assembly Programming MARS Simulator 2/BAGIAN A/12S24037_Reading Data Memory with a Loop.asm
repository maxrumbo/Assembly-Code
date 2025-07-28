# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.text
li $t0, 0x10010000

RunLoop:
beq $t0, 0x10010011, EndLoop
lb $a0, ($t0)
li $v0, 11
syscall

addi $t0, $t0, 0x01
j RunLoop

EndLoop:
li $v0, 10
syscall

.data
cake: .ascii "the cake is a lie"
