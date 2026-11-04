; FUN_10085841 @ 0x10085841 — auto-synthesized
    EXTRN g_101ac96c:DWORD
.CODE
FUN_10085841 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    je L0
    mov ecx, dword ptr [g_101ac96c]
    mov dword ptr [eax + 0x70], ecx
    mov dword ptr [g_101ac96c], eax
    pop ebp
    ret 4
FUN_10085841 ENDP
END