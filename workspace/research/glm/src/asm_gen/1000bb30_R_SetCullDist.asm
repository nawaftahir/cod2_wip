; R_SetCullDist @ 0x1000bb30 — auto-synthesized
    EXTRN g_1019bc78:DWORD
.CODE
R_SetCullDist PROC
    mov ecx, dword ptr [esp + 4]
    fld dword ptr [esp + 0x1c]
    mov al, byte ptr [esp + 0x10]
    fcomp dword ptr [g_1019bc78]
    mov dl, byte ptr [esp + 0x14]
    shl ecx, 5
    mov byte ptr [ecx + 0x101d617a], al
    mov al, byte ptr [esp + 0x18]
    mov byte ptr [ecx + 0x101d6178], al
    mov eax, dword ptr [esp + 0xc]
    mov byte ptr [ecx + 0x101d6179], dl
    mov edx, dword ptr [esp + 8]
    mov byte ptr [ecx + 0x101d617b], 0xff
    mov dword ptr [ecx + 0x101d6180], eax
    fnstsw ax
    mov dword ptr [ecx + 0x101d617c], edx
    test ah, 1
    mov eax, 1
    mov byte ptr [ecx + 0x101d618a], 0
    mov byte ptr [ecx + 0x101d6188], al
    mov byte ptr [ecx + 0x101d6189], al
    jne L0
    mov dword ptr [ecx + 0x101d616c], eax
    mov dword ptr [ecx + 0x101d6184], 0x3f800000
    ret
    mov edx, dword ptr [esp + 0x1c]
    mov dword ptr [ecx + 0x101d616c], 2
    mov dword ptr [ecx + 0x101d6184], edx
    ret
R_SetCullDist ENDP
END