.686
.MODEL FLAT, C
EXTRN sub_1008B070:PROC
EXTRN sub_100A5A55:PROC
EXTRN sub_100A5A97:PROC
EXTRN sub_100C513F:PROC
EXTRN sub_100F78F1:PROC
.CODE
FUN_100a59c7 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ebx
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    mov mov eax, dword ptr [edi + 4]
    mov mov esi, ecx
    cmp cmp eax, dword ptr [esi + 080h]
    je L0
    cmp cmp eax, dword ptr [esi + 084h]
    jne L1
    push push dword ptr [edi + 108]
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 84]
    push push eax
    push push 0101A3C68h
    mov mov ecx, esi
    call sub_100C513F
    mov mov ebx, eax
    cmp cmp dword ptr [ebx + 16], -1
    jne sub_100A5A55
    push push dword ptr [ebp + 16]
    mov mov ecx, esi
    push push dword ptr [ebp + 12]
    push push edi
    call sub_1008B070
    jmp sub_100A5A97
    push push dword ptr [edi + 108]
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 88]
    mov mov ecx, dword ptr [esi + 16]
    mov mov esi, dword ptr [ebp + 16]
L1:
    push push eax
    push push dword ptr [ebx]
    mov mov eax, dword ptr [edi + 4]
    mov mov eax, dword ptr [ecx + eax*4]
    push push dword ptr [eax]
    mov mov edi, dword ptr [ebp + 12]
    push push 010114770h
    push push esi
    push push edi
    call sub_100F78F1
    add add esp, 24
    mov mov byte ptr [edi + esi - 1], 0
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret 12
FUN_100a59c7 ENDP
END
