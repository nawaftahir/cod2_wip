.686
.MODEL FLAT, C
EXTRN sub_100FC2AC:PROC
EXTRN sub_100FC2C0:PROC
EXTRN sub_100FC2DC:PROC
EXTRN sub_10106B3E:PROC
EXTRN fp_1010C054:DWORD
EXTRN fp_1010C0B4:DWORD
.CODE
__read_lk PROC
    push ebp
    mov ebp, esp
    sub esp, 12
    and dword ptr [ebp - 8], 0
    cmp dword ptr [ebp + 16], 0
    push ebx
    mov ebx, dword ptr [ebp + 12]
    push esi
    push edi
    mov edx, ebx
    je L20
    mov eax, dword ptr [ebp + 8]
    mov ecx, eax
    and eax, 31
    sar ecx, 5
    lea esi, [eax + eax*8]
    lea edi, [ecx*4 + 01076ACA0h]
    mov eax, dword ptr [edi]
    shl esi, 2
    add eax, esi
    mov cl, byte ptr [eax + 4]
    test cl, 2
    jne L20
    test cl, 72
    je L0
    cmp byte ptr [eax + 5], 10
    je L0
    mov eax, dword ptr [edi]
    mov al, byte ptr [eax + esi + 5]
    dec dword ptr [ebp + 16]
    mov byte ptr [ebx], al
    mov eax, dword ptr [edi]
    lea edx, [ebx + 1]
    mov dword ptr [ebp - 8], 1
    mov byte ptr [eax + esi + 5], 10
L0:
    push 0
    lea eax, [ebp - 12]
    push eax
    push dword ptr [ebp + 16]
    mov eax, dword ptr [edi]
    push edx
    push dword ptr [eax + esi]
    call dword ptr [fp_1010C0B4]
    test eax, eax
    jne L3
    call dword ptr [fp_1010C054]
    push 5
    pop esi
    cmp eax, esi
    jne L1
    call sub_100FC2AC
    mov dword ptr [eax], 9
    call sub_100FC2C0
    mov dword ptr [eax], esi
    jmp L2
L1:
    cmp eax, 109
    je L20
    push eax
    call sub_100FC2DC
    pop ecx
L2:
    or eax, 0FFFFFFFFh
    jmp L21
L3:
    mov eax, dword ptr [ebp - 12]
    mov ecx, dword ptr [edi]
    add dword ptr [ebp - 8], eax
    test byte ptr [ecx + esi + 4], 000000080h
    je L19
    test eax, eax
    je L4
    cmp byte ptr [ebx], 10
    jne L4
    mov eax, ecx
    lea eax, [eax + esi + 4]
    or byte ptr [eax], 4
    jmp L5
L4:
    mov eax, dword ptr [edi]
    lea eax, [eax + esi + 4]
    and byte ptr [eax], 0000000FBh
L5:
    mov eax, dword ptr [ebp + 12]
    mov ecx, dword ptr [ebp - 8]
    add ecx, eax
    cmp eax, ecx
    mov dword ptr [ebp + 16], eax
    mov dword ptr [ebp - 8], ecx
    jae L18
L6:
    mov eax, dword ptr [ebp + 16]
    mov al, byte ptr [eax]
    cmp al, 26
    je L17
    cmp al, 13
    je L7
    mov byte ptr [ebx], al
    inc ebx
    inc dword ptr [ebp + 16]
    jmp L16
L7:
    dec ecx
    cmp dword ptr [ebp + 16], ecx
    jae L9
    mov eax, dword ptr [ebp + 16]
    inc eax
    cmp byte ptr [eax], 10
    jne L8
    add dword ptr [ebp + 16], 2
    jmp L12
L8:
    mov dword ptr [ebp + 16], eax
    jmp L14
L9:
    inc dword ptr [ebp + 16]
    push 0
    lea eax, [ebp - 12]
    push eax
    push 1
    lea eax, [ebp - 1]
    push eax
    mov eax, dword ptr [edi]
    push dword ptr [eax + esi]
    call dword ptr [fp_1010C0B4]
    test eax, eax
    jne L10
    call dword ptr [fp_1010C054]
    test eax, eax
    jne L14
L10:
    cmp dword ptr [ebp - 12], 0
    je L14
    mov eax, dword ptr [edi]
    test byte ptr [eax + esi + 4], 72
    je L11
    mov al, byte ptr [ebp - 1]
    cmp al, 10
    je L12
    mov byte ptr [ebx], 13
    mov ecx, dword ptr [edi]
    mov byte ptr [ecx + esi + 5], al
    jmp L15
L11:
    cmp ebx, dword ptr [ebp + 12]
    jne L13
    cmp byte ptr [ebp - 1], 10
    jne L13
L12:
    mov byte ptr [ebx], 10
    jmp L15
L13:
    push 1
    push -1
    push dword ptr [ebp + 8]
    call sub_10106B3E
    add esp, 12
    cmp byte ptr [ebp - 1], 10
    je L16
L14:
    mov byte ptr [ebx], 13
L15:
    inc ebx
L16:
    mov ecx, dword ptr [ebp - 8]
    cmp dword ptr [ebp + 16], ecx
    jb L6
    jmp L18
L17:
    mov eax, dword ptr [edi]
    test byte ptr [eax + esi + 4], 64
    jne L18
    lea esi, [eax + esi + 4]
    or byte ptr [esi], 2
L18:
    sub ebx, dword ptr [ebp + 12]
    mov dword ptr [ebp - 8], ebx
L19:
    mov eax, dword ptr [ebp - 8]
    jmp L21
L20:
    xor eax, eax
L21:
    pop edi
    pop esi
    pop ebx
    leave
    ret
__read_lk ENDP
END
