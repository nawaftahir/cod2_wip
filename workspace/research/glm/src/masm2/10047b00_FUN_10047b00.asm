.686
.MODEL FLAT, C
EXTRN sub_100479CE:PROC
.CODE
FUN_10047b00 PROC
    push push esi
    mov mov esi, ecx
    mov mov cl, byte ptr [esi + 12]
    test test cl, cl
    je L0
    mov mov eax, dword ptr [esi + eax*4 + 92]
    mov mov ecx, dword ptr [eax + edx*4]
    lea lea eax, [eax + edx*4]
    inc inc ecx
    mov mov dword ptr [eax], ecx
    pop pop esi
    ret ret
    mov mov ecx, dword ptr [esi + eax*4 + 76]
    movsx movsx eax, byte ptr [ecx + edx + 0400h]
    mov mov ecx, dword ptr [ecx + edx*4]
    push push ecx
    call sub_100479CE
    add add esp, 4
    pop pop esi
    ret ret
FUN_10047b00 ENDP
END
