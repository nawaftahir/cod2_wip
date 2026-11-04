; FUN_10083ec3 @ 0x10083ec3 — auto-synthesized
    EXTRN fp_1010c000:DWORD
    EXTRN fp_1010c004:DWORD
    EXTRN fp_1010c008:DWORD
.CODE
FUN_10083ec3 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    and dword ptr [ebp - 4], 0
    lea eax, [ebp - 4]
    push eax
    push 0x10110098
    push 0x80000002
    call dword ptr [fp_1010c008]
    test eax, eax
    jne L0
    push esi
    lea eax, [ebp + 0x14]
    push eax
    push dword ptr [ebp + 0x10]
    lea eax, [ebp + 0x10]
    push eax
    push 0
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp - 4]
    call dword ptr [fp_1010c000]
    push dword ptr [ebp - 4]
    mov esi, eax
    call dword ptr [fp_1010c004]
    test esi, esi
    pop esi
    jne L0
    mov eax, dword ptr [ebp + 0x10]
    cmp eax, dword ptr [ebp + 8]
    jne L0
    xor eax, eax
    inc eax
    jmp L1
    xor eax, eax
    leave
    ret 0x10
FUN_10083ec3 ENDP
END