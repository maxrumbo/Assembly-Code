# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data
    prompt: .asciiz "Masukkan nama Anda: "
    greeting: .asciiz "Hello, "
    newline: .asciiz "\n"
    buffer: .space 100  # Menyediakan ruang untuk input nama

.text
    .globl main

main:
    # Menampilkan prompt untuk memasukkan nama
    li   $v0, 4           # Syscall untuk print string
    la   $a0, prompt      # Alamat string prompt
    syscall

    # Membaca input nama
    li   $v0, 8           # Syscall untuk membaca string
    la   $a0, buffer      # Alamat buffer
    li   $a1, 100         # Ukuran buffer
    syscall

    # Menampilkan greeting "Hello, "
    li   $v0, 4           # Syscall untuk print string
    la   $a0, greeting    # Alamat string greeting
    syscall

    # Menampilkan nama yang dimasukkan
    li   $v0, 4           # Syscall untuk print string
    la   $a0, buffer      # Alamat buffer (nama pengguna)
    syscall

    # Menampilkan newline setelah greeting
    li   $v0, 4           # Syscall untuk print newline
    la   $a0, newline
    syscall

    # Keluar dari program
    li   $v0, 10          # Syscall untuk exit
    syscall
