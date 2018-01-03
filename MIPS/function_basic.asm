.globl main
.text
main:
	jal function_1
	jal function_2
	b exit

exit:
	li $v0, 10
	syscall

function_1: 
	la $a0, msg_promt1
	li $v0,4
	syscall
	jr $ra		#return to label jal

function_2:
	la $a0, msg_promt2
	la $v0, 4
	syscall
	jr $ra
.data
	msg_promt1: .asciiz "Hello, this is fucntion one!.\n"
	msg_promt2: .asciiz "Hello, this is function two!. \n"
	
