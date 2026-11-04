.686
.MODEL FLAT, C
EXTRN sub_100B3FAD:PROC
.CODE
FUN_100b50b6 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 36
    mov eax, dword ptr [ebp + 8]
    push ebx
    mov ebx, dword ptr [eax]
    and ebx, 0000FFFFFh
    mov dword ptr [ebp - 16], ecx
    jne L0
    xor eax, eax
    inc eax
    jmp L9
L0:
    mov eax, dword ptr [eax + 4]
    xor edx, edx
    div ebx
    and dword ptr [ebp - 12], 0
    push esi
    push edi
    test eax, eax
    mov dword ptr [ebp - 20], eax
    jbe L7
    mov esi, dword ptr [ecx + 108]
    shl esi, 30
    sar esi, 31
    and dword ptr [ebp - 8], 0
L1:
    or eax, 0FFFFFFFFh
    lea edi, [ebp - 36]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    xor ecx, ecx
    test ebx, ebx
    stosd dword ptr es:[edi], eax
    jbe L3
    mov eax, dword ptr [ebp - 16]
    mov edx, dword ptr [eax + 20]
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + 8]
    add eax, dword ptr [ebp - 8]
L2:
    mov edi, dword ptr [eax]
    mov edi, dword ptr [edx + edi*4]
    mov edi, dword ptr [edi + 16]
    mov dword ptr [ebp + ecx*4 - 36], edi
    inc ecx
    add eax, 4
    cmp ecx, ebx
    jb L2
L3:
    test esi, esi
    je L6
    xor edi, edi
    mov dword ptr [ebp - 4], 0101A4218h
L4:
    push dword ptr [ebp - 4]
    mov ecx, dword ptr [ebp - 16]
    lea eax, [ebp - 36]
    push eax
    call sub_100B3FAD
    test eax, eax
    jne L5
    add dword ptr [ebp - 4], 16
    inc edi
    cmp edi, 8
    jb L4
L5:
    cmp edi, 8
    je L10
L6:
    inc dword ptr [ebp - 12]
    mov eax, ebx
    shl eax, 2
    add dword ptr [ebp - 8], eax
    mov eax, dword ptr [ebp - 12]
    cmp eax, dword ptr [ebp - 20]
    jb L1
L7:
    xor eax, eax
L8:
    pop edi
    pop esi
L9:
    pop ebx
    leave
    ret 4
L10:
    xor eax, eax
    inc eax
    jmp L8
FUN_100b50b6 ENDP
END
