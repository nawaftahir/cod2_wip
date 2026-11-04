.686
.MODEL FLAT, C
EXTRN sub_1006507F:PROC
EXTRN sub_1008515E:PROC
.CODE
FUN_10085251 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    push 96
    mov ebx, ecx
    call sub_1006507F
    test eax, eax
    je L0
    mov ecx, eax
    call sub_1008515E
    mov dword ptr [ebp - 4], eax
    jmp L1
L0:
    and dword ptr [ebp - 4], 0
    mov eax, dword ptr [ebp - 4]
L1:
    test eax, eax
    je L8
    push esi
    push edi
    push 8
    lea esi, [ebx + 16]
    lea edi, [eax + 16]
    pop ecx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, dword ptr [ebx + 48]
    mov dword ptr [eax + 48], ecx
    mov ecx, dword ptr [ebx + 52]
    mov dword ptr [eax + 52], ecx
    mov ecx, dword ptr [ebx + 56]
    mov dword ptr [eax + 56], ecx
    mov ecx, dword ptr [ebx + 84]
    mov dword ptr [eax + 84], ecx
    mov ecx, dword ptr [ebx + 88]
    xor esi, esi
    mov dword ptr [eax + 88], ecx
    cmp dword ptr [ebx + 60], esi
    je L2
    mov ecx, dword ptr [ebx + 60]
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    cmp eax, esi
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [ecx + 60], eax
    je L6
    mov eax, ecx
L2:
    cmp dword ptr [ebx + 64], esi
    je L3
    mov ecx, dword ptr [ebx + 64]
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    cmp eax, esi
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [ecx + 64], eax
    je L6
    mov eax, ecx
L3:
    mov edi, eax
    mov dword ptr [ebp - 8], esi
    lea esi, [ebx + 68]
    sub edi, ebx
L4:
    cmp dword ptr [esi], 0
    je L5
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    test eax, eax
    mov dword ptr [edi + esi], eax
    je L6
    mov eax, dword ptr [ebp - 4]
L5:
    inc dword ptr [ebp - 8]
    add esi, 4
    cmp dword ptr [ebp - 8], 4
    jb L4
    jmp L7
L6:
    xor eax, eax
L7:
    pop edi
    pop esi
L8:
    pop ebx
    leave
    ret
FUN_10085251 ENDP
END
