# Nama Praktikan: Maxwell Avinda Rumahorbo
# Nim Praktikan: 12S24037
# Judul Praktikum: Assembly Programming Using Mars Simulator 2
# Tanggal Percobaan: 11/04/2025

.data
pi: .float 3.14159265358979323846
angle: .float 0.5  # The angle in radians for which we want to compute the sine
result: .float 0.0  # The result will be stored here
six: .float 6.0
onetwenty: .float 120.0

.text
main:
    la $t0, angle  # Load the address of angle into $t0
    lwc1 $f0, 0($t0)  # Load the value of angle into $f0

    la $t1, pi  # Load the address of pi into $t1
    lwc1 $f1, 0($t1)  # Load the value of pi into $f1

    mul.s $f0, $f0, $f1  # Convert the angle to radians

    mov.s $f2, $f0  # Copy the angle to $f2
    mul.s $f2, $f2, $f0  # Compute x^2

    mov.s $f3, $f0  # Copy the angle to $f3
    mul.s $f3, $f3, $f2  # Compute x^3

    la $t3, six  # Load the address of six into $t3
    lwc1 $f4, 0($t3)  # Load the value of six into $f4

    div.s $f4, $f3, $f4  # Compute x^3/6!

    sub.s $f0, $f0, $f4  # Subtract x^3/6! from x

    mov.s $f4, $f3  # Copy x^3 to $f4
    mul.s $f4, $f4, $f2  # Compute x^5

    la $t4, onetwenty  # Load the address of onetwenty into $t4
    lwc1 $f5, 0($t4)  # Load the value of onetwenty into $f5

    div.s $f4, $f4, $f5  # Compute x^5/120!

    add.s $f0, $f0, $f4  # Add x^5/120! to the result

    la $t2, result  # Load the address of result into $t2
    swc1 $f0, 0($t2)  # Store the result

    # Exit the program
    li $v0, 10
    syscall
