; _TestDefaultLanguage @ 0x101006ff — auto-synthesized
    EXTRN fp_101ae18c:DWORD
    EXTRN g_101a50d0:DWORD
    EXTRN g_101ae188:DWORD
    sub_100fa24d PROTO C
    sub_1010064f PROTO C
    sub_101006a9 PROTO C
    sub_10100dbc PROTO C
.CODE
_TestDefaultLanguage PROC
    push ebp
    mov ebp, esp
    sub esp, 0x7c
    mov eax, dword ptr [g_101a50d0]
    mov dword ptr [ebp - 4], eax
    push 0x78
    lea eax, [ebp - 0x7c]
    push eax
    mov eax, dword ptr [ebp + 8]
    and eax, 0x3ff
    push 1
    or eax, 0x400
    push eax
    call dword ptr [fp_101ae18c]
    test eax, eax
    je L0
    lea edx, [ebp - 0x7c]
    call sub_1010064f
    cmp dword ptr [ebp + 8], eax
    je L1
    cmp dword ptr [ebp + 0xc], 0
    je L1
    push esi
    push dword ptr [g_101ae188]
    call sub_100fa24d
    mov edx, dword ptr [g_101ae188]
    pop ecx
    mov esi, eax
    call sub_101006a9
    cmp eax, esi
    pop esi
    jne L1
    xor eax, eax
    jmp L2
    xor eax, eax
    inc eax
    mov ecx, dword ptr [ebp - 4]
    call sub_10100dbc
    leave
    ret
_TestDefaultLanguage ENDP
END