.686
.MODEL FLAT, C
.CODE
FUN_10081e9a PROC
    mov edi, edi
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 8]
    test eax, eax
    mov dword ptr [esi], 01010FF58h
    je L0
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    and dword ptr [esi + 8], 0
L0:
    mov eax, dword ptr [esi + 12]
    test eax, eax
    je L1
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    and dword ptr [esi + 12], 0
L1:
    mov eax, dword ptr [esi + 16]
    test eax, eax
    je L2
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    and dword ptr [esi + 16], 0
L2:
    pop esi
    ret
FUN_10081e9a ENDP
END
