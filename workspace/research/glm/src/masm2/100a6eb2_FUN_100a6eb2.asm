.686
.MODEL FLAT, C
EXTRN sub_100C8D49:PROC
EXTRN sub_100F789F:PROC
EXTRN sub_100F78AC:PROC
.CODE
FUN_100a6eb2 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ebx
    push push esi
    push push edi
    mov mov esi, ecx
    push push 8
    xor xor eax, eax
    pop pop ecx
    lea lea edi, [esi + 01F8h]
    rep stosd rep stosd dword ptr es:[edi], eax
    lea lea edi, [esi + 0218h]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    and and dword ptr [esi + 0220h], 0
    and and dword ptr [esi + 0224h], 0
    lea lea edi, [esi + 022Ch]
    push push dword ptr [edi]
    call sub_100F789F
    lea lea ebx, [esi + 0230h]
    push push dword ptr [ebx]
    call sub_100F78AC
    and and dword ptr [edi], 0
    and and dword ptr [ebx], 0
    pop pop ecx
    pop pop ecx
    push push dword ptr [ebp + 8]
    mov mov ecx, esi
    call sub_100C8D49
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret 4
FUN_100a6eb2 ENDP
END
