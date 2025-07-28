# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data
msg1: .asciiz "\n"
msg2: .asciiz " "

.text
li $t1,1
li $t2,4
outter: bgt $t1,$t2,exit1

li $s1,1
li $s2,4
outter: bgt $s1,$s2,exit2

li $v0,1
move $a0, $s1
syscall

li $v0,4
$la $a0, msg2
syscall

addi $s1, $s1, 1
j inner
exit2:
Li $v0,4
La $a0,msg1
syscall

addi $t1, $t1, 1
j outter
exit1:
li $v0, 10
syscall
