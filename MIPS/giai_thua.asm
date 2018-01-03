.globl main
.text
main:
	#print msg and read n
	la $a0, msg_in
	la $v0, 4
	syscall
	la $v0, 5
	syscall
	sw $v0, n

	#restore n and init 
	lw $a0, n
	addi $t0, $0, 1

	#call label tinh giai thua
	jal giaithua

	#in ket qua
	move $a0, $t0
	la $v0, 1
	syscall

	j exit

giaithua:
	mul $t0, $t0, $a0
	addi $a0, $a0, -1
	bne $a0, $0, giaithua

	jr $ra

exit: 
	la $v0, 10
	syscall
	
.data
	msg_in: .asciiz "Nhap so n: "
	n: .word 0
