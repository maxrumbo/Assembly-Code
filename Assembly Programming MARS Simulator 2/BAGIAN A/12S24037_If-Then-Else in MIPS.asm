# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data

inputtxt: .asciiz "Give a number: "
addtext: .asciiz "Number is odd"
eventext:  .asciiz "Number is even"

.text

la $a0, inputtxt
li $v0, 4
syscall
li $v0, 5
syscall
move $t0, $v0
li $t1, 2

div $t0, $t1
mfhi $a0

beq $zero, $a0, evennumber

addnumber:

la $a0, addtext
li $v0, 4
syscall
j endprog

evennumber:
la $a0, eventext
li $v0,4
syscall

endprog:
li $v0, 10
syscall
