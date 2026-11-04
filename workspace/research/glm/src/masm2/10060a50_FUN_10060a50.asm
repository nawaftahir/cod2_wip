.686
.MODEL FLAT, C
EXTRN sub_10060AEC:PROC
EXTRN sub_10060AF8:PROC
EXTRN sub_10060AFD:PROC
EXTRN sub_10060B1C:PROC
EXTRN sub_100F75FD:PROC
EXTRN sub_100F7608:PROC
.CODE
FUN_10060a50 PROC
    push push ebx
    push push ebp
    push push esi
    mov mov esi, dword ptr [esp + 20]
    push push edi
    mov mov edi, dword ptr [esp + 20]
    lea lea esp, [esp]
    mov mov bl, byte ptr [edi]
    inc inc edi
    cmp cmp bl, 42
    jne L4
    cmp cmp byte ptr [edi], 0
    je L3
    cmp cmp byte ptr [esi], 0
    je L1
    lea lea eax, [esi + 1]
    push push eax
    lea lea ecx, [edi - 1]
    push push ecx
    call L0
L0:
    add add esp, 8
L1:
    test test eax, eax
    jne L2
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor eax, eax
    pop pop ebx
    ret ret
    mov mov al, byte ptr [esi]
    inc inc esi
    cmp cmp bl, al
    je sub_10060AF8
    cmp cmp bl, 63
    je sub_10060AFD
    movsx movsx edx, al
    push push edx
    call sub_100F75FD
    mov mov ebp, eax
    movsx movsx eax, bl
    push push eax
    call sub_100F7608
    add add esp, 8
    sub sub eax, ebp
    jne sub_10060B1C
    test test bl, bl
    jmp sub_10060AEC
    xor xor ecx, ecx
    test test eax, eax
    setge setge cl
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    lea lea ecx, [ecx + ecx - 1]
    mov mov eax, ecx
    ret ret
FUN_10060a50 ENDP
END
