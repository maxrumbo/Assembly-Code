# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data

main:
li $t0, 0x100
li $t1, 0x200

move $t2, $t0

move $t0, $t1
move $t1, $t2

li $v0 ,10
syscall
