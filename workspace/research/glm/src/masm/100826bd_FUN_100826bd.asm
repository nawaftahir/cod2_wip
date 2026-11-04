.686
.MODEL FLAT, C
EXTRN fp_1010C090:DWORD
EXTRN fp_1010C094:DWORD
.CODE
FUN_100826bd PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    mov eax, dword ptr [ebp + 12]
    push ebx
    push esi
    mov esi, ecx
    mov edx, dword ptr [esi + 8]
    push edi
    lea ecx, [eax - 1]
    not ecx
    lea edi, [eax + edx - 1]
    and edi, ecx
    add edi, dword ptr [ebp + 8]
    cmp edi, dword ptr [esi + 16]
    jbe L6
    lea edi, [eax + 3]
    mov eax, dword ptr [esi + 20]
    and edi, ecx
    add edi, dword ptr [ebp + 8]
    mov dword ptr [ebp + 12], eax
    cmp edi, eax
    jbe L1
L0:
    mov eax, dword ptr [ebp + 12]
    add eax, eax
    cmp edi, eax
    mov dword ptr [ebp + 12], eax
    ja L0
L1:
    push 4
    push 000002000h
    push dword ptr [ebp + 12]
    push 0
    call dword ptr [fp_1010C094]
    test eax, eax
    mov dword ptr [ebp - 4], eax
    je L7
    mov eax, dword ptr [esi + 4]
    lea ebx, [eax + edi - 1]
    dec eax
    push 4
    not eax
    push 000001000h
    and ebx, eax
    push ebx
    push dword ptr [ebp - 4]
    call dword ptr [fp_1010C094]
    test eax, eax
    jne L2
    push 000008000h
    push eax
    push dword ptr [ebp - 4]
    call dword ptr [fp_1010C090]
    jmp L7
L2:
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [esi]
    mov dword ptr [eax], ecx
    mov dword ptr [esi], eax
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [esi + 16], eax
L3:
    mov dword ptr [esi + 12], ebx
L4:
    mov eax, dword ptr [esi]
    sub eax, dword ptr [ebp + 8]
    mov dword ptr [esi + 8], edi
    add eax, edi
L5:
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
L6:
    mov ecx, dword ptr [esi + 12]
    cmp edi, ecx
    jbe L4
    mov eax, dword ptr [esi + 4]
    lea ebx, [eax + edi - 1]
    dec eax
    not eax
    and ebx, eax
    push 4
    push 000001000h
    mov eax, ebx
    sub eax, ecx
    push eax
    mov eax, dword ptr [esi]
    add eax, ecx
    push eax
    call dword ptr [fp_1010C094]
    test eax, eax
    jne L3
L7:
    xor eax, eax
    jmp L5
FUN_100826bd ENDP
END
