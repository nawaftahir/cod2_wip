.686
.MODEL FLAT, C
EXTRN sub_100168EE:PROC
EXTRN sub_100169BB:PROC
EXTRN sub_1001B857:PROC
EXTRN sub_1001BAA4:PROC
EXTRN sub_1001BE51:PROC
EXTRN sub_1001BE62:PROC
EXTRN sub_1001BE72:PROC
EXTRN sub_1001BE85:PROC
EXTRN EXTRN g_101CE708:DWORD:DWORD
.CODE
FUN_1001bde0 PROC
    push push ecx
    push push ebx
    push push edi
    mov mov edi, eax
    lea lea ebx, [esp + 8]
    call sub_100168EE
    test test al, al
    je L0
    mov mov eax, dword ptr [esp + 8]
    mov mov eax, dword ptr [eax*4 + 0101D92D4h]
    test test eax, eax
    jne sub_1001BE62
    mov mov ecx, dword ptr [g_101CE708]
    cmp cmp dword ptr [ecx + 8], 2
    push push esi
    push push edi
    jne sub_1001BE51
    call sub_1001BAA4
    mov mov esi, eax
    add add esp, 4
    test test esi, esi
    jne sub_1001BE72
    pop pop esi
    pop pop edi
    pop pop ebx
    pop pop ecx
    ret ret
    call sub_1001B857
    mov mov esi, eax
    add add esp, 4
    test test esi, esi
    jne sub_1001BE85
    pop pop esi
    pop pop edi
    pop pop ebx
    pop pop ecx
    ret ret
    push push esi
    call sub_100169BB
    add add esp, 4
    mov mov eax, esi
    pop pop esi
    pop pop edi
    pop pop ebx
    pop pop ecx
    ret ret
FUN_1001bde0 ENDP
END
