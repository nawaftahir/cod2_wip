.686
.MODEL FLAT, C
EXTRN sub_1006A743:PROC
EXTRN sub_1006A74E:PROC
EXTRN sub_10086B35:PROC
EXTRN sub_100C5275:PROC
EXTRN sub_100F787C:PROC
EXTRN sub_100F7887:PROC
.CODE
FUN_100c520c PROC
    mov mov edi, edi
    push push esi
    mov mov esi, ecx
    push push edi
    push push dword ptr [esi + 010Ch]
    mov mov dword ptr [esi], 01011A3B8h
    call sub_100F787C
    push push dword ptr [esi + 0124h]
    call sub_100F7887
    lea lea edi, [esi + 01B0h]
    mov mov eax, dword ptr [edi]
    test test eax, eax
    pop pop ecx
    pop pop ecx
    je sub_100C5275
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    and and dword ptr [edi], 0
    lea lea ecx, [esi + 01D4h]
    call sub_1006A743
    lea lea ecx, [esi + 01B4h]
    call sub_1006A74E
    pop pop edi
    mov mov ecx, esi
    pop pop esi
    jmp sub_10086B35
FUN_100c520c ENDP
END
