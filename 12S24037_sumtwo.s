# 12S24020_Joice Anastasya Napitupulu
# Penjumlaham 2 angka

.data
    num1:   .word 0      # angka pertama		(diinisialisai dengan 0)
    num2:   .word 0       # angka kedua			(diinisialisai dengan 0)
    hasil:  .word 0       # hasil penambahan

.text
    main:
        # Meminta input untuk angka pertama
        li $v0, 5          # Syscall code for read integer
        syscall
        move $t0, $v0      # Menyimpan input pertama di $t0

        # Meminta input untuk angka kedua
        li $v0, 5          # Syscall code for read integer
        syscall
        move $t1, $v0      # Menyimpan input kedua di $t1

        # Simpan angka-angka yang diinput ke variabel
        sw $t0, num1       # Simpan angka pertama ke variabel num1
        sw $t1, num2       # Simpan angka kedua ke variabel num2

        # Penambahan
        lw $t2, num1       # Muat angka pertama dari variabel num1 ke $t2
        lw $t3, num2       # Muat angka kedua dari variabel num2 ke $t3
        add $t4, $t2, $t3  # Tambahkan angka pertama dan kedua, hasil disimpan di $t4

		# Simpan hasil penambahan ke variabel hasil
        sw $t4, hasil      # Simpan hasil penambahan ke variabel hasil
		
		# Print hasil penambahan
        lw $a0, hasil      # muat alamat hasil ke $a0
        li $v0, 1          # syscall code for print integer
        syscall

        # exit program
        li $v0, 10         # syscall code for exit
        syscall
