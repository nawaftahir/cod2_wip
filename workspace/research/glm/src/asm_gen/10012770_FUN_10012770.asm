; FUN_10012770 @ 0x10012770 — auto-synthesized
    EXTRN fp_1010c1cc:DWORD
    EXTRN fp_1010c1d0:DWORD
    EXTRN g_101ce60c:DWORD
    EXTRN g_101ce610:DWORD
    EXTRN g_101ce66c:DWORD
    EXTRN g_101ce6cc:DWORD
.CODE
FUN_10012770 PROC
    mov eax, dword ptr [g_101ce60c]
    mov cl, byte ptr [eax + 8]
    sub esp, 8
    test cl, cl
    je L0
    mov ecx, dword ptr [g_101ce610]
    mov edx, dword ptr [ecx + 8]
    lea eax, [esp]
    push eax
    push 0x10012750
    push 0
    push 0
    mov dword ptr [esp + 0x10], edx
    mov dword ptr [esp + 0x14], 0
    call dword ptr [fp_1010c1cc]
    mov eax, dword ptr [esp + 4]
    test eax, eax
    jne L1
    mov ecx, dword ptr [g_101ce6cc]
    mov eax, dword ptr [ecx + 8]
    mov edx, dword ptr [g_101ce66c]
    mov ecx, dword ptr [edx + 8]
    push 1
    push ecx
    push eax
    call dword ptr [fp_1010c1d0]
    add esp, 8
    ret
FUN_10012770 ENDP
END