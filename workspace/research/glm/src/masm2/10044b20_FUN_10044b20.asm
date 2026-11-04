.686
.MODEL FLAT, C
.CODE
FUN_10044b20 PROC
    mov mov eax, dword ptr [esi + 4]
    push push 108
    push push 1
    push push esi
    call call dword ptr [eax]
    mov mov dword ptr [esi + 0164h], eax
    xor xor ecx, ecx
    mov mov dword ptr [eax], 010043C60h
    add add esp, 12
    mov mov dword ptr [eax + 60], ecx
    mov mov dword ptr [eax + 44], ecx
    mov mov dword ptr [eax + 92], ecx
    mov mov dword ptr [eax + 76], ecx
    mov mov dword ptr [eax + 64], ecx
    mov mov dword ptr [eax + 48], ecx
    mov mov dword ptr [eax + 96], ecx
    mov mov dword ptr [eax + 80], ecx
    mov mov dword ptr [eax + 68], ecx
    mov mov dword ptr [eax + 52], ecx
    mov mov dword ptr [eax + 100], ecx
    mov mov dword ptr [eax + 84], ecx
    mov mov dword ptr [eax + 72], ecx
    mov mov dword ptr [eax + 56], ecx
    mov mov dword ptr [eax + 104], ecx
    mov mov dword ptr [eax + 88], ecx
    ret ret
FUN_10044b20 ENDP
END
