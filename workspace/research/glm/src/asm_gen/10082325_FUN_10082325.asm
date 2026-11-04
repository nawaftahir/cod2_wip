; FUN_10082325 @ 0x10082325 — auto-synthesized
    EXTRN fp_1010c054:DWORD
    EXTRN fp_1010c058:DWORD
    EXTRN fp_1010c05c:DWORD
    EXTRN fp_1010c060:DWORD
    EXTRN g_1010c064:DWORD
    EXTRN g_1010c068:DWORD
    sub_10082319 PROTO C
.CODE
FUN_10082325 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov ebx, ecx
    xor esi, esi
    cmp dword ptr [ebx], esi
    push edi
    je L0
    call sub_10082319
    cmp dword ptr [ebp + 0x14], esi
    mov edi, dword ptr [g_1010c068]
    jne L1
    mov edi, dword ptr [g_1010c064]
    cmp dword ptr [ebp + 0x10], esi
    je L2
    push 2
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call edi
    mov esi, eax
    test esi, esi
    jne L3
    push 0xa
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call edi
    mov esi, eax
    test esi, esi
    je L4
    push esi
    push dword ptr [ebp + 8]
    call dword ptr [fp_1010c060]
    test eax, eax
    mov dword ptr [ebx + 8], eax
    je L4
    push esi
    push dword ptr [ebp + 8]
    call dword ptr [fp_1010c05c]
    test eax, eax
    mov dword ptr [ebx], eax
    je L4
    push eax
    call dword ptr [fp_1010c058]
    test eax, eax
    mov dword ptr [ebx + 4], eax
    jne L5
    call dword ptr [fp_1010c054]
    mov eax, 0x88760b59
    jmp L6
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 0x10
FUN_10082325 ENDP
END