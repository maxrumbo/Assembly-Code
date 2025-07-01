# 12S24020_Joice Anastasya Napitupulu
# Exercise 4 question 2

.data
    num1: .word 32767             # Initialize num1 with a random value
    num2: .word 420               # Initialize num2 with a random value
    result_and: .word 0           # Initialize result for bitwise AND operation
    result_or: .word 0            # Initialize result for bitwise OR operation
    result_xor: .word 0           # Initialize result for bitwise XOR operation
    result_shift_left: .word 0    # Initialize result for left shift operation
    result_shift_right: .word 0   # Initialize result for right shift operation
    result_not: .word 0           # Initialize result for bitwise NOT operation
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
    
    # Print result to console
    li $v0, 1                      # System call for print_int
    move $a0, $t2                  # Move result_and to $a0
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
    move $a0, $t7                  # Move result_not to $a0
    syscall
    
    # Exit program
    li $v0, 10                     # System call for exit
    syscall
