# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data
    prompt_a: .asciiz "Masukkan nilai a: "
    prompt_b: .asciiz "Masukkan nilai b: "
    prompt_c: .asciiz "Masukkan nilai c: "
    result:    .asciiz "Akar-akar persamaan kuadrat: "
    newline:   .asciiz "\n"
    discriminant_message: .asciiz "Diskriminan: "
    root1_message: .asciiz "Akar pertama: "
    root2_message: .asciiz "Akar kedua: "
    no_real_roots: .asciiz "Persamaan ini tidak memiliki akar riil.\n"

.text
    .globl main

main:
    # Menampilkan prompt untuk memasukkan nilai a
    li   $v0, 4
    la   $a0, prompt_a
    syscall

    # Membaca nilai a
    li   $v0, 5
    syscall
    move $t0, $v0  # $t0 = a

    # Menampilkan prompt untuk memasukkan nilai b
    li   $v0, 4
    la   $a0, prompt_b
    syscall

    # Membaca nilai b
    li   $v0, 5
    syscall
    move $t1, $v0  # $t1 = b

    # Menampilkan prompt untuk memasukkan nilai c
    li   $v0, 4
    la   $a0, prompt_c
    syscall

    # Membaca nilai c
    li   $v0, 5
    syscall
    move $t2, $v0  # $t2 = c

    # Menghitung diskriminan: D = b^2 - 4ac
    mul $t3, $t1, $t1  # $t3 = b^2
    mul $t4, $t0, $t2  # $t4 = a * c
    mul $t4, $t4, 4    # $t4 = 4ac
    sub $t5, $t3, $t4  # $t5 = b^2 - 4ac (diskriminan)

    # Menampilkan diskriminan
    li   $v0, 4
    la   $a0, discriminant_message
    syscall
    li   $v0, 1
    move $a0, $t5  # Menampilkan nilai diskriminan
    syscall

    # Memeriksa apakah diskriminan negatif
    bltz $t5, no_real_roots_message  # Jika D < 0, tidak ada akar riil

    # Menghitung akar pertama: (-b + sqrt(D)) / 2a
    li   $v0, 4
    la   $a0, root1_message
    syscall
    # Proses untuk akar pertama dan kedua akan membutuhkan penghitungan akar kuadrat
    # (akan menggunakan pendekatan yang lebih sederhana untuk contoh ini)

    # Menampilkan pesan keluar
    li   $v0, 10
    syscall

no_real_roots_message:
    li   $v0, 4
    la   $a0, no_real_roots
    syscall
    li   $v0, 10
    syscall
