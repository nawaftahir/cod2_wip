.686
.MODEL FLAT, C
EXTRN sub_1008621C:PROC
EXTRN sub_1008B1CB:PROC
EXTRN sub_100AD525:PROC
EXTRN sub_100AD526:PROC
EXTRN sub_100AD538:PROC
EXTRN sub_100AD580:PROC
EXTRN sub_100AD597:PROC
EXTRN sub_100AD5B7:PROC
EXTRN sub_100AD5BB:PROC
.CODE
FUN_100ad36d PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 84
    push push ebx
    push push esi
    push push edi
    mov mov esi, ecx
    push push 18
    mov mov eax, 01010101h
    pop pop ecx
    lea lea edi, [ebp - 84]
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov eax, dword ptr [esi + 76]
    test test eax, eax
    jbe L2
    lea lea ecx, [ebp - 84]
    mov mov dword ptr [ebp - 8], ecx
    mov mov ecx, dword ptr [esi + 0230h]
    mov mov dword ptr [ebp - 4], ecx
    mov mov dword ptr [ebp - 12], eax
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [eax]
    test test ecx, ecx
    je L3
    mov mov edx, dword ptr [ecx]
    test test edx, edx
    je L5
    mov mov eax, edx
    and and eax, 0FFF00000h
    cmp cmp eax, 072100000h
    jne L0
    xor xor edx, edx
    jmp L1
    and and edx, 0FFFFFh
    mov mov eax, dword ptr [ecx + 4]
    cmp cmp edx, eax
    jae L6
    mov mov ecx, dword ptr [ecx + 8]
    mov mov ebx, dword ptr [esi + 20]
    lea lea edi, [ecx + edx*4]
    sub sub eax, edx
    mov mov ecx, dword ptr [edi]
    mov mov ecx, dword ptr [ebx + ecx*4]
    mov mov edx, dword ptr [esi + 088h]
    cmp cmp dword ptr [ecx + 4], edx
    jne L8
    mov mov edx, dword ptr [ecx + 16]
    cmp cmp edx, 3
    jae L9
    mov mov ecx, dword ptr [ecx + 12]
    lea lea edx, [edx + ecx*2]
    add add edx, ecx
    and and dword ptr [ebp + edx*4 - 84], 0
    add add edi, 4
    dec dec eax
    jne L7
    mov mov edi, dword ptr [ebp - 8]
    xor xor eax, eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    add add dword ptr [ebp - 4], 4
    add add dword ptr [ebp - 8], 12
    dec dec dword ptr [ebp - 12]
    jne L4
    xor xor edi, edi
    xor xor ebx, ebx
    cmp cmp dword ptr [ebp + ebx*4 - 84], 0
    je sub_100AD526
    push push 3
    xor xor edx, edx
    pop pop ecx
    mov mov eax, ebx
    div div ecx
    mov mov ecx, dword ptr [ebp + 12]
    cmp cmp dword ptr [ecx + eax*4], 0
    jne sub_100AD538
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push edx
L2:
    push push eax
    push push dword ptr [esi + 088h]
    mov mov ecx, esi
    call sub_1008621C
L3:
    cmp cmp eax, -1
    mov mov ecx, dword ptr [ebp + 8]
L5:
    mov mov dword ptr [ecx + edi*4], eax
    je sub_100AD580
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    and and dword ptr [eax + 60], 0
    inc inc edi
    cmp cmp edi, dword ptr [ebp + 16]
    je sub_100AD597
    inc inc ebx
    cmp cmp ebx, 18
    jb sub_100AD525
    push push 010117320h
    push push 011A9h
    push push 0
    push push esi
    call sub_1008B1CB
    add add esp, 16
    mov mov eax, 080004005h
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 12
    mov mov eax, 08007000Eh
    jmp sub_100AD5B7
    xor xor eax, eax
    jmp sub_100AD5BB
FUN_100ad36d ENDP
END
