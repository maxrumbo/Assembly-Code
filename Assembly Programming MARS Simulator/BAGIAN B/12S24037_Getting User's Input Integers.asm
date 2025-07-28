# Nama Praktikan:Maxwell Rumahorbo NIM Praktikan: 12S24037
# Judul Praktikum:  Assembly Programming using MARS Simulator
# Tgl Percobaan: 30 Maret 2025


.data
	prompt: .asciiz "Enter your age: "
	message: .asciiz "\nYour age is "
.text

	# Prompt the user to enter age
	li $v0, 4
	la $a0, prompt
	syscall
	
	# Get users age
	li $v0, 5
	syscall
	
	#store the age in $t0
	move $t0, $v0
	
	# Display message
	li $v0, 4
	la $a0, message
	syscall
	
	#print or show the age
	li $v0, 1
	move $a0, $t0
	syscall 
