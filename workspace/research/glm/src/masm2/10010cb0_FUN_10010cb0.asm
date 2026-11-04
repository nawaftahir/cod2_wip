.686
.MODEL FLAT, C
EXTRN sub_10010C33:PROC
EXTRN sub_10010C63:PROC
EXTRN sub_10010D49:PROC
EXTRN sub_10010D72:PROC
.CODE
FUN_10010cb0 PROC
    mov mov ecx, dword ptr [ebx + 20]
    push push esi
    push push edi
    mov mov edi, eax
    mov mov eax, dword ptr [ebx + 16]
    xor xor esi, esi
    cmp cmp eax, ecx
    jne L1
    imul imul eax, dword ptr [esp + 12]
    mov mov esi, eax
    jmp L0
    lea lea esp, [esp]
    push push 0FFh
    push push 9
    push push 01018A988h
    mov mov eax, ebx
    call sub_10010C33
    mov mov dl, byte ptr [edi]
    add add dl, al
    add add esp, 12
    mov mov byte ptr [edi], dl
    inc inc edi
    dec dec esi
    jne L2
    pop pop edi
    pop pop esi
    ret ret
    push push ebp
    mov mov ebp, dword ptr [ebx + 16]
    jmp sub_10010D49
    lea lea esp, [esp]
    push push 0FFh
    push push 9
    push push 01018A988h
    mov mov eax, ebx
    call sub_10010C63
    mov mov dl, byte ptr [esi + edi]
    add add dl, al
    add add esp, 12
    mov mov byte ptr [esi + edi], dl
    inc inc esi
    dec dec ebp
    jne sub_10010D72
    mov mov eax, dword ptr [esp + 16]
FUN_10010cb0 ENDP
END
