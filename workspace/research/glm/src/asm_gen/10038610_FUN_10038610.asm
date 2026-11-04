; FUN_10038610 @ 0x10038610 — auto-synthesized
    EXTRN g_101ce6b8:DWORD
    EXTRN g_101ce764:DWORD
    EXTRN g_101ce7ec:DWORD
    EXTRN g_101d1bf8:DWORD
    EXTRN g_1072debd:DWORD
    EXTRN g_10764584:DWORD
    sub_100386bb PROTO C
    sub_100386cc PROTO C
    sub_100f6ca3 PROTO C
    sub_100f6d5f PROTO C
.CODE
FUN_10038610 PROC
    mov al, byte ptr [g_1072debd]
    test al, al
    jne L0
    mov eax, dword ptr [g_101ce764]
    mov ecx, dword ptr [esi + 8]
    cmp ecx, dword ptr [eax + 8]
    jl sub_100386bb
    mov edx, dword ptr [g_101ce6b8]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L0
    cmp ecx, eax
    jg sub_100386cc
    jmp L0
    lea esp, [esp]
    mov eax, dword ptr [g_101ce7ec]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L1
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L1
    push 0x10198e68
    push 0x10193358
    push eax
    call sub_100f6d5f
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100f6ca3
    add esp, 0x10
    mov ecx, dword ptr [esi + 8]
    mov eax, dword ptr [g_101d1bf8]
    mov edx, dword ptr [eax]
    push ecx
    mov ecx, dword ptr [esi + 0x10]
    push ecx
    mov ecx, dword ptr [esi + 4]
    push ecx
    mov ecx, dword ptr [esi]
    push ecx
    mov ecx, dword ptr [esi + 0xc]
    push ecx
    push 4
    push eax
    call dword ptr [edx + 0x148]
FUN_10038610 ENDP
END