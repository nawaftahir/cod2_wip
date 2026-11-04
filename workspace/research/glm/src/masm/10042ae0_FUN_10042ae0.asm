.686
.MODEL FLAT, C
.CODE
FUN_10042ae0 PROC
    push ecx
    mov eax, dword ptr [esp + 8]
    push edi
    mov edi, dword ptr [eax + 36]
    mov eax, dword ptr [eax + 44]
    mov dword ptr [esp + 4], eax
    mov eax, dword ptr [esp + 28]
    dec eax
    js L3
    mov edx, dword ptr [esp + 16]
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 32]
    shl ebp, 2
    inc eax
    push esi
    mov dword ptr [esp + 24], eax
    lea ebx, [ebx]
L0:
    mov eax, dword ptr [esp + 32]
    mov eax, dword ptr [eax]
    mov esi, dword ptr [eax + ebp]
    mov ecx, dword ptr [edx]
    add edx, 4
    add ebp, 4
    xor eax, eax
    test edi, edi
    jbe L2
L1:
    mov bl, byte ptr [ecx]
    mov byte ptr [eax + esi], bl
    add ecx, dword ptr [esp + 16]
    inc eax
    cmp eax, edi
    jb L1
L2:
    dec dword ptr [esp + 24]
    jne L0
    pop esi
    pop ebp
    pop ebx
L3:
    pop edi
    pop ecx
    ret
FUN_10042ae0 ENDP
END
