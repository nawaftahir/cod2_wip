; FUN_10083676 @ 0x10083676 — auto-synthesized
    sub_100827ec PROTO C
    sub_10082816 PROTO C
    sub_10082825 PROTO C
.CODE
FUN_10083676 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    push edi
    mov esi, ecx
    call sub_100827ec
    test eax, eax
    je L0
    push dword ptr [edi + 0x10]
    push dword ptr [esi + 0x10]
    call sub_10082816
    test eax, eax
    je L0
    push dword ptr [edi + 0x14]
    push dword ptr [esi + 0x14]
    call sub_10082825
    test eax, eax
    je L0
    xor eax, eax
    inc eax
    jmp L1
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 4
FUN_10083676 ENDP
END