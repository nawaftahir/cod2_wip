; _ProcessCodePage @ 0x101004a2 — auto-synthesized
    EXTRN fp_101ae18c:DWORD
    EXTRN g_101a50d0:DWORD
    EXTRN g_101ae174:DWORD
    sub_100f7411 PROTO C
    sub_101003c5 PROTO C
    sub_101003d6 PROTO C
    sub_10100dc1 PROTO C
.CODE
_ProcessCodePage PROC
    push ebp
    mov ebp, esp
    sub esp, 0xc
    mov eax, dword ptr [g_101a50d0]
    push esi
    mov esi, ecx
    test esi, esi
    mov dword ptr [ebp - 4], eax
    je L0
    cmp byte ptr [esi], 0
    je L0
    push 0x1017e288
    push esi
    call sub_101003c5
    test eax, eax
    pop ecx
    pop ecx
    je L0
    push 0x1017e284
    push esi
    call sub_101003d6
    test eax, eax
    pop ecx
    pop ecx
    jne L1
    push 8
    lea eax, [ebp - 0xc]
    push eax
    push 0xb
    jmp L2
    push 8
    lea eax, [ebp - 0xc]
    push eax
    push 0x1004
    push dword ptr [g_101ae174]
    call dword ptr [fp_101ae18c]
    test eax, eax
    je L3
    lea esi, [ebp - 0xc]
    push esi
    call sub_100f7411
    pop ecx
    mov ecx, dword ptr [ebp - 4]
    pop esi
    call sub_10100dc1
    leave
    ret
_ProcessCodePage ENDP
END