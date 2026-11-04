; FUN_10018080 @ 0x10018080 — auto-synthesized
    sub_1001819f PROTO C
.CODE
FUN_10018080 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    push esi
    push edi
    mov edi, eax
    lea esi, [edi + edi + 2]
    cmp esi, ebp
    mov ebx, ecx
    mov dword ptr [esp + 0x14], edi
    jge L0
    mov eax, dword ptr [ebx + esi*4 - 4]
    mov ecx, dword ptr [ebx + esi*4]
    push eax
    push ecx
    call dword ptr [esp + 0x24]
    add esp, 8
    test al, al
    je L1
    dec esi
    mov edx, dword ptr [ebx + esi*4]
    mov dword ptr [ebx + edi*4], edx
    mov edi, esi
    lea esi, [esi + esi + 2]
    cmp esi, ebp
    jl L2
    jne L3
    mov eax, dword ptr [ebx + ebp*4 - 4]
    mov dword ptr [ebx + edi*4], eax
    lea edi, [ebp - 1]
    mov ecx, dword ptr [esp + 0x1c]
    mov edx, dword ptr [esp + 0x18]
    mov eax, dword ptr [esp + 0x14]
    push ecx
    push edx
    push eax
    mov eax, edi
    call sub_1001819f
    add esp, 0xc
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_10018080 ENDP
END