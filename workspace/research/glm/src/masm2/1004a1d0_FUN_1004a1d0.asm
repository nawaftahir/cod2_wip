.686
.MODEL FLAT, C
EXTRN sub_10049FF4:PROC
EXTRN sub_1004A2AF:PROC
.CODE
FUN_1004a1d0 PROC
    push push esi
    mov mov esi, eax
    mov mov eax, dword ptr [esi + 20]
    push push edi
    add add eax, 0FFFFFF38h
    xor xor edi, edi
    cmp cmp eax, 10
    ja L0
    movzx movzx eax, byte ptr [eax + 01004A27Ch]
    jmp jmp dword ptr [eax*4 + 01004A268h]
    mov mov ecx, dword ptr [esi + 0198h]
    push push esi
    call call dword ptr [ecx + 4]
    mov mov edx, dword ptr [esi + 32]
    push push esi
    call call dword ptr [edx + 8]
    add add esp, 8
    mov mov dword ptr [esi + 20], 0C9h
    mov mov eax, dword ptr [esi + 0198h]
    push push esi
    call call dword ptr [eax]
    mov mov edi, eax
    add add esp, 4
    cmp cmp edi, 1
    jne sub_1004A2AF
    call sub_10049FF4
    mov mov eax, edi
    pop pop edi
    mov mov dword ptr [esi + 20], 0CAh
    pop pop esi
    ret ret
    pop pop edi
    mov mov eax, 1
    pop pop esi
    ret ret
    mov mov ecx, dword ptr [esi + 0198h]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    pop pop edi
    pop pop esi
    ret ret
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], 20
    mov mov eax, dword ptr [esi]
    mov mov ecx, dword ptr [esi + 20]
    mov mov dword ptr [eax + 24], ecx
    mov mov edx, dword ptr [esi]
L0:
    push push esi
    call call dword ptr [edx]
    add add esp, 4
    mov mov eax, edi
    pop pop edi
    pop pop esi
    ret ret
FUN_1004a1d0 ENDP
END
