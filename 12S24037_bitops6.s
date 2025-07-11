# 12S23035_Julius Kaisar Bona Theo Sinaga
# Exercise 4 question 6

.data
    num1: .word 65280             # Initialize num1 with a random value
    num2: .word 255               # Initialize num2 with a random value
    result_and: .word 0           # Initialize result for bitwise AND operation
    result_or: .word 0            # Initialize result for bitwise OR operation
    result_xor: .word 0           # Initialize result for bitwise XOR operation
    result_shift_left: .word 0    # Initialize result for left shift operation
    result_shift_right: .word 0   # Initialize result for right shift operation
    result_or_xor: .word 0        # Initialize result for OR between result_xor and result_shift_right
    count_set_bits: .word 0       # Initialize result for counting set bits
    newline: .asciiz "\n"         # Newline character
    
.text
main: 
    lw $t0, num1                  # Load value of num1 into $t0
    lw $t1, num2                  # Load value of num1 into $t1
    
    # Perform advanced bit representation operations 
    and $t2, $t0, $t1             # Bitwise AND operation
    or $t3, $t0, $t1              # Bitwise OR operation
    xor $t4, $t0, $t1             # Bitwise XOR operation
    sll $t5, $t0, 2               # Left shift $t0 by 2 bits
    srl $t6, $t1, 1               # Right shift $t1 by 1 bits
    nor $t7, $t0, $zero           # Bitwise NOT operation
    
    # Multiply result_and by 2
    sll $t2, $t2, 1               # Shift left result_and by 1 (equal to multiplying by 2)
    
    # Perform OR between result_xor and result_shift_right
    or $t8, $t4, $t6               # Bitwise OR operation
    
    # Count the number of set bits in num1
    li $t9, 0                      # Initialize count to 0
count_loop:
    andi $t4, $t0, 1               # Check the least significant bit of $t0
    add $t9, $t9, $t4              # Add the least significant bit to the count
    srl $t0, $t0, 1                # Shift $t0 to the right by 1 bit
    bnez $t0, count_loop           # Continue counting until $t0 becomes 0
    
    sw $t9, count_set_bits          # Store the count of set bits in count_set_bits
    
    # Print result to console
    li $v0, 1                      # System call for print_int
    lw $a0, count_set_bits         # Load the count of set bits into $a0
    syscall
    
    li $v0, 4                      # System call for print_str
    la $a0, newline                # Load address of newline
    syscall
    
    li $v0, 1                      # System call for print_int
    move $a0, $t3                  # Move result_or to $a0
    syscall
    
    li $v0, 4                      # System call for print_str
    la $a0, newline                # Load address of newline
    syscall
    
    li $v0, 1                      # System call for print_int
    move $a0, $t4                  # Move result_xor to $a0
    syscall
    
    li $v0, 4                      # System call for print_str
    la $a0, newline                # Load address of newline
    syscall
    
    li $v0, 1                      # System call for print_int
    move $a0, $t5                  # Move result_shift_left to $a0
    syscall
    
    li $v0, 4                      # System call for print_str
    la $a0, newline                # Load address of newline
    syscall
    
    li $v0, 1                      # System call for print_int
    move $a0, $t6                  # Move result_shift_right to $a0
    syscall
    
    li $v0, 4                      # System call for print_str
    la $a0, newline                # Load address of newline
    syscall
    
    li $v0, 1                      # System call for print_int
    move $a0, $t8                  # Move result_or_xor to $a0
    syscall
    
    # Exit program
    li $v0, 10                     # System call for exit
    syscall



