.686
.MODEL FLAT, C
EXTRN sub_1006A743:PROC
EXTRN sub_1006A74E:PROC
EXTRN sub_10086B35:PROC
EXTRN sub_100F787C:PROC
EXTRN sub_100F7887:PROC
.CODE
FUN_100c520c PROC
    mov edi, edi
    push esi
    mov esi, ecx
    push edi
    push dword ptr [esi + 00000010Ch]
    mov dword ptr [esi], 01011A3B8h
    call sub_100F787C
    push dword ptr [esi + 000000124h]
    call sub_100F7887
    lea edi, [esi + 0000001B0h]
    mov eax, dword ptr [edi]
    test eax, eax
    pop ecx
    pop ecx
    je L0
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    and dword ptr [edi], 0
L0:
    lea ecx, [esi + 0000001D4h]
    call sub_1006A743
    lea ecx, [esi + 0000001B4h]
    call sub_1006A74E
    pop edi
    mov ecx, esi
    pop esi
    jmp sub_10086B35
FUN_100c520c ENDP
END
