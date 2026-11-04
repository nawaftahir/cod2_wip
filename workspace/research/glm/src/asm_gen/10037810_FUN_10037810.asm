; FUN_10037810 @ 0x10037810 — auto-synthesized
    EXTRN g_10764584:DWORD
    sub_100f6c98 PROTO C
    sub_100f6d0b PROTO C
    sub_100f6d55 PROTO C
    sub_100f6db7 PROTO C
    sub_100f6ebc PROTO C
    sub_100f7032 PROTO C
.CODE
FUN_10037810 PROC
    push ecx
    mov eax, dword ptr [g_10764584]
    test eax, eax
    jne L0
    push 0x1019890c
    push 0x10198904
    call sub_100f6d0b
    add esp, 8
    test eax, eax
    mov dword ptr [g_10764584], eax
    je L0
    lea eax, [esp]
    push eax
    call sub_100f7032
    lea ecx, [esp + 4]
    push ecx
    call sub_100f6ebc
    push eax
    call sub_100f6db7
    mov edx, dword ptr [g_10764584]
    push eax
    push 0x10194210
    push edx
    call sub_100f6d55
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100f6c98
    add esp, 0x1c
    pop ecx
    ret
FUN_10037810 ENDP
END