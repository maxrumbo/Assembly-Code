.data
buffer:         .space 200   # Buffer asli untuk input pengguna
buffer_clean:   .space 200   # Buffer untuk string tanpa spasi
msg_input:      .asciiz "Masukkan string: "
msg_clean:      .asciiz "\nString tanpa spasi: "
msg_before:     .asciiz "\nString sebelum dibalik: "
msg_after:      .asciiz "\nString setelah dibalik: "
msg_vowel:      .asciiz "\nJumlah huruf vokal: "
newline:        .asciiz "\n"

.text
.globl main

main:
    # Menampilkan pesan input
    li $v0, 4
    la $a0, msg_input
    syscall

    # Membaca input string
    li $v0, 8
    la $a0, buffer
    li $a1, 200   # Input maksimal 199 karakter + null terminator
    syscall

    # Menghapus spasi dari string
    la $t0, buffer         # Pointer ke input asli
    la $t1, buffer_clean   # Pointer ke buffer baru tanpa spasi
    li $t5, 0              # Counter jumlah vokal

remove_spaces:
    lb $t2, 0($t0)         # Ambil karakter dari string asli
    beq $t2, 10, end_remove_spaces  # Jika newline (LF), hentikan
    beq $t2, 0, end_remove_spaces   # Jika terminator null, hentikan

    beq $t2, 32, skip_space  # Jika karakter adalah spasi (ASCII 32), lompat

    sb $t2, 0($t1)           # Simpan karakter ke buffer_clean
    addi $t1, $t1, 1         # Geser pointer buffer_clean

    # Cek apakah karakter adalah huruf vokal
    li $t3, 'a'  
    li $t4, 'A'
    beq $t2, $t3, count_vowel
    beq $t2, $t4, count_vowel
    li $t3, 'e'  
    li $t4, 'E'
    beq $t2, $t3, count_vowel
    beq $t2, $t4, count_vowel
    li $t3, 'i'  
    li $t4, 'I'
    beq $t2, $t3, count_vowel
    beq $t2, $t4, count_vowel
    li $t3, 'o'  
    li $t4, 'O'
    beq $t2, $t3, count_vowel
    beq $t2, $t4, count_vowel
    li $t3, 'u'  
    li $t4, 'U'
    beq $t2, $t3, count_vowel
    beq $t2, $t4, count_vowel

    j next_char

count_vowel:
    addi $t5, $t5, 1   # Tambah counter vokal

next_char:
    addi $t0, $t0, 1   # Geser pointer buffer asli
    j remove_spaces

skip_space:
    addi $t0, $t0, 1   # Lewati spasi, lanjut ke karakter berikutnya
    j remove_spaces

end_remove_spaces:
    sb $zero, 0($t1)   # Tambahkan null terminator ke akhir buffer_clean

    # Menampilkan string tanpa spasi
    li $v0, 4
    la $a0, msg_clean
    syscall

    li $v0, 4
    la $a0, buffer_clean
    syscall

    # Menampilkan jumlah vokal
    li $v0, 4
    la $a0, msg_vowel
    syscall

    li $v0, 1
    move $a0, $t5
    syscall

    # Menampilkan pesan sebelum pembalikan
    li $v0, 4
    la $a0, msg_before
    syscall

    li $v0, 4
    la $a0, buffer_clean
    syscall

    # Menghitung panjang string tanpa spasi
    la $t0, buffer_clean
    li $t1, 0  # Panjang string baru

count_length:
    lb $t2, 0($t0)
    beq $t2, 0, end_count_length

    addi $t1, $t1, 1
    addi $t0, $t0, 1
    j count_length

end_count_length:
    add $t3, $t0, -1  # Pointer ke akhir string

reverse_loop:
    bge $t0, $t3, after_reverse  # Jika sudah bertemu di tengah, selesai

    # Menukar karakter awal dan akhir
    lb $t2, 0($t0)   # Simpan karakter awal
    lb $t4, 0($t3)   # Simpan karakter akhir
    sb $t4, 0($t0)   # Simpan karakter akhir ke posisi awal
    sb $t2, 0($t3)   # Simpan karakter awal ke posisi akhir

    # Geser pointer
    addi $t0, $t0, 1  # Pointer awal ke kanan
    addi $t3, $t3, -1 # Pointer akhir ke kiri
    j reverse_loop

after_reverse:
    # Menampilkan pesan setelah dibalik
    li $v0, 4
    la $a0, msg_after
    syscall

    # Menampilkan string yang sudah dibalik
    li $v0, 4
    la $a0, buffer_clean
    syscall

    # Exit program
    li $v0, 10
    syscall
