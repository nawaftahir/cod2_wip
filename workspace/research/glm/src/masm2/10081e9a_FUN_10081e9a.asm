.686
.MODEL FLAT, C
EXTRN sub_10081EEA:PROC
EXTRN sub_10081F0C:PROC
.CODE
FUN_10081e9a PROC
    mov mov edi, edi
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 8]
    test test eax, eax
    mov mov dword ptr [esi], 01010FF58h
    je L0
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    and and dword ptr [esi + 8], 0
    mov mov eax, dword ptr [esi + 12]
    test test eax, eax
    je sub_10081EEA
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    and and dword ptr [esi + 12], 0
    mov mov eax, dword ptr [esi + 16]
    test test eax, eax
    je sub_10081F0C
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    and and dword ptr [esi + 16], 0
    pop pop esi
    ret ret
FUN_10081e9a ENDP
END
