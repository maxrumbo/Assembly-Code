    .data
reverse_prompt:   .asciiz "Masukkan string: "
before_reverse:   .asciiz "\nString sebelum dibalik: "
after_reverse:    .asciiz "\nString setelah dibalik: "
buffer:           .space 100   # Buffer untuk menyimpan string input

    .text
    .globl main

main:
    # Menampilkan prompt input
    li $v0, 4
    la $a0, reverse_prompt
    syscall

    # Membaca input string dari pengguna
    li $v0, 8
    la $a0, buffer
    li $a1, 100
    syscall

    # Menampilkan string sebelum dibalik
    li $v0, 4
    la $a0, before_reverse
    syscall

    li $v0, 4
    la $a0, buffer
    syscall

    # Menghitung panjang string
    la $t0, buffer  # Pointer ke awal string
    li $t1, 0       # Counter panjang string

count_length:
    lb $t2, 0($t0)  # Ambil byte dari string
    beq $t2, $zero, end_count_length  # Jika null, selesai
    addi $t1, $t1, 1   # Increment panjang string
    addi $t0, $t0, 1   # Pindah ke byte berikutnya
    j count_length

end_count_length:
    addi $t1, $t1, -1  # Menghapus karakter newline dari input

    # Membalikkan string
    la $t0, buffer     # Pointer awal
    add $t3, $t0, $t1  # Pointer akhir

reverse_loop:
    bge $t0, $t3, reverse_done  # Jika bertemu di tengah, selesai

    lb $t4, 0($t0)  # Simpan karakter awal
    lb $t5, 0($t3)  # Simpan karakter akhir

    sb $t5, 0($t0)  # Tukar karakter awal dengan akhir
    sb $t4, 0($t3)  # Tukar karakter akhir dengan awal

    addi $t0, $t0, 1  # Geser pointer awal ke kanan
    addi $t3, $t3, -1  # Geser pointer akhir ke kiri
    j reverse_loop

reverse_done:
    # Menampilkan string setelah dibalik
    li $v0, 4
    la $a0, after_reverse
    syscall

    li $v0, 4
    la $a0, buffer
    syscall

    # Keluar dari program
    li $v0, 10
    syscall
