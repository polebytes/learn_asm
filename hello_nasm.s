global _start

section .data
string:
	DB "hello world", 0Ah, 0

section .text
_start:
	lea rdi, string	
	mov rsi, 13
	call print
	jmp exit

print:
	push rbp
	mov rbp, rsp

	;
	;	file descriptor
	;	0 -> input
	;	1 -> output
	;	2 -> error
	;

	mov r8, rdi
	mov r9, rsi
	mov rax, 1
	mov rdi, 1  ;unsigned int fd
	mov rsi, r8 ;unsigned const *buf, this var will contain the first adress of the data
	mov rdx, r9 ;defines how much byte we want to print out
	syscall

	mov rsp, rbp
	pop rbp
	ret

exit:
	mov rax, 60
	mov rdi, 1
	syscall
