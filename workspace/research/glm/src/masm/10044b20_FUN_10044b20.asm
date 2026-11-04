.686
.MODEL FLAT, C
.CODE
FUN_10044b20 PROC
    mov eax, dword ptr [esi + 4]
    push 108
    push 1
    push esi
    call dword ptr [eax]
    mov dword ptr [esi + 000000164h], eax
    xor ecx, ecx
    mov dword ptr [eax], 010043C60h
    add esp, 12
    mov dword ptr [eax + 60], ecx
    mov dword ptr [eax + 44], ecx
    mov dword ptr [eax + 92], ecx
    mov dword ptr [eax + 76], ecx
    mov dword ptr [eax + 64], ecx
    mov dword ptr [eax + 48], ecx
    mov dword ptr [eax + 96], ecx
    mov dword ptr [eax + 80], ecx
    mov dword ptr [eax + 68], ecx
    mov dword ptr [eax + 52], ecx
    mov dword ptr [eax + 100], ecx
    mov dword ptr [eax + 84], ecx
    mov dword ptr [eax + 72], ecx
    mov dword ptr [eax + 56], ecx
    mov dword ptr [eax + 104], ecx
    mov dword ptr [eax + 88], ecx
    ret
FUN_10044b20 ENDP
END
