.686
.MODEL FLAT, C
EXTRN sub_100F5F24:PROC
EXTRN sub_100F7665:PROC
EXTRN sub_100F76A4:PROC
EXTRN sub_100F8614:PROC
EXTRN sub_100F8637:PROC
EXTRN sub_100F864E:PROC
EXTRN sub_100F8673:PROC
EXTRN sub_100F8692:PROC
EXTRN sub_100F86BD:PROC
EXTRN sub_100F86CF:PROC
EXTRN sub_100F8702:PROC
EXTRN sub_100F8715:PROC
EXTRN sub_100F8982:PROC
.CODE
FUN_100677e4 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    and dword ptr [ebp - 4], 0
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push esi
    push edi
    mov edi, ecx
    cmp ebx, dword ptr [edi + 4]
    jae L0
    movsx eax, byte ptr [ebx]
    push eax
    call sub_100F8614
    test eax, eax
    pop ecx
    jne L2
L0:
    lea eax, [ebx + 1]
    cmp eax, dword ptr [edi + 4]
    jae L17
    cmp byte ptr [ebx], 46
    jne L17
    movsx eax, byte ptr [eax]
    push eax
    call sub_100F8637
    test eax, eax
    pop ecx
    je L17
    add ebx, 2
    jmp L7
L1:
    movsx eax, byte ptr [ebx]
    push eax
    call sub_100F864E
    test eax, eax
    pop ecx
    je L3
L2:
    inc ebx
    cmp ebx, dword ptr [edi + 4]
    jb L1
L3:
    mov eax, dword ptr [edi + 4]
    cmp ebx, eax
    jae L5
    cmp byte ptr [ebx], 46
    jne L5
    inc ebx
    cmp ebx, eax
    jae L8
L4:
    movsx eax, byte ptr [ebx]
    push eax
    call sub_100F8673
    test eax, eax
    pop ecx
    je L8
    inc ebx
    cmp ebx, dword ptr [edi + 4]
    jb L4
    jmp L8
L5:
    mov dword ptr [ebp - 4], 1
    jmp L8
L6:
    movsx eax, byte ptr [ebx]
    push eax
    call sub_100F8692
    test eax, eax
    pop ecx
    je L8
    inc ebx
L7:
    cmp ebx, dword ptr [edi + 4]
    jb L6
L8:
    lea esi, [ebx + 1]
    cmp esi, dword ptr [edi + 4]
    jae L11
    movsx eax, byte ptr [ebx]
    push eax
    call sub_100F7665
    cmp eax, 101
    pop ecx
    jne L11
    movsx eax, byte ptr [esi]
    push eax
    call sub_100F86BD
    test eax, eax
    pop ecx
    je L11
    inc ebx
    inc ebx
    jmp L10
L9:
    movsx eax, byte ptr [ebx]
    push eax
    call sub_100F86CF
    test eax, eax
    pop ecx
    je L15
    inc ebx
L10:
    cmp ebx, dword ptr [edi + 4]
    jb L9
    jmp L15
L11:
    lea eax, [ebx + 2]
    cmp eax, dword ptr [edi + 4]
    jae L14
    movsx eax, byte ptr [ebx]
    push eax
    call sub_100F76A4
    cmp eax, 101
    pop ecx
    jne L14
    cmp byte ptr [esi], 45
    jne L14
    movsx eax, byte ptr [ebx + 2]
    push eax
    call sub_100F8702
    test eax, eax
    pop ecx
    je L14
    add ebx, 3
    jmp L13
L12:
    movsx eax, byte ptr [ebx]
    push eax
    call sub_100F8715
    test eax, eax
    pop ecx
    je L15
    inc ebx
L13:
    cmp ebx, dword ptr [edi + 4]
    jb L12
    jmp L15
L14:
    cmp dword ptr [ebp - 4], 0
    jne L17
L15:
    cmp dword ptr [ebp + 12], 0
    je L16
    mov esi, dword ptr [ebp + 8]
    mov edi, ebx
    sub edi, esi
    lea eax, [edi + 1]
    add eax, 3
    and eax, 0FFFFFFFCh
    mov dword ptr [ebp - 4], edi
    call sub_100F8982
    mov ecx, edi
    mov edx, ecx
    mov eax, esp
    shr ecx, 2
    mov edi, eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, edx
    push eax
    mov byte ptr [eax + ecx], 0
    call sub_100F5F24
    mov eax, dword ptr [ebp + 12]
    pop ecx
    fstp qword ptr [eax]
L16:
    mov eax, ebx
    sub eax, dword ptr [ebp + 8]
    jmp L18
L17:
    xor eax, eax
L18:
    lea esp, [ebp - 16]
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
FUN_100677e4 ENDP
END
