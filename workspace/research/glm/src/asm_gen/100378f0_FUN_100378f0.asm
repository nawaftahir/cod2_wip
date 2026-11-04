; FUN_100378f0 @ 0x100378f0 — auto-synthesized
    EXTRN g_101ce7ec:DWORD
    EXTRN g_10764584:DWORD
    sub_100f6c6f PROTO C
    sub_100f6d2c PROTO C
.CODE
FUN_100378f0 PROC
    mov eax, dword ptr [g_101ce7ec]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L0
    mov ecx, dword ptr [g_10764584]
    test ecx, ecx
    setne al
    test al, al
    je L0
    push edx
    push 0x10193358
    push ecx
    call sub_100f6d2c
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100f6c6f
    add esp, 0x10
    ret
FUN_100378f0 ENDP
END