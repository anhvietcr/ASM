.globl main
.text
main:
	#print msg get size array
	la $a0, msg_in
	la $v0, 4
	syscall	
	la $v0, 5
	syscall
	sw $v0, size

	#init array
	addi $t0, $0, 0 #i
	addi $t3, $0, 0 #stack
	lw $s0, size	#size

loop:
	bge $t0, $s0, endLoop	#if >= size, break
				#else
	#print msg input
	la $a0, msg_in_word
	la $v0, 4
	syscall
		
	#read
	la $v0, 5
	syscall
	addi $t0, $t0, 1	#i++
	sw $v0, array($t3)	#save array[i]
	addi $t3, $t3, 4	#stack + 1 word
	b loop	

endLoop:
	la $a0, line
	la $v0, 4
	syscall
	
	#reset iterator
	addi $t3, $0, 0		
	addi $t0, $0, 0
	j print
	
print:
	bge $t0, $s0, exit
	lw $a0, array($t3)	#load array[i] -> $a0
	la $v0, 1
	syscall

	la $a0, space		#space
	la $v0, 4
	syscall

	addi $t3, $t3, 4	
	addi $t0, $t0, 1
	b print
exit:
	la $v0, 10
	syscall
.data
	msg_in: .asciiz "Nhap so luong muon nhap (max = 100): "
	msg_in_word: .asciiz "Integet > "
	msg_out: .asciiz "Ket qua mang vua nhap: "
	line: .asciiz "\n"
	space: .asciiz " "
	size: .word 0
	array: .space 400 #(4 int * 100) <-- array[100]
