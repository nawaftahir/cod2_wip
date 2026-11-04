; FUN_10018af0 @ 0x10018af0 — auto-synthesized
    EXTRN g_101d496c:DWORD
    sub_10018b58 PROTO C
    sub_10018b60 PROTO C
.CODE
FUN_10018af0 PROC
    mov al, byte ptr [g_101d496c]
    test al, al
    jne sub_10018b58
    mov eax, dword ptr [ebx]
    push edi
    xor edi, edi
    test eax, eax
    jle sub_10018b60
    lea edx, [ebx + 0x14]
    push esi
    jmp L0
    lea esp, [esp]
    nop
    mov esi, dword ptr [edx + 8]
    test esi, 0x700
    je L1
    mov eax, dword ptr [edx]
    mov ecx, eax
    sar ecx, 8
    and ecx, 7
    cmp ecx, 1
    je L1
    test ecx, ecx
    je L1
    or esi, 0x7ff
    and eax, 0xfffff911
    or eax, 0x111
    mov dword ptr [edx + 8], esi
    mov dword ptr [edx], eax
    mov eax, dword ptr [ebx]
    inc edi
FUN_10018af0 ENDP
END