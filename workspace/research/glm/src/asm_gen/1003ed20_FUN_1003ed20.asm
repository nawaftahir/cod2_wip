; FUN_1003ed20 @ 0x1003ed20 — auto-synthesized
    EXTRN g_101ce7ec:DWORD
    EXTRN g_101d1bf8:DWORD
    EXTRN g_10764584:DWORD
    EXTRN g_10766760:DWORD
    EXTRN g_1076a830:DWORD
    sub_100f6ca3 PROTO C
    sub_100f6d60 PROTO C
.CODE
FUN_1003ed20 PROC
    lea eax, [esi + esi*2]
    shl eax, 2
    mov ecx, dword ptr [eax + 0x10766750]
    push ebp
    mov ebp, dword ptr [esp + 8]
    mov dword ptr [g_10766760], ecx
    mov dword ptr [eax + 0x10766750], ebp
    mov dword ptr [eax + 0x10766754], ebx
    mov dword ptr [eax + 0x10766758], edi
    lea esp, [esp]
    mov edx, dword ptr [g_101ce7ec]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L0
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L0
    push 0x10198ff0
    push 0x10193358
    push eax
    call sub_100f6d60
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100f6ca3
    add esp, 0x10
    mov eax, dword ptr [g_101d1bf8]
    mov ecx, dword ptr [eax]
    push edi
    push ebx
    push ebp
    push esi
    push eax
    call dword ptr [ecx + 0x190]
    mov eax, dword ptr [g_1076a830]
    test eax, eax
    jne L1
    mov dword ptr [g_10766760], 0
    pop ebp
    ret
FUN_1003ed20 ENDP
END