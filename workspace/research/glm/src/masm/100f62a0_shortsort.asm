.686
.MODEL FLAT, C
EXTRN sub_100F631A:PROC
.CODE
shortsort PROC
    mov ecx, dword ptr [esp + 4]
    push ebp
    mov ebp, dword ptr [esp + 12]
    push edi
    mov edi, eax
    cmp edi, ecx
    jbe sub_100F631A
    push ebx
    push esi
L0:
    lea esi, [ecx + ebp]
    cmp esi, edi
    mov ebx, ecx
    ja L3
    jmp L1
    lea ecx, [ecx]
L1:
    push ebx
    push esi
    call dword ptr [esp + 0x24]
    add esp, 8
    test eax, eax
    jle L2
    mov ebx, esi
L2:
    add esi, ebp
    cmp esi, edi
    jbe L1
    mov ecx, dword ptr [esp + 20]
L3:
    cmp ebx, edi
    mov eax, edi
    je L5
    test ebp, ebp
    je L5
    mov ecx, ebx
    sub ecx, edi
    mov esi, ebp
    lea esp, [esp]
L4:
    mov bl, byte ptr [eax]
    mov dl, byte ptr [ecx + eax]
    mov byte ptr [ecx + eax], bl
    mov byte ptr [eax], dl
    inc eax
    dec esi
    jne L4
    mov ecx, dword ptr [esp + 20]
L5:
    sub edi, ebp
    cmp edi, ecx
    ja L0
    pop esi
    pop ebx
shortsort ENDP
END
