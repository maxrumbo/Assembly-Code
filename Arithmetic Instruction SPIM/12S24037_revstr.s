.data
input_string:	.space 50		# Buffer untuk menyimpan string input
output_string:	.space 50		# Buffer untuk menyimpan string hasil reverse

prompt:			.asciiz  "Masukkan string: "
reverse_prompt: .asciiz	"\nString setelah direverse: "

.text
main:
	# Meminta input dari pengguna 
	li $v0, 4					# Syscall untuk print string
	la $a0, prompt
	syscall
	
	li $v0, 8					# Syscall untuk baca string dari input
	la $a0, input_string
	li $a1, 50					# Panjang maksimum string input
	syscall
	
	#inisialisasi register
	la $a0, input_string		# Alamat awal string input
	la $a1, output_string		# Alamat buffer hasil reverse
	
	# Panggil fungsi reverse
	jal reverse_string
	
	# Print hasil reverse
	li $v0, 4					# Syscall untuk print string
	la $a0, reverse_prompt
	syscall
	
	li $v0, 4					# Syscall untuk print string
	move $a0, $a1				# Alamat buffer hasil reverse
	syscall
	
	#exit program
	li $v0, 10					# Syscall untuk exit program
	syscall
	
reverse_string:
	#inisialisasi register		
	move $t0, $a0				# $t0 untuk alamat awal string
	move $t1, $a1				# $t1 untuk alamat buffer hasil reverse
	
	#hitung panjang string
	li	$t2, 0					# $t2 untuk inisialisasi panjang string
	count_lenght:
		lb	$t3, 0($t0)			# ambil byte dari string
		beq $t3, $zero, end_count_lenght	# Jika sudah mencapai null terminator, selesai
		addi $t0, $t0, 1		# pindahkan pointer ke byte berikutnya
		addi $t2, $t2, 1		# increment panjang string
		j count_lenght
	end_count_lenght:
	
	#pindahkan pointer ke byte terakhir
	addi $t0, $t0, -1
	
	#reverse_string
	move $t3, $zero				# $t3 untuk inisialisasi offset
	reverse_loop:
		bge $t3, $t2, reverse_done 	# Jika sudah mencapai akhir string, selesai
		
		lb $t4, 0($t0)			# Ambil byte dari string
		sb $t4, 0($t1)			# Simpan byte ke buffer
		addi $t0, $t0, -1		# Pindahkan pointer ke byte sebelumnya 
		addi $t1, $t1, 1		# Pindahkan pointer buffer ke posisi sebelumnya
		addi $t3, $t3, 1		# increment offset
		
		j reverse_loop
		
	reverse_done:	
			sb $zero, 0($t1)	# Null-terminate string hasil reverse
			jr $ra				# Kembali ke pemanggil