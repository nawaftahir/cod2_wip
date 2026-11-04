.686
.MODEL FLAT, C
EXTRN sub_100FB124:PROC
EXTRN sub_100FC48E:PROC
EXTRN sub_100FCC3C:PROC
EXTRN sub_100FCC55:PROC
EXTRN sub_100FCC78:PROC
EXTRN sub_100FCC7A:PROC
.CODE
_gmtime PROC
    mov mov eax, dword ptr [esp + 4]
    push push ebx
    push push esi
    mov mov esi, dword ptr [eax]
    push push edi
    xor xor ebx, ebx
    call sub_100FB124
    test test esi, esi
    mov mov edi, eax
    jge L0
    xor xor eax, eax
    jmp sub_100FCC3C
    cmp cmp dword ptr [edi + 68], 0
    jne L1
    push push 36
    call sub_100FC48E
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [edi + 68], eax
    mov mov ecx, 0101ADFE0h
    je L2
    mov mov ecx, dword ptr [edi + 68]
    mov mov eax, esi
    cdq cdq
    mov mov edi, 07861F80h
    idiv idiv edi
    mov mov edx, eax
    imul imul edx, edx, 0F879E080h
    add add esi, edx
    lea lea edx, [eax*4 + 70]
    mov mov eax, 01E13380h
L1:
    cmp cmp esi, eax
    jl L3
    sub sub esi, eax
    inc inc edx
    cmp cmp esi, eax
    jl L4
    sub sub esi, eax
    mov mov eax, 01E28500h
    inc inc edx
    cmp cmp esi, eax
    jl L5
L2:
    inc inc edx
    sub sub esi, eax
    jmp L6
    xor xor ebx, ebx
    inc inc ebx
    mov mov eax, esi
    mov mov dword ptr [ecx + 20], edx
    cdq cdq
    mov mov edi, 015180h
    idiv idiv edi
    mov mov edi, 0101A55BCh
    mov mov dword ptr [ecx + 28], eax
    imul imul eax, eax, 0FFFEAE80h
    add add esi, eax
    test test ebx, ebx
    jne sub_100FCC55
    mov mov edi, 0101A55F0h
    mov mov eax, dword ptr [ecx + 28]
    xor xor edx, edx
    inc inc edx
    cmp cmp dword ptr [edi + 4], eax
    jge sub_100FCC78
    mov mov ebx, eax
    inc inc edx
    cmp cmp dword ptr [edi + edx*4], ebx
    jl sub_100FCC7A
    dec dec edx
    mov mov dword ptr [ecx + 16], edx
    sub sub eax, dword ptr [edi + edx*4]
    mov mov edi, 015180h
    mov mov dword ptr [ecx + 12], eax
    mov mov eax, dword ptr [esp + 16]
    mov mov eax, dword ptr [eax]
    cdq cdq
    idiv idiv edi
    push push 7
    pop pop edi
    push push 60
    add add eax, 4
    cdq cdq
    idiv idiv edi
    mov mov eax, esi
L3:
    mov mov edi, 0E10h
    mov mov dword ptr [ecx + 24], edx
    cdq cdq
    idiv idiv edi
    pop pop edi
    mov mov dword ptr [ecx + 8], eax
    imul imul eax, eax, 0FFFFF1F0h
    add add esi, eax
    mov mov eax, esi
    cdq cdq
    idiv idiv edi
    mov mov dword ptr [ecx + 4], eax
    imul imul eax, eax, 60
    sub sub esi, eax
    and and dword ptr [ecx + 32], 0
    mov mov dword ptr [ecx], esi
    mov mov eax, ecx
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
_gmtime ENDP
END
