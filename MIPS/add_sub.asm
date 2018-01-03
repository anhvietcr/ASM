.globl main
.text
main:
	#print msg and read int a
	la $a0, msg_in
	addi $v0, $0, 4
	syscall
	la $v0, 5
	syscall
	sw $v0, aInt

	#print msg and read int b
	la $a0, msg_in
	addi $v0, $0, 4
	syscall
	la $v0, 5
	syscall
	sw $v0, bInt
	
	#Load var a & b into register
	lw $s0, aInt
	lw $s1, bInt
	#CONG
	la $a0, msg_out_add
	addi $v0, $0, 4
	syscall
	add $a0, $s0, $s1
	addi $v0, $0, 1
	syscall	
	
	#TRU
	la $a0, msg_out_sub
	addi $v0, $0, 4
	syscall
	sub $a0, $s0, $s1
	addi $v0, $0, 1
	syscall

	j exit
	
exit:
	la $v0, 10
	syscall

.data
	msg_in: .asciiz "Nhap 1 so: "
	msg_out_add: .asciiz "\nKet qua cong la: "
	msg_out_sub: .asciiz "\nKet qua tru la: "
	aInt: .word 0
	bInt: .word 0
