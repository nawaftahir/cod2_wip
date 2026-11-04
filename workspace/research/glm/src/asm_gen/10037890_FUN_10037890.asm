; FUN_10037890 @ 0x10037890 — auto-synthesized
    EXTRN fp_101d4a6c:DWORD
    EXTRN g_101ce7ec:DWORD
    EXTRN g_10764584:DWORD
    sub_10037867 PROTO C
    sub_100f70cd PROTO C
.CODE
FUN_10037890 PROC
    mov ecx, dword ptr [g_101ce7ec]
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    je L0
    mov edx, dword ptr [g_10764584]
    test edx, edx
    setne dl
    test dl, dl
    je L0
    dec eax
    push eax
    push ecx
    call dword ptr [fp_101d4a6c]
    mov ecx, dword ptr [g_101ce7ec]
    add esp, 8
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    jne L1
    mov eax, dword ptr [g_10764584]
    test eax, eax
    je L2
    push eax
    call sub_100f70cd
    add esp, 4
    mov dword ptr [g_10764584], 0
    ret
    jmp sub_10037867
FUN_10037890 ENDP
END