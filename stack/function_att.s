/* to illustarte how the function call is working in x86-64 assembly */
.global main

.section .text
main:
	mov $1, %rax
	mov $2, %rbx
	call foo

	#exit function syscall
	mov $60, %rax
	mov $0,  %rdi
	syscall


foo:
	/*
		these all values are psudo memory adresses
		rsp = 0x0111111f80 
		rbp = 0x1 #maybe
		mov %rsp, %rbp 
		rsp = 0x0111111f80
		rbp = 0x0111111f80 <-----|
	 	 			 |
		mov %rbp, rsp   <--------|
		pop %rbp -> now points to the previous rbp value
	*/
	push %rbp
	mov %rsp, %rbp

	mov $3, %rax
	mov $4, %rbx

	mov %rbp, %rsp
	pop %rbp
	ret
