.686
.MODEL FLAT, C
EXTRN sub_100FB124:PROC
EXTRN sub_100FC48E:PROC
.CODE
_gmtime PROC
    mov eax, dword ptr [esp + 4]
    push ebx
    push esi
    mov esi, dword ptr [eax]
    push edi
    xor ebx, ebx
    call sub_100FB124
    test esi, esi
    mov edi, eax
    jge L0
    xor eax, eax
    jmp L8
L0:
    cmp dword ptr [edi + 68], 0
    jne L1
    push 36
    call sub_100FC48E
    test eax, eax
    pop ecx
    mov dword ptr [edi + 68], eax
    mov ecx, 0101ADFE0h
    je L2
L1:
    mov ecx, dword ptr [edi + 68]
L2:
    mov eax, esi
    cdq
    mov edi, 007861F80h
    idiv edi
    mov edx, eax
    imul edx, edx, 0F879E080h
    add esi, edx
    lea edx, [eax*4 + 70]
    mov eax, 001E13380h
    cmp esi, eax
    jl L4
    sub esi, eax
    inc edx
    cmp esi, eax
    jl L4
    sub esi, eax
    mov eax, 001E28500h
    inc edx
    cmp esi, eax
    jl L3
    inc edx
    sub esi, eax
    jmp L4
L3:
    xor ebx, ebx
    inc ebx
L4:
    mov eax, esi
    mov dword ptr [ecx + 20], edx
    cdq
    mov edi, 000015180h
    idiv edi
    mov edi, 0101A55BCh
    mov dword ptr [ecx + 28], eax
    imul eax, eax, 0FFFEAE80h
    add esi, eax
    test ebx, ebx
    jne L5
    mov edi, 0101A55F0h
L5:
    mov eax, dword ptr [ecx + 28]
    xor edx, edx
    inc edx
    cmp dword ptr [edi + 4], eax
    jge L7
    mov ebx, eax
L6:
    inc edx
    cmp dword ptr [edi + edx*4], ebx
    jl L6
L7:
    dec edx
    mov dword ptr [ecx + 16], edx
    sub eax, dword ptr [edi + edx*4]
    mov edi, 000015180h
    mov dword ptr [ecx + 12], eax
    mov eax, dword ptr [esp + 16]
    mov eax, dword ptr [eax]
    cdq
    idiv edi
    push 7
    pop edi
    push 60
    add eax, 4
    cdq
    idiv edi
    mov eax, esi
    mov edi, 000000E10h
    mov dword ptr [ecx + 24], edx
    cdq
    idiv edi
    pop edi
    mov dword ptr [ecx + 8], eax
    imul eax, eax, 0FFFFF1F0h
    add esi, eax
    mov eax, esi
    cdq
    idiv edi
    mov dword ptr [ecx + 4], eax
    imul eax, eax, 60
    sub esi, eax
    and dword ptr [ecx + 32], 0
    mov dword ptr [ecx], esi
    mov eax, ecx
L8:
    pop edi
    pop esi
    pop ebx
    ret
_gmtime ENDP
END
