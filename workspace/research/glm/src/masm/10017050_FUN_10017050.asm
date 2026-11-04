.686
.MODEL FLAT, C
.CODE
FUN_10017050 PROC
    mov cl, byte ptr [ebx]
    push ebp
    mov ebp, dword ptr [esp + 8]
    push esi
    xor edx, edx
    test cl, cl
    push edi
    mov eax, 119
    je L1
L0:
    movsx ecx, cl
    imul ecx, eax
    add edx, ecx
    mov cl, byte ptr [ebx + eax - 118]
    inc eax
    test cl, cl
    jne L0
L1:
    and edx, 0000003FFh
    mov word ptr [ebp], dx
    movzx edx, dx
    mov eax, dword ptr [edx*4 + 0101D4D28h]
    test eax, eax
    je L7
    lea ecx, [ecx]
L2:
    mov di, word ptr [ebp]
    movzx eax, di
    mov ecx, dword ptr [eax*4 + 0101D4D28h]
    mov eax, dword ptr [ecx]
    mov esi, ebx
L3:
    mov dl, byte ptr [eax]
    mov cl, dl
    cmp dl, byte ptr [esi]
    jne L5
    test cl, cl
    je L4
    mov dl, byte ptr [eax + 1]
    mov cl, dl
    cmp dl, byte ptr [esi + 1]
    jne L5
    add eax, 2
    add esi, 2
    test cl, cl
    jne L3
L4:
    xor eax, eax
    jmp L6
L5:
    sbb eax, eax
    sbb eax, -1
L6:
    test eax, eax
    je L8
    inc edi
    and edi, 0000003FFh
    movzx eax, di
    mov word ptr [ebp], di
    mov ecx, dword ptr [eax*4 + 0101D4D28h]
    test ecx, ecx
    jne L2
L7:
    mov edx, dword ptr [esp + 20]
    pop edi
    pop esi
    mov byte ptr [edx], 0
    pop ebp
    ret
L8:
    mov ecx, dword ptr [esp + 20]
    pop edi
    pop esi
    mov byte ptr [ecx], 1
    pop ebp
    ret
FUN_10017050 ENDP
END
