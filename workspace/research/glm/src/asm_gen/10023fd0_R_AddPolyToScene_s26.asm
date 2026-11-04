; R_AddPolyToScene_s26 @ 0x10023fd0 — auto-synthesized
    EXTRN g_1019bc84:DWORD
    EXTRN g_101ce6fc:DWORD
    EXTRN g_101d1b28:DWORD
    EXTRN g_101d1b9c:DWORD
    EXTRN g_101d4d00:DWORD
    EXTRN g_10678514:DWORD
.CODE
R_AddPolyToScene_s26 PROC
    mov al, byte ptr [g_101d4d00]
    test al, al
    je L0
    mov eax, dword ptr [g_101d1b9c]
    test eax, eax
    je L0
    fld dword ptr [esp + 8]
    fcomp dword ptr [g_1019bc84]
    fnstsw ax
    test ah, 0x41
    jnp L0
    mov eax, dword ptr [g_101ce6fc]
    mov ecx, dword ptr [g_10678514]
    cmp ecx, dword ptr [eax + 8]
    jge L0
    mov eax, ecx
    imul eax, eax, 0x2c
    add eax, 0x10678518
    inc ecx
    mov dword ptr [g_10678514], ecx
    mov ecx, dword ptr [g_101d1b28]
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [esp + 4]
    mov edx, dword ptr [ecx]
    mov dword ptr [eax + 4], edx
    mov edx, dword ptr [ecx + 4]
    mov dword ptr [eax + 8], edx
    mov ecx, dword ptr [ecx + 8]
    mov edx, dword ptr [esp + 8]
    mov dword ptr [eax + 0xc], ecx
    mov ecx, dword ptr [esp + 0xc]
    mov dword ptr [eax + 0x10], edx
    mov edx, dword ptr [esp + 0x10]
    mov dword ptr [eax + 0x14], ecx
    mov ecx, dword ptr [esp + 0x14]
    mov dword ptr [eax + 0x18], edx
    mov dword ptr [eax + 0x1c], ecx
    ret
R_AddPolyToScene_s26 ENDP
END