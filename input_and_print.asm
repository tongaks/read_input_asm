section .data
	varword db "Input: "

section .bss
	var resb 10

section .text
	global _start

_start:
	mov rax, 1 			; sys write
	mov rdi, 1 			; standard output
	mov rsi, varword 	; variable
	mov rdx, 7 			; how many bytes. starts with 1
	syscall 			; call kernel
	
	jmp _input


_input:
	mov rax, 0 			; sys read
	mov rdi, 0 			; stdin, input
	mov rsi, var 		; buffer
	mov rdx, 10			; how many bytes
	syscall

	jmp _print


_print:
	mov rax, 1
	mov rdi, 1
	mov rsi, var
	mov rdx, 10
	syscall

	jmp _exit


_exit:
	mov rax, 60 		; sys_exit
	mov rdi, 0 			; exit successfuly
	syscall