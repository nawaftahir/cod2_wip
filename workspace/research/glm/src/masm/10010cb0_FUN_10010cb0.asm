.686
.MODEL FLAT, C
EXTRN sub_10010C33:PROC
EXTRN sub_10010C63:PROC
.CODE
FUN_10010cb0 PROC
    mov ecx, dword ptr [ebx + 20]
    push esi
    push edi
    mov edi, eax
    mov eax, dword ptr [ebx + 16]
    xor esi, esi
    cmp eax, ecx
    jne L1
    imul eax, dword ptr [esp + 12]
    mov esi, eax
    jmp L0
    lea esp, [esp]
L0:
    push 0000000FFh
    push 9
    push 01018A988h
    mov eax, ebx
    call sub_10010C33
    mov dl, byte ptr [edi]
    add dl, al
    add esp, 12
    mov byte ptr [edi], dl
    inc edi
    dec esi
    jne L0
    pop edi
    pop esi
    ret
L1:
    push ebp
    mov ebp, dword ptr [ebx + 16]
    jmp L2
    lea esp, [esp]
L2:
    push 0000000FFh
    push 9
    push 01018A988h
    mov eax, ebx
    call sub_10010C63
    mov dl, byte ptr [esi + edi]
    add dl, al
    add esp, 12
    mov byte ptr [esi + edi], dl
    inc esi
    dec ebp
    jne L2
    mov eax, dword ptr [esp + 16]
FUN_10010cb0 ENDP
END
