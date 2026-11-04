; FUN_10085d76 @ 0x10085d76 — auto-synthesized
    EXTRN g_101ac974:DWORD
    EXTRN g_101ac978:DWORD
    sub_100826e6 PROTO C
.CODE
FUN_10085d76 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [g_101ac974]
    test eax, eax
    je L0
    mov ecx, dword ptr [eax + 0x78]
    mov dword ptr [g_101ac974], ecx
    jmp L1
    mov ecx, dword ptr [g_101ac978]
    push 0x10
    push dword ptr [ebp + 8]
    call sub_100826e6
    pop ebp
    ret 4
FUN_10085d76 ENDP
END