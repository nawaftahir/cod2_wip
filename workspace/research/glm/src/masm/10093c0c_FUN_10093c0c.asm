.686
.MODEL FLAT, C
EXTRN sub_1008BAA3:PROC
.CODE
FUN_10093c0c PROC
    xor edx, edx
    cmp dword ptr [ecx + 0000000E0h], edx
    jne L0
    xor eax, eax
    inc eax
    ret
L0:
    cmp dword ptr [ecx + 8], edx
    jbe L3
    push esi
    push edi
L1:
    mov eax, dword ptr [ecx + 20]
    mov eax, dword ptr [eax + edx*4]
    cmp dword ptr [eax + 68], -1
    je L2
    mov esi, dword ptr [eax + 68]
    mov edi, dword ptr [ecx + 0000000E0h]
    mov edi, dword ptr [edi + 20]
    mov esi, dword ptr [edi + esi*4]
    mov edi, dword ptr [eax + 12]
    mov dword ptr [esi + 12], edi
    mov esi, dword ptr [ecx + 0000000E0h]
    mov eax, dword ptr [eax + 68]
    mov esi, dword ptr [esi + 20]
    mov eax, dword ptr [esi + eax*4]
    mov dword ptr [eax + 68], edx
L2:
    inc edx
    cmp edx, dword ptr [ecx + 8]
    jb L1
    pop edi
    pop esi
L3:
    mov ecx, dword ptr [ecx + 0000000E0h]
    jmp sub_1008BAA3
FUN_10093c0c ENDP
END
