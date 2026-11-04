.686
.MODEL FLAT, C
.CODE
FUN_10051f90 PROC
    push esi
    mov esi, dword ptr [esp + 8]
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax + 8]
    mov eax, dword ptr [esi + 4]
    add esp, 4
    test eax, eax
    je L0
    push esi
    call dword ptr [eax + 0x28]
    add esp, 4
L0:
    mov ecx, dword ptr [esi]
    mov dword ptr [esi + 4], 0
    mov dword ptr [esi + 20], 0
    pop esi
    jmp dword ptr [ecx + 0x84]
FUN_10051f90 ENDP
END
