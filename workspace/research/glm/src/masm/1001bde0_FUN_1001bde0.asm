.686
.MODEL FLAT, C
EXTRN sub_100168EE:PROC
EXTRN sub_100169BB:PROC
EXTRN sub_1001B857:PROC
EXTRN sub_1001BAA4:PROC
EXTRN g_101CE708:DWORD
.CODE
FUN_1001bde0 PROC
    push ecx
    push ebx
    push edi
    mov edi, eax
    lea ebx, [esp + 8]
    call sub_100168EE
    test al, al
    je L0
    mov eax, dword ptr [esp + 8]
    mov eax, dword ptr [eax*4 + 0101D92D4h]
    test eax, eax
    jne L3
L0:
    mov ecx, dword ptr [g_101CE708]
    cmp dword ptr [ecx + 8], 2
    push esi
    push edi
    jne L1
    call sub_1001BAA4
    mov esi, eax
    add esp, 4
    test esi, esi
    jne L2
    pop esi
    pop edi
    pop ebx
    pop ecx
    ret
L1:
    call sub_1001B857
    mov esi, eax
    add esp, 4
    test esi, esi
    jne L2
    pop esi
    pop edi
    pop ebx
    pop ecx
    ret
L2:
    push esi
    call sub_100169BB
    add esp, 4
    mov eax, esi
    pop esi
L3:
    pop edi
    pop ebx
    pop ecx
    ret
FUN_1001bde0 ENDP
END
