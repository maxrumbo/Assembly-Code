# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data
# Definisikan atribut struct
student1_name: .asciiz "Alice"
student2_name: .asciiz "Bob"
student3_name: .asciiz "Charlie"

# Array untuk menyimpan umur dan GPA
ages: .word 20, 22, 19
gpas: .float 3.8, 3.5, 3.9

# Output template
msg_name: .asciiz "Name: "
msg_age: .asciiz "Age: "
msg_gpa: .asciiz "GPA: "
newline: .asciiz "\n"

.text
.globl main

main:
    # Menampilkan informasi mahasiswa ke-1
    la $a0, msg_name       # Load pesan "Name: "
    li $v0, 4              # Print string syscall
    syscall

    la $a0, student1_name  # Load nama student1
    li $v0, 4              # Print string syscall
    syscall

    la $a0, newline        # Print newline
    li $v0, 4
    syscall

    la $a0, msg_age        # Load pesan "Age: "
    li $v0, 4
    syscall

    la $t0, ages           # Load base address array umur
    lw $t1, 0($t0)         # Load umur student1
    move $a0, $t1
    li $v0, 1              # Print integer syscall
    syscall

    la $a0, newline        # Print newline
    li $v0, 4
    syscall

    la $a0, msg_gpa        # Load pesan "GPA: "
    li $v0, 4
    syscall

    la $t0, gpas           # Load base address array GPA
    l.s $f12, 0($t0)       # Load GPA student1
    li $v0, 2              # Print float syscall
    syscall

    la $a0, newline        # Print newline
    li $v0, 4
    syscall

    # Menampilkan informasi mahasiswa ke-2
    la $a0, msg_name       # Print "Name: "
    li $v0, 4
    syscall

    la $a0, student2_name  # Load nama student2
    li $v0, 4
    syscall

    la $a0, newline        # Print newline
    li $v0, 4
    syscall

    la $a0, msg_age        # Print "Age: "
    li $v0, 4
    syscall

    lw $t1, 4($t0)         # Load umur student2
    move $a0, $t1
    li $v0, 1
    syscall

    la $a0, newline        # Print newline
    li $v0, 4
    syscall

    la $a0, msg_gpa        # Print "GPA: "
    li $v0, 4
    syscall

    l.s $f12, 4($t0)       # Load GPA student2
    li $v0, 2
    syscall

    la $a0, newline        # Print newline
    li $v0, 4
    syscall

    # Program selesai
    li $v0, 10             # Exit syscall
    syscall
