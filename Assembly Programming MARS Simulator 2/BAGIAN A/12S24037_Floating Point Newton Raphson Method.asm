# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data
answer: .asciiz "Its square root is: "
precision: .float 0.000001

.text
li $a0, 30
mtc1 $a0, $f0
cvt.s.w $f0, $f0
lwc1 $f1, precision

mov.s $f2, $f0
dowhile:
mul.s $f5, $f2, $f2
sub.s $f5, $f5, $f0
add.s $f6, $f2, $f2
div.s $f5, $f5, $f6
sub.s $f2, $f2, $f5
c.lt.s $f5, $f1
bc1f dowhile

la $a0, answer
li $v0, 4
syscall
mov.s $f12, $f2
li $v0, 2
syscall
li $v0, 10
syscall
