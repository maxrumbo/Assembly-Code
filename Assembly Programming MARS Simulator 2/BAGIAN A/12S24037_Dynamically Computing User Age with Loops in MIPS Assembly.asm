# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025
# Program to compute date of birth

.data
    var_input_birth:	.asciiz	"Enter year of birth: "
    var_input_current:	.asciiz	"Enter current year: "
    var_string1:	.asciiz	"You are "
    var_string2:	.asciiz	" Years old"
.text

.globl main
    main:

    li $v0, 4
    la $a0, var_input_birth
    syscall

    # prompt user for date of birth
    li $v0, 5
    syscall
    move $t0, $v0
    
    # prompt user for current year
    li $v0, 4
    la $a0, var_input_current
    syscall

    li $v0, 5
    syscall

    move $t1, $v0

    # computer age
    sub $t2, $t1, $t0
    
    li $v0, 4
    la $a0, var_string1
    syscall

    # print age
    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, var_string2
    syscall

    # exit
    li $v0, 10
    syscall
