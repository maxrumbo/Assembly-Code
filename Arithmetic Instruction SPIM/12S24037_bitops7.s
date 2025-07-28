# 12S23035_Julius Kaisar Bona Theo Sinaga
# Exercise 4 question 7

.data
    num1: .word 65535             # Initialize num1 with a random value
    num2: .word 420               # Initialize num2 with a random value
    same_bits_message: .asciiz "Bit position: "  # Message for displaying same bit positions
    newline: .asciiz "\n"         # Newline character
    
.text
main:
    lw $t0, num1                  # Load value of num1 into $t0
    lw $t1, num2                  # Load value of num2 into $t1
    
    li $t2, 0                      # Initialize counter for bit position
    
check_bits_loop:
    and $t3, $t0, $t1             # Perform bitwise AND between num1 and num2
    bnez $t3, print_bit_position  # If result is not zero, print the bit position
    
    sll $t0, $t0, 1               # Shift num1 to the left by 1 bit
    sll $t1, $t1, 1               # Shift num2 to the left by 1 bit
    addi $t2, $t2, 1              # Increment the bit position counter
    
    li $t3, 32                    # Check all 32 bits, so we loop until $t3 equals 32
    bnez $t3, check_bits_loop     # If $t3 is not zero, continue looping
    
    # If we reach here, no same bits found
    li $v0, 4                     # System call for print_str
    la $a0, newline               # Load address of newline
    syscall
    
    li $v0, 10                    # System call for exit
    syscall
    
print_bit_position:
    # Print message for same bit position
    li $v0, 4                     # System call for print_str
    la $a0, same_bits_message     # Load address of same_bits_message
    syscall
    
    # Print bit position
    li $v0, 1                     # System call for print_int
    move $a0, $t2                 # Move bit position to $a0
    syscall
    
    li $v0, 4                     # System call for print_str
    la $a0, newline               # Load address of newline
    syscall
    
    li $v0, 10                    # System call for exit
    syscall






