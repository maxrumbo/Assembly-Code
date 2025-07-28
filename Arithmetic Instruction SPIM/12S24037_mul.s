.data
space: .asciiz " "
newline: .asciiz "\n"

.text
main: li $s2, 11

# Outside loop
li $s0, 0

# Compare s0 loop
l_out: beq $s0, $s2, done_outer

# Initialize inner loop
li $s1, 0
l_in: beq $s1, $s2, done_inner
mul $a0, $s0, $s1
li $v0, 1
syscall # print the number
la $a0, space
li $v0, 4
syscall # print the space
addi $s1, $s1, 1
j l_in

done_inner:
# Newline
la $a0, newline
li $v0, 4
syscall
addi $s0, $s0, 1
j l_out

done_outer:
li $v0, 10
syscall