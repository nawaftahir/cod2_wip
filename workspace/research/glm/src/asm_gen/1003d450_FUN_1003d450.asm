; FUN_1003d450 @ 0x1003d450 — auto-synthesized
    EXTRN g_101ce7ec:DWORD
    EXTRN g_101d1bf8:DWORD
    EXTRN g_10764584:DWORD
    EXTRN g_107667cc:DWORD
    EXTRN g_1076a830:DWORD
    sub_100f6c83 PROTO C
    sub_100f6d3f PROTO C
.CODE
FUN_1003d450 PROC
    cmp dword ptr [g_107667cc], esi
    je L0
    mov dword ptr [g_107667cc], esi
    mov edi, edi
    mov eax, dword ptr [g_101ce7ec]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L1
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L1
    push 0x101999bc
    push 0x10193358
    push eax
    call sub_100f6d3f
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100f6c83
    add esp, 0x10
    mov eax, dword ptr [g_101d1bf8]
    mov edx, dword ptr [eax]
    push esi
    push 0x3c
    push eax
    call dword ptr [edx + 0xe4]
    mov eax, dword ptr [g_1076a830]
    test eax, eax
    jne L2
    ret
FUN_1003d450 ENDP
END