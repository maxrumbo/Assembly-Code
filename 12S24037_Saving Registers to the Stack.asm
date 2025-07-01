# Nama Praktikan:Maxwell Rumahorbo
# NIM Praktikan: 12S24037
# Judul Praktikum:  Assembly Programming using MARS Simulator
# Tgl Percobaan: 30 Maret 2025

.data
newline: .asciiz "\n"

.text
main:
    addi $s0, $zero, 10          # Inisialisasi $s0 dengan nilai 10
    jal increaseMyRegister        # Panggil fungsi increaseMyRegister

    # Cetak baris baru
    li $v0, 4
    la $a0, newline
    syscall

    # Cetak nilai
    li $v0, 1
    move $a0, $s0
    syscall

    # Akhiri program
    li $v0, 10
    syscall

increaseMyRegister:
    addi $sp, $sp, -4             # Kurangi $sp untuk menyimpan nilai $s0
    sw $s0, 0($sp)                # Simpan $s0 di stack

    addi $s0, $s0, 30             # Tambah 30 ke $s0

    # Cetak nilai baru di fungsi
    li $v0, 1
    move $a0, $s0
    syscall

    lw $s0, 0($sp)                # Pulihkan nilai asli $s0
    addi $sp, $sp, 4              # Kembalikan $sp
    jr $ra                         # Kembali ke main
