.686
.MODEL FLAT, C
EXTRN sub_10010B9B:PROC
EXTRN sub_1002CB89:PROC
EXTRN sub_10060CCF:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
.CODE
FUN_1002cd00 PROC
    push push ebp
    mov mov ebp, dword ptr [esp + 8]
    mov mov eax, dword ptr [ebp + 12]
    imul imul eax, dword ptr [ebp + 16]
    push push esi
    push push edi
    mov mov dword ptr [esp + 16], eax
    shl shl eax, 3
    mov mov ecx, 17
    mov mov esi, ebp
    mov mov edi, ebx
    push push eax
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    call dword ptr [fp_101D49D4]
    mov mov ecx, dword ptr [esp + 20]
    lea lea edx, [ecx*4]
    push push edx
    mov mov dword ptr [ebx + 4], eax
    call dword ptr [fp_101D49D4]
    add add esp, 8
    mov mov esi, ebx
    mov mov dword ptr [ebx + 8], eax
    call sub_1002CB89
    mov mov ecx, dword ptr [esp + 20]
    xor xor eax, eax
    mov mov ax, word ptr [ebp + 12]
    push push eax
    push push ecx
    push push 010197940h
    call sub_10060CCF
    mov mov di, word ptr [ebp + 16]
    add add esp, 8
    call sub_10010B9B
    add add esp, 4
    pop pop edi
    pop pop esi
    mov mov dword ptr [ebx + 64], eax
    pop pop ebp
    ret ret
FUN_1002cd00 ENDP
END
