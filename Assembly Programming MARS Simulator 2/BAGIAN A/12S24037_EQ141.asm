# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data
    prompt:  .asciiz "Menukar Nilai Dua Register\n"
    newline: .asciiz "\n"

.text
    .globl main

main:
    # Menampilkan prompt
    li   $v0, 4              # Syscall untuk print string
    la   $a0, prompt         # Alamat string prompt
    syscall

    # Inisialisasi nilai register
    li   $t0, 5              # Menyimpan nilai 5 ke $t0
    li   $t1, 10             # Menyimpan nilai 10 ke $t1

    # Menukar nilai antara $t0 dan $t1 tanpa menggunakan register tambahan
    sub  $t0, $t0, $t1       # $t0 = $t0 - $t1, sekarang $t0 berisi -5
    sub  $t1, $t1, $t0       # $t1 = $t1 - (-5), sekarang $t1 berisi 15
    add  $t0, $t0, $t1       # $t0 = -5 + 15, sekarang $t0 berisi 10

    # Menampilkan hasil pertukaran
    li   $v0, 1              # Syscall untuk print integer
    move $a0, $t0            # Menyimpan nilai $t0 (10) ke $a0
    syscall

    li   $v0, 4              # Syscall untuk print string
    la   $a0, newline        # Alamat string newline
    syscall

    li   $v0, 1              # Syscall untuk print integer
    move $a0, $t1            # Menyimpan nilai $t1 (5) ke $a0
    syscall

    # Keluar dari program
    li   $v0, 10             # Syscall untuk exit
    syscall