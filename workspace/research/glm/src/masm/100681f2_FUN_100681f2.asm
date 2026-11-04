.686
.MODEL FLAT, C
EXTRN sub_10067CCF:PROC
EXTRN sub_100F8613:PROC
EXTRN sub_100F862E:PROC
.CODE
FUN_100681f2 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push edi
    mov edi, ecx
    cmp ebx, dword ptr [edi + 4]
    jae L6
    movsx eax, byte ptr [ebx]
    push eax
    call sub_100F8613
    test eax, eax
    pop ecx
    je L6
    push esi
    xor esi, esi
    mov eax, ebx
    cmp eax, dword ptr [edi + 4]
    mov dword ptr [ebp - 4], esi
    jae L3
L0:
    movsx eax, byte ptr [ebx]
    push eax
    call sub_100F862E
    test eax, eax
    pop ecx
    je L3
    cmp esi, 019999999h
    jbe L1
    mov dword ptr [ebp - 4], 1
L1:
    movsx ecx, byte ptr [ebx]
    lea eax, [esi + esi*4]
    shl eax, 1
    lea esi, [ecx + eax - 48]
    cmp esi, eax
    jae L2
    mov dword ptr [ebp - 4], 1
L2:
    inc ebx
    cmp ebx, dword ptr [edi + 4]
    jb L0
L3:
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    je L4
    mov dword ptr [eax], esi
L4:
    cmp dword ptr [ebp - 4], 0
    pop esi
    je L5
    push 01010CB58h
    push 0000003ECh
    lea eax, [edi + 8]
    push eax
    push dword ptr [edi + 48]
    call sub_10067CCF
    add esp, 16
L5:
    mov eax, ebx
    sub eax, dword ptr [ebp + 8]
    jmp L7
L6:
    xor eax, eax
L7:
    pop edi
    pop ebx
    leave
    ret 8
FUN_100681f2 ENDP
END
