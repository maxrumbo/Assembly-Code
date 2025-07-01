# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.text

lb $a0, 0x10010003
li $v0, 11
syscall

lb $a0, 0x10010002
syscall

lb $a0, 0x10010001
syscall

lb $a0, 0x10010000
syscall



li $v0, 10
syscall

.data
myString: .ascii "bird"
