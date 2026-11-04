.686
.MODEL FLAT, C
EXTRN sub_10010B9B:PROC
EXTRN sub_1002CB89:PROC
EXTRN sub_10060CCF:PROC
EXTRN fp_101D49D4:DWORD
.CODE
FUN_1002cd00 PROC
    push ebp
    mov ebp, dword ptr [esp + 8]
    mov eax, dword ptr [ebp + 12]
    imul eax, dword ptr [ebp + 16]
    push esi
    push edi
    mov dword ptr [esp + 16], eax
    shl eax, 3
    mov ecx, 17
    mov esi, ebp
    mov edi, ebx
    push eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    call dword ptr [fp_101D49D4]
    mov ecx, dword ptr [esp + 20]
    lea edx, [ecx*4]
    push edx
    mov dword ptr [ebx + 4], eax
    call dword ptr [fp_101D49D4]
    add esp, 8
    mov esi, ebx
    mov dword ptr [ebx + 8], eax
    call sub_1002CB89
    mov ecx, dword ptr [esp + 20]
    xor eax, eax
    mov ax, word ptr [ebp + 12]
    push eax
    push ecx
    push 010197940h
    call sub_10060CCF
    mov di, word ptr [ebp + 16]
    add esp, 8
    call sub_10010B9B
    add esp, 4
    pop edi
    pop esi
    mov dword ptr [ebx + 64], eax
    pop ebp
    ret
FUN_1002cd00 ENDP
END
