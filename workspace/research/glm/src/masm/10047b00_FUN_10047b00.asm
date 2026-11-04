.686
.MODEL FLAT, C
EXTRN sub_100479CE:PROC
.CODE
FUN_10047b00 PROC
    push esi
    mov esi, ecx
    mov cl, byte ptr [esi + 12]
    test cl, cl
    je L0
    mov eax, dword ptr [esi + eax*4 + 92]
    mov ecx, dword ptr [eax + edx*4]
    lea eax, [eax + edx*4]
    inc ecx
    mov dword ptr [eax], ecx
    pop esi
    ret
L0:
    mov ecx, dword ptr [esi + eax*4 + 76]
    movsx eax, byte ptr [ecx + edx + 000000400h]
    mov ecx, dword ptr [ecx + edx*4]
    push ecx
    call sub_100479CE
    add esp, 4
    pop esi
    ret
FUN_10047b00 ENDP
END
