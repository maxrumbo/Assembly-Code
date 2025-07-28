# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025
.data
fib_msg: .asciiz "Fibonacci sequence: "
newline: .asciiz "\n"

.text
main:
    # Print Fibonacci sequence message
    li $v0, 4               # syscall code for print string
    la $a0, fib_msg         # load address of fib_msg into $a0
    syscall                 # invoke syscall to print fib_msg

    # Set n to the desired number of Fibonacci sequence terms
    li $a0, 10              # set n to 10 terms
    jal fibonacci           # call the Fibonacci function

    # Print newline
    li $v0, 4               # syscall code for print string
    la $a0, newline         # load address of newline into $a0
    syscall                 # invoke syscall to print newline

    # Exit program
    li $v0, 10              # syscall code for exit
    syscall                 # invoke syscall to exit program

fibonacci:
    # Function prologue
    addi $sp, $sp, -8       # allocate space on stack for $ra and $fp
    sw $ra, 4($sp)          # save return address on stack
    sw $fp, 0($sp)          # save old frame pointer on stack
    move $fp, $sp           # set new frame pointer

    # Fibonacci calculation
    li $t0, 0               # base case: F(0) = 0
    beq $a0, $t0, fib_base_case  # if n == 0, return 0

    li $t0, 1               # base case: F(1) = 1
    beq $a0, $t0, fib_base_case  # if n == 1, return 1

    # Recursive calls for F(n-1) and F(n-2)
    addi $a0, $a0, -1       # calculate F(n-1)
    jal fibonacci
    move $s0, $v0           # store result of F(n-1) in $s0

    addi $a0, $a0, -1       # calculate F(n-2)
    jal fibonacci
    move $s1, $v0           # store result of F(n-2) in $s1

    add $v0, $s0, $s1       # add F(n-1) and F(n-2) to get F(n)

    # Function epilogue
    lw $ra, 4($fp)          # restore return address from stack
    lw $fp, 0($fp)          # restore old frame pointer from stack
    addi $sp, $sp, 8        # deallocate space on stack
    jr $ra                  # return to caller

fib_base_case:
    # Base case: F(0) = 0 or F(1) = 1
    move $v0, $a0           # return n (0 or 1)

    # Function epilogue
    lw $ra, 4($fp)          # restore return address from stack
    lw $fp, 0($fp)          # restore old frame pointer from stack
    addi $sp, $sp, 8        # deallocate space on stack
    jr $ra                  # return to caller
