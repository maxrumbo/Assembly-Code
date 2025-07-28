# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.text
main:
la $a0, Bob
la $t0, Steve

li $v0, 4
syscall

move $a0, $t0
li $v0, 4
syscall

li $v0, 10
syscall

.data
Bob: .asciiz "My name is Bob. "
Steve: .asciiz "My name is Steve."
