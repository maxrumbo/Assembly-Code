.data
buffer:     .space 200   # Buffer lebih besar untuk input panjang
msg_input:  .asciiz "Masukkan string: "
msg_before: .asciiz "\nString sebelum dibalik: "
msg_after:  .asciiz "\nString setelah dibalik: "
msg_vowel:  .asciiz "\nJumlah huruf vokal: "
newline:    .asciiz "\n"

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

    # Menampilkan pesan sebelum pembalikan
    li $v0, 4
    la $a0, msg_before
    syscall

    # Menampilkan string asli
    li $v0, 4
    la $a0, buffer
    syscall

    # Menghitung panjang string & jumlah vokal
    la $t0, buffer     # Pointer awal string
    li $t1, 0          # Counter panjang string
    li $t5, 0          # Counter jumlah vokal

count_length:
    lb $t2, 0($t0)     # Ambil karakter dari string
    beq $t2, 10, end_count_length  # Jika newline (LF), hentikan
    beq $t2, 0, end_count_length   # Jika terminator null, hentikan

    addi $t1, $t1, 1   # Tambah panjang string
    addi $t0, $t0, 1   # Geser pointer ke karakter berikutnya

    # Cek apakah karakter adalah huruf vokal (a, e, i, o, u, A, E, I, O, U)
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
    j count_length  # Lanjut iterasi jika bukan vokal

count_vowel:
    addi $t5, $t5, 1   # Tambah counter vokal
    j count_length

end_count_length:
    addi $t1, $t1, -1  # Hilangkan karakter newline dari hitungan

    # Menampilkan jumlah vokal
    li $v0, 4
    la $a0, msg_vowel
    syscall

    li $v0, 1
    move $a0, $t5
    syscall

    # Menyiapkan pointer awal & akhir untuk membalik string
    la $t0, buffer     # Pointer awal
    add $t3, $t0, $t1  # Pointer akhir (buffer + panjang - 1)

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
    la $a0, buffer
    syscall

    # Exit program
    li $v0, 10
    syscall
