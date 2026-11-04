.686
.MODEL FLAT, C
.CODE
FUN_10055840 PROC
    push ebx
    push esi
    xor ebx, ebx
    push 84
    mov dword ptr [edi + 4], ebx
    call dword ptr [edi + 0x18]
    mov esi, eax
    add esp, 4
    cmp esi, ebx
    jne L0
    mov eax, dword ptr [edi]
    mov dword ptr [eax + 20], 54
    mov ecx, dword ptr [edi]
    mov dword ptr [ecx + 24], ebx
    mov edx, dword ptr [edi]
    push edi
    call dword ptr [edx]
    add esp, 4
L0:
    mov dword ptr [esi + 44], ebx
    mov dword ptr [esi], 010054D40h
    mov dword ptr [esi + 4], 010054E90h
    mov dword ptr [esi + 8], 010054F50h
    mov dword ptr [esi + 12], 010055000h
    mov dword ptr [esi + 16], 0100550B0h
    mov dword ptr [esi + 20], 010055120h
    mov dword ptr [esi + 24], 010055190h
    mov dword ptr [esi + 28], 010055440h
    mov dword ptr [esi + 32], 010055590h
    mov dword ptr [esi + 36], 0100556F0h
    mov dword ptr [esi + 40], 010055800h
    mov dword ptr [esi + 48], 03B9ACA00h
    mov dword ptr [esi + 56], ebx
    mov dword ptr [esi + 64], ebx
    mov dword ptr [esi + 52], ebx
    mov dword ptr [esi + 60], ebx
    mov dword ptr [esi + 68], ebx
    mov dword ptr [esi + 72], ebx
    mov dword ptr [esi + 76], 84
    mov dword ptr [edi + 4], esi
    pop esi
    pop ebx
    ret
FUN_10055840 ENDP
END
