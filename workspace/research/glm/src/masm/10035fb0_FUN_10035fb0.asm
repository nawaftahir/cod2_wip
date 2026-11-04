.686
.MODEL FLAT, C
.CODE
FUN_10035fb0 PROC
    push ebx
    mov bl, byte ptr [esp + 8]
    push ebp
    mov ebp, dword ptr [esp + 12]
    push esi
    mov esi, ecx
    mov ecx, eax
    and ecx, 0FFFFFFFCh
    shl ecx, 11
    or ecx, ebp
    shl al, 2
    push edi
    and bl, 3
    or al, bl
    and ecx, 0FFFFFFFCh
    mov edi, edx
    sar edi, 2
    shl al, 2
    shl ecx, 8
    and dl, 3
    or ecx, edi
    mov edi, dword ptr [esi]
    or al, dl
    shl al, 2
    xor ebp, ebp
    dec edi
    mov byte ptr [esp + 20], al
    js L4
    mov ebx, dword ptr [esi + 4]
L0:
    lea esi, [edi + ebp]
    sar esi, 1
    mov edx, dword ptr [ebx + esi*8]
    sub edx, ecx
    jne L1
    movzx edx, byte ptr [ebx + esi*8 + 4]
    movzx eax, byte ptr [esp + 20]
    sub edx, eax
    and edx, 0FFFFFFFEh
    je L5
L1:
    test edx, edx
    jge L2
    lea ebp, [esi + 1]
    jmp L3
L2:
    lea edi, [esi - 1]
L3:
    cmp ebp, edi
    jle L0
L4:
    mov edx, dword ptr [esp + 24]
    mov dword ptr [edx], edi
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    ret
L5:
    mov ecx, dword ptr [esp + 24]
    pop edi
    mov dword ptr [ecx], esi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    ret
FUN_10035fb0 ENDP
END
