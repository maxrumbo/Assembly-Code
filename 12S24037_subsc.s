.data
	num1:	.word 10		# operand 1
	num2:	.word 4			# operand 2
	result:	.word 0			# result
	
.text

		lw $t0, num1		# load operand 1 into $t0
		lw $t1, num2		# load operand 2 into $t1
		
		sub $t2, $t0, $t1	# subtract $t1 from $t0, result in $t2
		
	main:			# new label
	
		# Print the result to the console
		li	$v0, 1			# syscall code for print integer
		move $a0, $t2		# load the value to be printed into $a0
		syscall
		
		# Additional instruction
		li $t3, 0x0A		# Load newline character into $t3

		# Exit program
		li	$v0, 10			# syscall code for Exit
		syscall