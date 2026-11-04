; FUN_1005c800 @ 0x1005c800 — auto-synthesized
.CODE
FUN_1005c800 PROC
    fld dword ptr [ecx]
    fcomp dword ptr [edx]
    fnstsw ax
    test ah, 0x41
    jne L0
    mov eax, dword ptr [edx]
    mov dword ptr [ecx], eax
    fld dword ptr [esi]
    fcomp dword ptr [edi]
    fnstsw ax
    test ah, 5
    jp L1
    mov eax, dword ptr [edi]
    mov dword ptr [esi], eax
    fld dword ptr [ecx + 4]
    fcomp dword ptr [edx + 4]
    fnstsw ax
    test ah, 0x41
    jne L2
    mov eax, dword ptr [edx + 4]
    mov dword ptr [ecx + 4], eax
    fld dword ptr [esi + 4]
    fcomp dword ptr [edi + 4]
    fnstsw ax
    test ah, 5
    jp L3
    mov eax, dword ptr [edi + 4]
    mov dword ptr [esi + 4], eax
    fld dword ptr [ecx + 8]
    fcomp dword ptr [edx + 8]
    fnstsw ax
    test ah, 0x41
    jne L4
    mov edx, dword ptr [edx + 8]
    mov dword ptr [ecx + 8], edx
    fld dword ptr [esi + 8]
    fcomp dword ptr [edi + 8]
    fnstsw ax
    test ah, 5
    jp L5
    mov eax, dword ptr [edi + 8]
    mov dword ptr [esi + 8], eax
    ret
FUN_1005c800 ENDP
END