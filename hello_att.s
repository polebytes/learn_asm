/*
* syscall arguments
* rdi, rsi, rdx, r10, r8, r9
* we pass these 6 arguments during the syscall
* rax registers will used as the syscall number
*/

.global _start

.section .data
string:
	.asciz "hello world\n"

.section .text
_start:
	lea string, %rdi
	mov $13, %rsi
	call print	
	jmp exit	

print:
	push %rbp
	mov %rsp, %rbp
	/*
		file descriptor
		0 -> input
		1 -> output
		2 -> error
	*/

	mov %rdi, %r8
	mov %rsi, %r9
	mov $1,   %rax
	mov $1,   %rdi #unsigned int fd
	mov %r8,  %rsi #unsigned const *buf, this var will contain the first adress of the data
	mov %r9,  %rdx #defines how much byte we want to print out
	syscall

	mov %rbp, %rsp
	pop %rbp
	ret

exit:
	#exit syscall
	mov $60, %rax
	mov $1,  %rdi #int error_code
	syscall
