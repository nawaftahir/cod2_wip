.686
.MODEL FLAT, C
.CODE
FUN_100cbb1b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 12]
    push esi
    mov esi, dword ptr [ebp + 8]
    mov edx, eax
    sub edx, esi
    shr edx, 1
    je L1
    push ebx
    push edi
    mov edi, esi
    shl edi, 2
    lea eax, [eax*4 - 4]
    mov dword ptr [ebp + 12], edx
L0:
    mov edx, dword ptr [ecx + 60]
    lea esi, [edi + edx]
    mov edx, dword ptr [eax + edx]
    mov ebx, dword ptr [esi]
    mov dword ptr [esi], edx
    mov edx, dword ptr [ecx + 60]
    mov dword ptr [eax + edx], ebx
    add edi, 4
    sub eax, 4
    dec dword ptr [ebp + 12]
    jne L0
    pop edi
    pop ebx
L1:
    pop esi
    pop ebp
    ret 8
FUN_100cbb1b ENDP
END
