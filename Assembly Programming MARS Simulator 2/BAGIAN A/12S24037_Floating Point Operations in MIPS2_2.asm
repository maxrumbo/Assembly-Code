# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025


.text

li $t0, 9
mtc1 $t0, $f0

cvt.s.w $f0, $f0
mov.s $f12, $f0
li $v0,2
syscall

mul.s $f12, $f0, $f0

li $v0,2
syscall
li $v0, 10
syscall
