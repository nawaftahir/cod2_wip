.686
.MODEL FLAT, C
EXTRN sub_1002D23D:PROC
.CODE
FUN_1002d1c0 PROC
    test edx, edx
    jle sub_1002D23D
    add ecx, 56
    add eax, 24
    push edi
    jmp L0
    lea ecx, [ecx]
L0:
    mov edi, dword ptr [ecx - 8]
    mov dword ptr [eax - 24], edi
    mov edi, dword ptr [ecx - 4]
    mov dword ptr [eax - 20], edi
    mov edi, dword ptr [ecx]
    mov dword ptr [eax - 16], edi
    mov dword ptr [eax - 12], 03F800000h
    mov edi, dword ptr [ecx - 56]
    mov dword ptr [eax - 8], edi
    mov edi, dword ptr [ecx - 52]
    mov dword ptr [eax - 4], edi
    mov edi, dword ptr [ecx - 48]
    mov dword ptr [eax], edi
    mov edi, dword ptr [ecx - 44]
    mov dword ptr [eax + 4], edi
    mov edi, dword ptr [ecx - 28]
    mov dword ptr [eax + 8], edi
    mov edi, dword ptr [ecx - 12]
    mov dword ptr [eax + 12], edi
    mov edi, dword ptr [ecx - 40]
    mov dword ptr [eax + 16], edi
    mov edi, dword ptr [ecx - 36]
    mov dword ptr [eax + 20], edi
    mov edi, dword ptr [ecx - 32]
    mov dword ptr [eax + 24], edi
    mov edi, dword ptr [ecx - 24]
    mov dword ptr [eax + 28], edi
    mov edi, dword ptr [ecx - 20]
    mov dword ptr [eax + 32], edi
    mov edi, dword ptr [ecx - 16]
    mov dword ptr [eax + 36], edi
    add ecx, 64
    add eax, 64
    dec edx
FUN_1002d1c0 ENDP
END
