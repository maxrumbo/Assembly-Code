# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data
newline: .asciiz "\n"  # String untuk baris baru

.text
main:
    li $t0, 5          # $t0 = jumlah baris
    li $t1, 5          # $t1 = jumlah kolom (bintang per baris)

outer_loop:            # Label loop luar
    beq $t0, 0, end    # Jika $t0 == 0, keluar dari loop (selesai)
    
    # Reset counter kolom setiap iterasi loop luar
    li $t2, 5          # $t2 digunakan sebagai counter kolom

inner_loop:            # Label loop dalam
    beq $t2, 0, next_line  # Jika $t2 == 0, pindah ke baris berikutnya
    li $v0, 11         # System call untuk mencetak karakter
    li $a0, '*'        # Karakter bintang yang akan dicetak
    syscall
    
    # Decrement counter kolom
    sub $t2, $t2, 1    # $t2 = $t2 - 1
    j inner_loop       # Lompat kembali ke awal inner_loop

next_line:
    # Cetak newline setelah selesai mencetak satu baris
    li $v0, 4          # System call untuk mencetak string
    la $a0, newline    # Alamat string newline
    syscall
    
    # Decrement counter baris
    sub $t0, $t0, 1    # $t0 = $t0 - 1
    j outer_loop       # Lompat kembali ke awal outer_loop

end:
    # Program selesai, keluar
    li $v0, 10         # System call untuk keluar
    syscall
