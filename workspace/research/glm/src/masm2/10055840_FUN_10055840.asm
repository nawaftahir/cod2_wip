.686
.MODEL FLAT, C
.CODE
FUN_10055840 PROC
    push push ebx
    push push esi
    xor xor ebx, ebx
    push push 84
    mov mov dword ptr [edi + 4], ebx
    call call dword ptr [edi + 24]
    mov mov esi, eax
    add add esp, 4
    cmp cmp esi, ebx
    jne L0
    mov mov eax, dword ptr [edi]
    mov mov dword ptr [eax + 20], 54
    mov mov ecx, dword ptr [edi]
    mov mov dword ptr [ecx + 24], ebx
    mov mov edx, dword ptr [edi]
    push push edi
    call call dword ptr [edx]
    add add esp, 4
    mov mov dword ptr [esi + 44], ebx
    mov mov dword ptr [esi], 010054D40h
    mov mov dword ptr [esi + 4], 010054E90h
    mov mov dword ptr [esi + 8], 010054F50h
    mov mov dword ptr [esi + 12], 010055000h
    mov mov dword ptr [esi + 16], 0100550B0h
    mov mov dword ptr [esi + 20], 010055120h
    mov mov dword ptr [esi + 24], 010055190h
    mov mov dword ptr [esi + 28], 010055440h
    mov mov dword ptr [esi + 32], 010055590h
    mov mov dword ptr [esi + 36], 0100556F0h
    mov mov dword ptr [esi + 40], 010055800h
    mov mov dword ptr [esi + 48], 03B9ACA00h
    mov mov dword ptr [esi + 56], ebx
    mov mov dword ptr [esi + 64], ebx
    mov mov dword ptr [esi + 52], ebx
    mov mov dword ptr [esi + 60], ebx
    mov mov dword ptr [esi + 68], ebx
    mov mov dword ptr [esi + 72], ebx
    mov mov dword ptr [esi + 76], 84
    mov mov dword ptr [edi + 4], esi
    pop pop esi
    pop pop ebx
    ret ret
FUN_10055840 ENDP
END
