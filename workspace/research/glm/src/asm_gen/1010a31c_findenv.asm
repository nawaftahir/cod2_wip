; findenv @ 0x1010a31c — auto-synthesized
    EXTRN g_101ae02c:DWORD
    sub_10109503 PROTO C
.CODE
findenv PROC
    push esi
    mov esi, dword ptr [g_101ae02c]
    jmp L0
    push edi
    push eax
    push dword ptr [esp + 0x10]
    call sub_10109503
    add esp, 0xc
    test eax, eax
    jne L1
    mov eax, dword ptr [esi]
    mov al, byte ptr [edi + eax]
    cmp al, 0x3d
    je L2
    test al, al
    je L2
    add esi, 4
    mov eax, dword ptr [esi]
    test eax, eax
    jne L3
    mov eax, esi
    sub eax, dword ptr [g_101ae02c]
    pop esi
    sar eax, 2
    neg eax
    ret
    mov eax, esi
    sub eax, dword ptr [g_101ae02c]
    pop esi
    sar eax, 2
    ret
findenv ENDP
END