; FUN_10038430 @ 0x10038430 — auto-synthesized
    EXTRN g_101ce7ec:DWORD
    EXTRN g_101d1bf8:DWORD
    EXTRN g_10764584:DWORD
    EXTRN g_107667b8:DWORD
    EXTRN g_1076a830:DWORD
    sub_1003849f PROTO C
    sub_100f6c83 PROTO C
    sub_100f6d3f PROTO C
.CODE
FUN_10038430 PROC
    cmp dword ptr [g_107667b8], esi
    je sub_1003849f
    jmp L0
    lea ebx, [ebx]
    mov eax, dword ptr [g_101ce7ec]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L1
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L1
    push 0x10198f80
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
    push eax
    call dword ptr [edx + 0x1ac]
    mov eax, dword ptr [g_1076a830]
    test eax, eax
    jne L0
FUN_10038430 ENDP
END