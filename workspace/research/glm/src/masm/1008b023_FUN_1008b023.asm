.686
.MODEL FLAT, C
EXTRN sub_100F78C6:PROC
EXTRN sub_100F78E4:PROC
EXTRN sub_100F78FB:PROC
.CODE
FUN_1008b023 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    mov edx, dword ptr [eax + 4]
    push ebx
    push esi
    mov esi, dword ptr [ecx + 16]
    mov esi, dword ptr [esi + edx*4]
    mov edx, dword ptr [eax + 56]
    cmp edx, -1
    push edi
    jne L0
    mov ebx, eax
    jmp L1
L0:
    mov eax, dword ptr [ecx + 20]
    mov ebx, dword ptr [eax + edx*4]
L1:
    mov eax, dword ptr [esi]
    cmp byte ptr [eax], 0
    je L2
    cmp byte ptr [eax + 1], 0
    jne L2
    push eax
    push 010193358h
    jmp L3
L2:
    push eax
    push 01011045Ch
L3:
    mov edi, dword ptr [ebp + 16]
    mov esi, dword ptr [ebp + 12]
    push edi
    push esi
    call sub_100F78C6
    mov ecx, dword ptr [ebx + 12]
    add esp, 16
    cmp ecx, -1
    je L4
    push ecx
    mov ecx, edi
    sub ecx, eax
    push 010110458h
    push ecx
    add eax, esi
    push eax
    call sub_100F78E4
    add esp, 16
    jmp L5
L4:
    mov ecx, edi
    sub ecx, eax
    push 010110454h
    push ecx
    add eax, esi
    push eax
    call sub_100F78FB
    add esp, 12
L5:
    mov byte ptr [esi + edi - 1], 0
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 12
FUN_1008b023 ENDP
END
