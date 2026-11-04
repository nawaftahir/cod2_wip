; FUN_10085da3 @ 0x10085da3 — auto-synthesized
    EXTRN g_101ac974:DWORD
.CODE
FUN_10085da3 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    je L0
    mov ecx, dword ptr [g_101ac974]
    mov dword ptr [eax + 0x78], ecx
    mov dword ptr [g_101ac974], eax
    pop ebp
    ret 4
FUN_10085da3 ENDP
END