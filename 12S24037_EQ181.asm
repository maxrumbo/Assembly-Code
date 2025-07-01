# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data
    prompt: .asciiz "Masukkan nilai: "
    newline: .asciiz "\n"
    result: .asciiz "Nilai yang dimasukkan adalah: "
    buffer: .space 4  # Buffer untuk menyimpan nilai input

.text
    .globl main

main:
    # Menampilkan prompt untuk memasukkan nilai
    li   $v0, 4          # Syscall untuk print string
    la   $a0, prompt     # Alamat string prompt
    syscall

    # Membaca input nilai
    li   $v0, 5          # Syscall untuk membaca integer
    syscall
    move $t0, $v0        # Menyimpan input ke dalam register $t0

    # Alokasi memori dinamis untuk variabel
    li   $v0, 9          # Syscall untuk alokasi memori (untuk 4 byte)
    li   $a0, 4          # Alokasikan 4 byte untuk integer
    syscall
    move $t1, $v0        # Alamat memori yang dialokasikan disimpan di $t1

    # Menyimpan nilai ke memori yang dialokasikan
    sw   $t0, 0($t1)     # Simpan nilai input ke alamat memori yang dialokasikan

    # Menampilkan hasil
    li   $v0, 4          # Syscall untuk print string
    la   $a0, result     # Alamat string hasil
    syscall

    # Menampilkan nilai yang disimpan di memori yang dialokasikan
    lw   $a0, 0($t1)     # Ambil nilai dari memori yang dialokasikan
    li   $v0, 1          # Syscall untuk print integer
    syscall

    # Menampilkan newline
    li   $v0, 4          # Syscall untuk print newline
    la   $a0, newline
    syscall

    # Keluar dari program
    li   $v0, 10         # Syscall untuk exit
    syscall
