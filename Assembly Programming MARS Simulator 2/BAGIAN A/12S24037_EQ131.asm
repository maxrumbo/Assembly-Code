# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data
    newline: .asciiz "\n"    # String untuk baris baru
.text
    main:
        li $t0, 1           # Inisialisasi loop luar: $t0 = 1 (baris pertama)
    outer_loop:
        li $t1, 1           # Inisialisasi loop dalam: $t1 = 1 (kolom pertama)

    inner_loop:
        mul $a0, $t0, $t1   # Mengalikan $t0 dengan $t1, hasil disimpan di $a0
        li $v0, 1           # Panggilan sistem untuk mencetak integer
        syscall             # Cetak hasil perkalian

        # Cetak spasi antar angka
        li $v0, 4           
        la $a0, newline     # Gunakan baris baru sebagai separator
        syscall

        addi $t1, $t1, 1    # Inkrementasi kolom ($t1 = $t1 + 1)
        li $t2, 10          # Batas maksimum kolom (10)
        ble $t1, $t2, inner_loop  # Jika $t1 <= 10, ulangi inner loop

        # Cetak newline setelah satu baris selesai
        li $v0, 4           
        la $a0, newline
        syscall

        addi $t0, $t0, 1    # Inkrementasi baris ($t0 = $t0 + 1)
        li $t3, 10          # Batas maksimum baris (10)
        ble $t0, $t3, outer_loop  # Jika $t0 <= 10, ulangi outer loop

    # Akhiri program
    li $v0, 10              # Panggilan sistem untuk keluar
    syscall
