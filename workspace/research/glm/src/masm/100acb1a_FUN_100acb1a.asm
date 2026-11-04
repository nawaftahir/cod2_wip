.686
.MODEL FLAT, C
.CODE
FUN_100acb1a PROC
    mov edi, edi
    push esi
    xor esi, esi
    cmp dword ptr [ecx + 8], esi
    jbe L2
    push edi
L0:
    mov eax, dword ptr [ecx + 20]
    mov eax, dword ptr [eax + esi*4]
    mov edx, dword ptr [eax + 56]
    cmp edx, -1
    je L1
    mov edi, dword ptr [ecx + 20]
    shl edx, 2
    mov edi, dword ptr [edi + edx]
    mov edi, dword ptr [edi + 12]
    mov dword ptr [eax + 12], edi
    mov edi, dword ptr [ecx + 20]
    mov edx, dword ptr [edi + edx]
    mov edx, dword ptr [edx + 16]
    mov dword ptr [eax + 16], edx
L1:
    inc esi
    cmp esi, dword ptr [ecx + 8]
    jb L0
    pop edi
L2:
    xor eax, eax
    pop esi
    ret
FUN_100acb1a ENDP
END
