# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.text

la $a0, myWord
li $a1, 14

li $v0, 8
syscall

li $v0, 4
syscall

li $v0, 10
syscall

.data
myWord: .apace 20
