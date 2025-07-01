# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data
    array: .word 1, 2, 3, 4, 5
    size:  .word 5
    result: .asciiz "Jumlah adalah: "
    newline: .asciiz "\n"

.text
    .globl main

main:
    la   $t0, array       # Load alamat awal array
    lw   $t1, size        # Load ukuran array
    li   $t2, 0           # Inisialisasi indeks
    li   $t3, 0           # Inisialisasi jumlah

loop:
    bge  $t2, $t1, end    # Jika i >= ukuran array, selesai
    add  $t4, $t0, $t2    # Hitung alamat elemen array[i]
    lw   $t5, 0($t4)      # Load elemen array[i]
    add  $t3, $t3, $t5    # Tambahkan elemen ke jumlah
    addi $t2, $t2, 4      # Pindah ke indeks berikutnya
    j    loop

end:
    # Tampilkan hasil
    li   $v0, 4
    la   $a0, result
    syscall
    li   $v0, 1
    move $a0, $t3
    syscall
    li   $v0, 4
    la   $a0, newline
    syscall

    # Keluar dari program
    li   $v0, 10
    syscall
