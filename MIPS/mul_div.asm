.globl main
.text
main:
	#print msg and read int a
	la $a0, msg_in
	la $v0, 4
	syscall
	la $v0, 5
	syscall
	sw $v0, aInt
	
	#print msg and read int b
	la $a0, msg_in
	la $v0, 4
	syscall
	la $v0, 5
	syscall
	sw $v0, bInt
	
	#Load int a, b - register
	lw $s0, aInt
	lw $s1, bInt
	#MUL
	la $a0, msg_out_mul
	la $v0, 4
	syscall	
	mul $a0, $s0, $s1
	la $v0, 1
	syscall	

	#DIV
	div $a0, $s0, $s1
	mflo $a1 #result
	mfhi $a2 #mod
	
	la $a0, msg_out_div
	la $v0, 4
	syscall
	move $a0, $a1
	la $v0, 1
	syscall

	la $a0, msg_out_mod
	la $v0, 4
	syscall
	move $a0, $a2
	la $v0, 1
	syscall


	j exit

exit:
	la $v0, 10
	syscall
	
.data
	msg_in: .asciiz "Nhap 1 so: "
	msg_out_mul: .asciiz "\n(a * b) Tich 2 so la: "
	msg_out_div: .asciiz "\n(a / b) Hieu 2 so la: "
	msg_out_mod: .asciiz "\n(a % b) Mod 2 so la: "
	aInt: .word 0
	bInt: .word 0
