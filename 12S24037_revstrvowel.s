    .data
buffer:     .space 50         # Menyediakan ruang untuk string input (maks 50 karakter)
vowel_msg:  .asciiz "\nJumlah huruf vokal: "
before_msg: .asciiz "\nString sebelum dibalik: "
after_msg:  .asciiz "\nString setelah dibalik: "
vowels:     .asciiz "AEIOUaeiou"  # Daftar huruf vokal

    .text
    .globl main
main:
    # Membaca string dari pengguna
    li $v0, 8              # syscall untuk membaca string
    la $a0, buffer         # alamat buffer untuk menyimpan input
    li $a1, 50             # maksimal 50 karakter
    syscall

    # Menghitung panjang string dan jumlah huruf vokal
    la $t0, buffer         # $t0 menyimpan alamat awal string
    li $t1, 0              # $t1 sebagai penghitung panjang string
    li $t2, 0              # $t2 sebagai penghitung huruf vokal

count_length:
    lb $t3, 0($t0)         # Ambil karakter dari string
    beq $t3, $zero, end_count_length # Jika karakter nol (akhir string), selesai
    addi $t1, $t1, 1       # Tambah panjang string
    la $t4, vowels         # $t4 berisi alamat daftar huruf vokal

check_vowel:
    lb $t5, 0($t4)         # Ambil karakter dari daftar vokal
    beq $t5, $zero, next_char  # Jika sudah habis, lanjut ke karakter berikutnya
    beq $t3, $t5, is_vowel  # Jika cocok, tambahkan ke penghitung vokal
    addi $t4, $t4, 1       # Geser ke karakter vokal berikutnya
    j check_vowel

is_vowel:
    addi $t2, $t2, 1       # Tambah penghitung vokal

next_char:
    addi $t0, $t0, 1       # Geser ke karakter berikutnya dalam string
    j count_length

end_count_length:
    # Menampilkan string sebelum dibalik
    li $v0, 4
    la $a0, before_msg
    syscall

    li $v0, 4
    la $a0, buffer
    syscall

    # Menampilkan jumlah huruf vokal
    li $v0, 4
    la $a0, vowel_msg
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    # Membalik string
    la $t0, buffer         # Pointer awal string
    add $t3, $t0, $t1      # Pointer akhir string (di akhir karakter nol)
    addi $t3, $t3, -1  # Geser ke karakter terakhir sebelum null

reverse_loop:
    bge $t0, $t3, after_reverse  # Jika bertemu di tengah, selesai

    lb $t4, 0($t0)         # Simpan karakter awal
    lb $t5, 0($t3)         # Simpan karakter akhir

    sb $t5, 0($t0)         # Tukar karakter akhir ke awal
    sb $t4, 0($t3)         # Tukar karakter awal ke akhir

    addi $t0, $t0, 1       # Geser pointer awal ke kanan
    addi $t3, $t3, -1  # Geser pointer akhir ke kiri
    j reverse_loop

after_reverse:
    # Menampilkan string setelah dibalik
    li $v0, 4
    la $a0, after_msg
    syscall

    li $v0, 4
    la $a0, buffer
    syscall

    # Keluar dari program
    li $v0, 10
    syscall
