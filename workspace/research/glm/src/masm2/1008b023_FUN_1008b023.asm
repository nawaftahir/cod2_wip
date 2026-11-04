.686
.MODEL FLAT, C
EXTRN sub_1008B0ED:PROC
EXTRN sub_1008B11A:PROC
EXTRN sub_100F78C6:PROC
EXTRN sub_100F78E4:PROC
EXTRN sub_100F78FB:PROC
.CODE
FUN_1008b023 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov eax, dword ptr [ebp + 8]
    mov mov edx, dword ptr [eax + 4]
    push push ebx
    push push esi
    mov mov esi, dword ptr [ecx + 16]
    mov mov esi, dword ptr [esi + edx*4]
    mov mov edx, dword ptr [eax + 56]
    cmp cmp edx, -1
    push push edi
    jne L0
    mov mov ebx, eax
    jmp L1
    mov mov eax, dword ptr [ecx + 20]
    mov mov ebx, dword ptr [eax + edx*4]
    mov mov eax, dword ptr [esi]
    cmp cmp byte ptr [eax], 0
    je L2
    cmp cmp byte ptr [eax + 1], 0
    jne L3
    push push eax
    push push 010193358h
    jmp L4
    push push eax
L0:
    push push 01011045Ch
    mov mov edi, dword ptr [ebp + 16]
    mov mov esi, dword ptr [ebp + 12]
    push push edi
    push push esi
    call sub_100F78C6
    mov mov ecx, dword ptr [ebx + 12]
    add add esp, 16
    cmp cmp ecx, -1
    je sub_1008B0ED
    push push ecx
    mov mov ecx, edi
    sub sub ecx, eax
    push push 010110458h
    push push ecx
    add add eax, esi
    push push eax
    call sub_100F78E4
    add add esp, 16
    jmp sub_1008B11A
    mov mov ecx, edi
    sub sub ecx, eax
    push push 010110454h
    push push ecx
    add add eax, esi
    push push eax
    call sub_100F78FB
    add add esp, 12
    mov mov byte ptr [esi + edi - 1], 0
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret 12
FUN_1008b023 ENDP
END
