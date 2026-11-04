; FUN_10085814 @ 0x10085814 — auto-synthesized
    EXTRN g_101ac96c:DWORD
    EXTRN g_101ac970:DWORD
    sub_100826e6 PROTO C
.CODE
FUN_10085814 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [g_101ac96c]
    test eax, eax
    je L0
    mov ecx, dword ptr [eax + 0x70]
    mov dword ptr [g_101ac96c], ecx
    jmp L1
    mov ecx, dword ptr [g_101ac970]
    push 0x10
    push dword ptr [ebp + 8]
    call sub_100826e6
    pop ebp
    ret 4
FUN_10085814 ENDP
END