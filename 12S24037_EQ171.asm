# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data
    prompt: .asciiz "Masukkan kalimat: "
    newline: .asciiz "\n"
    buffer: .space 100  # Menyediakan ruang untuk input kalimat

.text
    .globl main

main:
    # Menampilkan prompt untuk memasukkan kalimat
    li   $v0, 4           # Syscall untuk print string
    la   $a0, prompt      # Alamat string prompt
    syscall

    # Membaca input kalimat
    li   $v0, 8           # Syscall untuk membaca string
    la   $a0, buffer      # Alamat buffer
    li   $a1, 100         # Ukuran buffer
    syscall

    # Tokenisasi dan cetak setiap kata
    la   $a0, buffer      # Alamat awal string
tokenize_loop:
    lb   $t0, 0($a0)      # Ambil karakter dari buffer
    beq  $t0, $zero, done_tokenize  # Jika null terminator, selesai

    # Jika spasi ditemukan, anggap kata sudah selesai
    beq  $t0, 32, print_word  # ASCII untuk spasi adalah 32

    addi $a0, $a0, 1       # Pindah ke karakter berikutnya
    j tokenize_loop        # Ulangi untuk karakter berikutnya

print_word:
    # Print karakter sampai spasi atau null terminator
    li   $v0, 4            # Syscall untuk print string
    la   $a0, buffer       # Alamat awal buffer
    syscall

    # Print newline setelah setiap kata
    li   $v0, 4            # Syscall untuk print newline
    la   $a0, newline
    syscall

    # Reset buffer untuk kata berikutnya
    la   $a0, buffer
    j tokenize_loop

done_tokenize:
    # Keluar dari program
    li   $v0, 10           # Syscall untuk exit
    syscall
