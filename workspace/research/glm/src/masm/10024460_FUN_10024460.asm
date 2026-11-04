.686
.MODEL FLAT, C
.CODE
FUN_10024460 PROC
    cmp eax, edi
    jbe L4
    push ebx
    push ebp
    push esi
    lea ebx, [edi + 8]
    lea ebx, [ebx]
L0:
    mov edx, ebx
    cmp edx, eax
    mov ecx, edi
    ja L3
L1:
    mov esi, dword ptr [edx]
    cmp esi, dword ptr [ecx]
    jbe L2
    mov ecx, edx
L2:
    add edx, 8
    cmp edx, eax
    jbe L1
L3:
    mov ebp, dword ptr [eax]
    mov edx, dword ptr [ecx]
    mov esi, dword ptr [ecx + 4]
    mov dword ptr [ecx], ebp
    mov ebp, dword ptr [eax + 4]
    mov dword ptr [ecx + 4], ebp
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], esi
    sub eax, 8
    cmp eax, edi
    ja L0
    pop esi
    pop ebp
    pop ebx
L4:
    ret
FUN_10024460 ENDP
END
