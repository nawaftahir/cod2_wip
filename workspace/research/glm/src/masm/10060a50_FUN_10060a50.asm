.686
.MODEL FLAT, C
EXTRN sub_100F75FD:PROC
EXTRN sub_100F7608:PROC
.CODE
FUN_10060a50 PROC
L0:
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [esp + 20]
    push edi
    mov edi, dword ptr [esp + 20]
    lea esp, [esp]
L1:
    mov bl, byte ptr [edi]
    inc edi
    cmp bl, 42
    jne L4
    cmp byte ptr [edi], 0
    je L3
    cmp byte ptr [esi], 0
    je L1
    lea eax, [esi + 1]
    push eax
    lea ecx, [edi - 1]
    push ecx
    call L0
    add esp, 8
    test eax, eax
L2:
    jne L1
L3:
    pop edi
    pop esi
    pop ebp
    xor eax, eax
    pop ebx
    ret
L4:
    mov al, byte ptr [esi]
    inc esi
    cmp bl, al
    je L5
    cmp bl, 63
    je L5
    movsx edx, al
    push edx
    call sub_100F75FD
    mov ebp, eax
    movsx eax, bl
    push eax
    call sub_100F7608
    add esp, 8
    sub eax, ebp
    jne L6
L5:
    test bl, bl
    jmp L2
L6:
    xor ecx, ecx
    test eax, eax
    setge cl
    pop edi
    pop esi
    pop ebp
    pop ebx
    lea ecx, [ecx + ecx - 1]
    mov eax, ecx
    ret
FUN_10060a50 ENDP
END
