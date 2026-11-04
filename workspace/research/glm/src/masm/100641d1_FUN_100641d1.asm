.686
.MODEL FLAT, C
EXTRN sub_100677A5:PROC
EXTRN sub_10067D0F:PROC
.CODE
FUN_100641d1 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000104h
    push esi
    push edi
    mov edi, ecx
    mov ecx, dword ptr [edi + 00000026Ch]
    mov esi, dword ptr [ecx]
    call sub_100677A5
    cmp dword ptr [edi + 80], 0
    je L10
    jmp L2
L0:
    mov al, byte ptr [esi]
    cmp al, 32
    je L1
    cmp al, 9
    jne L3
L1:
    inc esi
L2:
    mov eax, dword ptr [edi + 00000026Ch]
    cmp esi, dword ptr [eax]
    jb L0
L3:
    and dword ptr [ebp - 4], 0
    lea edx, [esi + 2]
    lea eax, [esi + 1]
    push ebx
L4:
    mov ecx, dword ptr [edi + 00000026Ch]
    mov ebx, dword ptr [ecx]
    cmp esi, ebx
    jae L9
    mov cl, byte ptr [esi]
    cmp cl, 92
    jne L6
    cmp eax, ebx
    jae L5
    cmp byte ptr [eax], 10
    jne L5
    inc esi
    inc esi
    inc eax
    inc eax
    inc edx
    inc edx
    jmp L8
L5:
    cmp cl, 92
    jne L6
    cmp edx, ebx
    jae L6
    cmp byte ptr [eax], 13
    jne L6
    cmp byte ptr [edx], 10
    jne L6
    add esi, 3
    add eax, 3
    add edx, 3
    jmp L8
L6:
    cmp cl, 13
    je L7
    mov ebx, dword ptr [ebp - 4]
    inc dword ptr [ebp - 4]
    mov byte ptr [ebp + ebx - 000000104h], cl
L7:
    inc esi
    inc eax
    inc edx
L8:
    cmp dword ptr [ebp - 4], 0000000FFh
    jb L4
L9:
    mov eax, dword ptr [ebp - 4]
    mov byte ptr [ebp + eax - 000000104h], 0
    lea eax, [ebp - 000000104h]
    push eax
    push 01010C660h
    push 0
    lea eax, [edi + 000000278h]
    push eax
    lea eax, [edi + 24]
    push eax
    call sub_10067D0F
    add esp, 20
    xor eax, eax
    inc eax
    mov dword ptr [edi + 72], eax
    mov dword ptr [edi + 68], eax
    pop ebx
L10:
    pop edi
    xor eax, eax
    pop esi
    leave
    ret
FUN_100641d1 ENDP
END
