#de quy tinh giai thua cua so
# func(n) = n * func(n-1)
#n = 5 -> func() = 5 * 4 * 3 * 2  * 1

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
	
	#allocate byte for stack
	addi $sp, $sp, -4
	lw $a0, n 		#$a0 = n

	jal function		#call function( n )
	
	#get $v0 and print result
	sw $t1, result
	lw $a0, result
	la $v0, 1
	syscall

	j exit

function:
	addi $sp, $sp, -4
	sw $ra, 0($sp)		#push $ra into stack
	
	bne $a0, $0, not_0	#n != 0 -> function(n-1)
	la $t1, 1		#bat dau chay nguoc de quy, n = 0 -> result = 1

	lw $ra, 0($sp)		#pop $ra from stack
	addi $sp, $sp, 4

	jr $ra

not_0:
	addi $sp, $sp, -4
	sw $a0, 0($sp)		#push n into stack

	addi $a0, $a0, -1	#n--
	jal function		#call function ( n-1 )
	
	lw $t0, 0($sp)		#pop stack -> $t0
	addi $sp, $sp, 4
	
	mul $t1, $t1, $t0	#n * function(n-1)

	lw $ra, 0($sp)		#pop $ra from stack
	addi $sp, $sp, 4
	jr $ra
	

exit:
	la $v0, 10
	syscall
.data
	msg_in: .asciiz "Nhap n: "
	result: .word 0
	n: .word 0

#.align 2
#result: .space 400