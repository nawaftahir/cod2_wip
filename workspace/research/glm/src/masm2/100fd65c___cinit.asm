.686
.MODEL FLAT, C
EXTRN sub_100FD6EB:PROC
EXTRN sub_100FD6FE:PROC
EXTRN sub_100FD716:PROC
EXTRN sub_100FD717:PROC
EXTRN sub_101082B8:PROC
EXTRN EXTRN g_101A461C:DWORD:DWORD
.CODE
__cinit PROC
    mov mov eax, dword ptr [g_101A461C]
    test test eax, eax
    je L0
    push push dword ptr [esp + 4]
    call call eax
    pop pop ecx
    push push esi
    push push edi
    mov mov ecx, 01019E00Ch
    mov mov edi, 01019E020h
    xor xor eax, eax
    cmp cmp ecx, edi
    mov mov esi, ecx
    jae L3
    test test eax, eax
    jne sub_100FD6EB
    mov mov ecx, dword ptr [esi]
    test test ecx, ecx
    je L2
    call call ecx
    add add esi, 4
    cmp cmp esi, edi
    jb L1
    test test eax, eax
    jne sub_100FD6FE
    push push 0100FDF09h
    call sub_101082B8
    mov mov esi, 01019E000h
    mov mov eax, esi
    mov mov edi, 01019E008h
    cmp cmp eax, edi
    pop pop ecx
    jae sub_100FD717
    mov mov eax, dword ptr [esi]
    test test eax, eax
    je sub_100FD716
    call call eax
L2:
    add add esi, 4
    cmp cmp esi, edi
    jb sub_100FD717
    xor xor eax, eax
    pop pop edi
    pop pop esi
    ret ret
__cinit ENDP
END
