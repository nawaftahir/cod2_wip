; FUN_100181b0 @ 0x100181b0 — auto-synthesized
.CODE
FUN_100181b0 PROC
    push ecx
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    push esi
    push edi
    mov edi, eax
    sub edi, ebp
    mov ecx, ebx
    sub ecx, ebp
    sar edi, 2
    sar ecx, 2
    test edi, edi
    mov eax, ecx
    mov esi, edi
    je L0
    mov edi, edi
    cdq
    idiv esi
    mov eax, esi
    test edx, edx
    mov esi, edx
    jne L1
    cmp eax, ecx
    jge L2
    test eax, eax
    jle L2
    lea esi, [ebp + eax*4]
    mov dword ptr [esp + 0x14], eax
    jmp L3
    lea ecx, [ecx]
    mov eax, dword ptr [esi]
    lea ecx, [esi + edi*4]
    cmp ecx, ebx
    mov edx, esi
    mov dword ptr [esp + 0xc], eax
    jne L4
    mov ecx, ebp
    cmp ecx, esi
    je L5
    mov eax, dword ptr [ecx]
    mov dword ptr [edx], eax
    mov eax, ebx
    sub eax, ecx
    sar eax, 2
    cmp edi, eax
    mov edx, ecx
    jge L6
    lea eax, [edi*4]
    add ecx, eax
    jmp L7
    mov ecx, edi
    sub ecx, eax
    lea ecx, [ebp + ecx*4]
    cmp ecx, esi
    jne L8
    mov eax, dword ptr [esp + 0xc]
    mov dword ptr [edx], eax
    mov eax, dword ptr [esp + 0x14]
    sub esi, 4
    dec eax
    mov dword ptr [esp + 0x14], eax
    jne L3
    pop edi
    pop esi
FUN_100181b0 ENDP
END