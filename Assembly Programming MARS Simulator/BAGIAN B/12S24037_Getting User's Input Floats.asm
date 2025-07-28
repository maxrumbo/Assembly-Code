# Nama Praktikan:Maxwell Rumahorbo# NIM Praktikan: 12S24037
# Judul Praktikum:  Assembly Programming using MARS Simulator
# Tgl Percobaan: 30 Maret 2025

.data
	message:	.asciiz "Enter the value of PI: "
	zeroAsFloat:	.float 0.0
.text
	lwc1 $f4, zeroAsFloat
	
	#Display message
	li $v0, 4
	la $a0, message
	syscall
	
	#Read user's input
	li $v0, 6
	syscall
	
	#Display value
	li $v0, 2
	add.s $f12, $f0, $f4
	syscall
