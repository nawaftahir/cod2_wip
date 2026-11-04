; FUN_100308c0 @ 0x100308c0 — auto-synthesized
    EXTRN g_101ce708:DWORD
    EXTRN g_101ce754:DWORD
    EXTRN g_101ce790:DWORD
    EXTRN g_101ce7b8:DWORD
    sub_1002ffab PROTO C
    sub_100301a3 PROTO C
    sub_100302ef PROTO C
    sub_10030412 PROTO C
.CODE
FUN_100308c0 PROC
    push ecx
    mov eax, dword ptr [g_101ce754]
    mov eax, dword ptr [eax + 8]
    cmp eax, 1
    jne L0
    call sub_100301a3
    pop ecx
    ret
    mov ecx, dword ptr [g_101ce708]
    cmp dword ptr [ecx + 8], 2
    je L1
    cmp eax, 2
    jne L2
    call sub_1002ffab
    pop ecx
    ret
    mov edx, dword ptr [g_101ce7b8]
    mov al, byte ptr [edx + 8]
    test al, al
    je L3
    call sub_100302ef
    pop ecx
    ret
    mov eax, dword ptr [g_101ce790]
    mov cl, byte ptr [eax + 8]
    test cl, cl
    je L1
    call sub_10030412
    pop ecx
    ret
FUN_100308c0 ENDP
END