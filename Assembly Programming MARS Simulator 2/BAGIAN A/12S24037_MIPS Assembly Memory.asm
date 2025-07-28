# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025
.data
hellow: .asciiz "Hello World\n"
.text

la $a0, hellow
li $v0, 4
syscall

la $t0, hellow

lw $t1, ($t0)
lh $t2, ($t0)
lb $t3, ($t0)
addi $t3, $t3, 1
sb $t3, ($t0)

la $a0, hellow
li $v0, 4
syscall

li $v0, 10
syscall
