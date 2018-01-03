.globl main
.text
main:
	#print msg and read string input
	la $a0, msg_in
	la $v0, 4
	syscall
	
	la $a1, str
	la $v0, 8
	syscall
	sw $a0, str

	#print msg and print output string
	la $a0, msg_out
	la $v0, 4
	syscall

	lw $a0, str
	la $v0, 4
	syscall	

	j exit
exit: 
	la $v0, 10
	syscall
	
.data
	msg_in: .asciiz "Nhap 1 chuoi: "
	msg_out: .asciiz "\nChuoi vua nhap la: "
	str: .space 200
