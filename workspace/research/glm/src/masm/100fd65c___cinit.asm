.686
.MODEL FLAT, C
EXTRN sub_101082B8:PROC
EXTRN g_101A461C:DWORD
.CODE
__cinit PROC
    mov eax, dword ptr [g_101A461C]
    test eax, eax
    je L0
    push dword ptr [esp + 4]
    call eax
    pop ecx
L0:
    push esi
    push edi
    mov ecx, 01019E00Ch
    mov edi, 01019E020h
    xor eax, eax
    cmp ecx, edi
    mov esi, ecx
    jae L3
L1:
    test eax, eax
    jne L7
    mov ecx, dword ptr [esi]
    test ecx, ecx
    je L2
    call ecx
L2:
    add esi, 4
    cmp esi, edi
    jb L1
    test eax, eax
    jne L7
L3:
    push 0100FDF09h
    call sub_101082B8
    mov esi, 01019E000h
    mov eax, esi
    mov edi, 01019E008h
    cmp eax, edi
    pop ecx
    jae L6
L4:
    mov eax, dword ptr [esi]
    test eax, eax
    je L5
    call eax
L5:
    add esi, 4
    cmp esi, edi
    jb L4
L6:
    xor eax, eax
L7:
    pop edi
    pop esi
    ret
__cinit ENDP
END
