.686
.MODEL FLAT, C
EXTRN sub_10082712:PROC
EXTRN sub_100F855C:PROC
EXTRN sub_100F8714:PROC
.CODE
FUN_1006796f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push esi
    mov esi, ecx
    cmp ebx, dword ptr [esi + 4]
    push edi
    jae L5
    movsx eax, byte ptr [ebx]
    push eax
    call sub_100F855C
    test eax, eax
    pop ecx
    jne L0
    cmp byte ptr [ebx], 95
    jne L5
L0:
    lea edi, [ebx + 1]
    jmp L3
L1:
    movsx eax, byte ptr [edi]
    push eax
    call sub_100F8714
    test eax, eax
    pop ecx
    jne L2
    cmp byte ptr [edi], 95
    jne L4
L2:
    inc edi
L3:
    cmp edi, dword ptr [esi + 4]
    jb L1
L4:
    mov ecx, dword ptr [esi + 44]
    sub edi, ebx
    mov ebx, edi
    push 1
    lea eax, [ebx + 1]
    push eax
    call sub_10082712
    test eax, eax
    je L5
    mov esi, dword ptr [ebp + 8]
    mov ecx, ebx
    mov edx, ecx
    shr ecx, 2
    mov edi, eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [ebp + 12]
    mov byte ptr [eax + ebx], 0
    mov dword ptr [ecx], eax
    mov eax, ebx
    jmp L6
L5:
    xor eax, eax
L6:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
FUN_1006796f ENDP
END
