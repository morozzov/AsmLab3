section .bss
	op1 resb 2
	op2 resb 2
	op3 resb 2

section .data
	prompt1 db "Enter 1st operand: "
	prompt2 db "Enter 2nd operand: "
	prompt3 db "Enter 3th operand: "
	len equ 19


	result db ?, 0x0A


section .text

	global _start

_start:

	;first operand
	mov eax, 4
	mov ebx, 1
	mov ecx, prompt1
	mov edx, len
	int 0x80

	mov eax, 3
	mov ebx, 2
	mov ecx, op1
	mov edx, 3
	int 0x80

	mov eax, 0
	mov al, op1[0]
	sub al, 48
	mov dl, 10
	mul dl

	mov bl, op1[1]
	sub bl, 48
	add al, bl

	mov op1[1], BYTE 0
	mov op1[0], al

	;second operad
	mov eax, 4
	mov ebx, 1
	mov ecx, prompt2
	mov edx, len
	int 0x80

	mov eax, 3
	mov ebx, 2
	mov ecx, op2
	mov edx, 3
	int 0x80

	mov eax, 0
	mov al, op2[0]
	sub al, 48
	mov dl, 10
	mul dl

	mov bl, op2[1]
	sub bl, 48
	add al, bl

	mov op2[1], BYTE 0
	mov op2[0], al

	;third operand
	mov eax, 4
	mov ebx, 1
	mov ecx, prompt3
	mov edx, len
	int 0x80

	mov eax, 3
	mov ebx, 2
	mov ecx, op3
	mov edx, 3
	int 0x80

	mov eax, 0
	mov al, op3[0]
	sub al, 48
	mov dl, 10
	mul dl

	mov bl, op3[1]
	sub bl, 48
	add al, bl

	mov op3[1], BYTE 0
	mov op3[0], al



	mov al, op1[0]
	mov dl, op2[0]
	
	sub al, dl

	mov dl, op3[0]
	
	sub al, dl

	mov dl, 10

	div dl

	add al, 48
	add ah, 48

	

	mov result[0], al
	mov result[1], ah
	mov result[2], BYTE 0x0A
	
	mov eax, 4
	mov ebx, 1
	mov ecx, result
	mov edx, 3
	int 0x80
	
	mov eax, 1
	mov ebx, 0
	int 0x80
	
