; FUN_10030a40 @ 0x10030a40 — auto-synthesized
    EXTRN g_1019bc84:DWORD
    EXTRN g_101ce6d0:DWORD
    EXTRN g_101ce708:DWORD
    EXTRN g_101ce71c:DWORD
    EXTRN g_101ce754:DWORD
    EXTRN g_101ce7a4:DWORD
    EXTRN g_101d496d:DWORD
.CODE
FUN_10030a40 PROC
    mov eax, dword ptr [g_101ce708]
    mov eax, dword ptr [eax + 8]
    cmp eax, 2
    je L0
    mov cl, byte ptr [g_101d496d]
    test cl, cl
    je L0
    mov ecx, dword ptr [g_101ce71c]
    mov dl, byte ptr [ecx + 8]
    test dl, dl
    je L0
    mov edx, dword ptr [g_101ce6d0]
    mov cl, byte ptr [edx + 8]
    test cl, cl
    je L1
    mov ecx, dword ptr [g_101ce754]
    cmp dword ptr [ecx + 8], 2
    je L1
    cmp eax, 2
    je L2
    mov edx, dword ptr [g_101ce7a4]
    fld dword ptr [edx + 8]
    fcomp dword ptr [g_1019bc84]
    fnstsw ax
    test ah, 0x41
    je L1
    fld dword ptr [esp + 4]
    fcomp dword ptr [g_1019bc84]
    fnstsw ax
    test ah, 0x41
    jne L2
    mov al, 1
    ret
    xor al, al
    ret
FUN_10030a40 ENDP
END