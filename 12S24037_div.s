# 12S24037 - Maxwell Avinda Rumahorbo
# AOK Division

.data
newline: .asciiz "\n"

.text
main:
    # Initialize variables
    li $s0, 10       # Numerator (dividend)
    li $s1, 2        # Denominator (divisor)

    # Division operation
    div $s0, $s1                # Divide $s0 by $s1
    mflo $t1                    # Move quotient to $t1

    # Print quotient
    move $a0, $t1               # Load quotient to print
    li $v0, 1                   # Load print syscall code
    syscall

    # Print newline
    la $a0, newline             # Load newline address
    li $v0, 4                   # Load print syscall code
    syscall

    # Exit program
    li $v0, 10                  # Load exit syscall code
    syscall

