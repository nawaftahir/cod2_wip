.686
.MODEL FLAT, C
EXTRN sub_10055DD5:PROC
.CODE
FUN_10055c10 PROC
    sub esp, 24
    push esi
    push edi
    mov edi, dword ptr [esp + 36]
    cmp dword ptr [edi + 84], 1
    mov esi, dword ptr [edi + 0000001B0h]
    mov dword ptr [esp + 24], esi
    jne L0
    mov dword ptr [esp + 8], 0000001FEh
    mov byte ptr [esi + 28], 1
    jmp L1
L0:
    mov dword ptr [esp + 8], 0
    mov byte ptr [esi + 28], 0
L1:
    mov ecx, dword ptr [edi + 108]
    mov edx, dword ptr [esp + 8]
    mov eax, dword ptr [edi + 4]
    push ecx
    add edx, 000000100h
    push edx
    push 1
    push edi
    call dword ptr [eax + 8]
    mov dword ptr [esi + 24], eax
    mov edx, dword ptr [edi + 108]
    mov eax, dword ptr [esi + 20]
    xor ecx, ecx
    add esp, 16
    test edx, edx
    mov dword ptr [esp + 12], ecx
    jle sub_10055DD5
    push ebx
    lea edx, [esi + 32]
    push ebp
    mov dword ptr [esp + 24], edx
    jmp L2
    mov eax, dword ptr [esp + 28]
    mov ecx, dword ptr [esp + 20]
    mov esi, dword ptr [esp + 32]
    lea esp, [esp]
L2:
    mov edx, dword ptr [esp + 24]
    mov edi, dword ptr [edx]
    cdq
    idiv edi
    mov dword ptr [esp + 28], eax
    mov eax, dword ptr [esp + 16]
    test eax, eax
    je L3
    mov eax, dword ptr [esi + 24]
    mov edx, dword ptr [eax + ecx*4]
    lea eax, [eax + ecx*4]
    add edx, 0000000FFh
    mov dword ptr [eax], edx
L3:
    mov edx, dword ptr [esi + 24]
    mov ebp, dword ptr [edx + ecx*4]
    lea eax, [edi + 0000000FEh]
    cdq
    lea ecx, [edi + edi - 2]
    idiv ecx
    xor ebx, ebx
    mov dword ptr [esp + 36], ebp
    xor esi, esi
    mov edx, eax
L4:
    cmp esi, edx
    jle L6
    mov ecx, ebx
    lea ebp, [edi + edi - 2]
    imul ecx, ecx, 0000001FEh
    jmp L5
    lea esp, [esp]
    lea esp, [esp]
L5:
    add ecx, 0000001FEh
    lea eax, [ecx + edi + 0000000FEh]
    cdq
    idiv ebp
    inc ebx
    mov edx, eax
    cmp esi, edx
    jg L5
    mov ebp, dword ptr [esp + 36]
L6:
    mov al, bl
    imul byte ptr [esp + 28]
    mov byte ptr [esi + ebp], al
    inc esi
    cmp esi, 0000000FFh
    jle L4
    mov eax, dword ptr [esp + 16]
    test eax, eax
    je L8
    mov eax, 1
    lea ecx, [ebp - 1]
    lea ecx, [ecx]
L7:
    mov dl, byte ptr [ebp]
    mov byte ptr [ecx], dl
    mov dl, byte ptr [ebp + 0000000FFh]
    mov byte ptr [eax + ebp + 0000000FFh], dl
    inc eax
    dec ecx
    cmp eax, 0000000FFh
    jle L7
L8:
    mov eax, dword ptr [esp + 20]
    mov esi, dword ptr [esp + 24]
    mov ecx, dword ptr [esp + 44]
    mov edx, dword ptr [ecx + 108]
    inc eax
    add esi, 4
    cmp eax, edx
    mov dword ptr [esp + 20], eax
    mov dword ptr [esp + 24], esi
FUN_10055c10 ENDP
END
