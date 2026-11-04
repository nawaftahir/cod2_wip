.686
.MODEL FLAT, C
EXTRN sub_1006797D:PROC
EXTRN sub_1006798C:PROC
EXTRN sub_10067994:PROC
EXTRN sub_10067997:PROC
EXTRN sub_1006799A:PROC
EXTRN sub_1006799C:PROC
EXTRN sub_1006799D:PROC
EXTRN sub_100679AF:PROC
EXTRN sub_100679F8:PROC
EXTRN sub_10067A00:PROC
EXTRN sub_10067A02:PROC
EXTRN sub_10067A11:PROC
EXTRN sub_10067A16:PROC
EXTRN sub_10067A23:PROC
EXTRN sub_10067A25:PROC
EXTRN sub_10067A28:PROC
EXTRN sub_10067A3E:PROC
EXTRN sub_10067A46:PROC
EXTRN sub_10067A96:PROC
EXTRN sub_10067A97:PROC
EXTRN sub_10067AE4:PROC
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
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    and and dword ptr [ebp - 4], 0
    push push ebx
    mov mov ebx, dword ptr [ebp + 8]
    push push esi
    push push edi
    mov mov edi, ecx
    cmp cmp ebx, dword ptr [edi + 4]
    jae L0
    movsx movsx eax, byte ptr [ebx]
    push push eax
    call sub_100F8614
    test test eax, eax
    pop pop ecx
    jne L1
    lea lea eax, [ebx + 1]
    cmp cmp eax, dword ptr [edi + 4]
    jae sub_10067994
    cmp cmp byte ptr [ebx], 46
    jne sub_1006799D
    movsx movsx eax, byte ptr [eax]
    push push eax
    call sub_100F8637
    test test eax, eax
    pop pop ecx
    je sub_100679AF
    add add ebx, 2
    jmp L4
    movsx movsx eax, byte ptr [ebx]
    push push eax
    call sub_100F864E
    test test eax, eax
    pop pop ecx
    je L3
    inc inc ebx
    cmp cmp ebx, dword ptr [edi + 4]
    jb L2
    mov mov eax, dword ptr [edi + 4]
    cmp cmp ebx, eax
    jae L5
    cmp cmp byte ptr [ebx], 46
    jne L6
    inc inc ebx
    cmp cmp ebx, eax
    jae L8
    movsx movsx eax, byte ptr [ebx]
    push push eax
    call sub_100F8673
    test test eax, eax
    pop pop ecx
    je L9
L1:
    inc inc ebx
    cmp cmp ebx, dword ptr [edi + 4]
    jb L7
    jmp L10
    mov mov dword ptr [ebp - 4], 1
    jmp L11
    movsx movsx eax, byte ptr [ebx]
    push push eax
    call sub_100F8692
    test test eax, eax
    pop pop ecx
    je L12
    inc inc ebx
    cmp cmp ebx, dword ptr [edi + 4]
    jb L11
    lea lea esi, [ebx + 1]
    cmp cmp esi, dword ptr [edi + 4]
    jae sub_1006797D
    movsx movsx eax, byte ptr [ebx]
    push push eax
    call sub_100F7665
    cmp cmp eax, 101
    pop pop ecx
    jne sub_1006798C
    movsx movsx eax, byte ptr [esi]
    push push eax
L3:
    call sub_100F86BD
    test test eax, eax
    pop pop ecx
    je sub_1006799A
    inc inc ebx
    inc inc ebx
    jmp sub_10067997
    movsx movsx eax, byte ptr [ebx]
    push push eax
    call sub_100F86CF
    test test eax, eax
    pop pop ecx
    je sub_100679F8
    inc inc ebx
    cmp cmp ebx, dword ptr [edi + 4]
    jb sub_1006799C
    jmp sub_10067A00
    lea lea eax, [ebx + 2]
    cmp cmp eax, dword ptr [edi + 4]
    jae sub_10067A02
    movsx movsx eax, byte ptr [ebx]
    push push eax
    call sub_100F76A4
    cmp cmp eax, 101
    pop pop ecx
L6:
    jne sub_10067A11
    cmp cmp byte ptr [esi], 45
    jne sub_10067A16
    movsx movsx eax, byte ptr [ebx + 2]
    push push eax
    call sub_100F8702
    test test eax, eax
    pop pop ecx
    je sub_10067A25
    add add ebx, 3
    jmp sub_10067A23
    movsx movsx eax, byte ptr [ebx]
    push push eax
    call sub_100F8715
    test test eax, eax
    pop pop ecx
    je sub_10067A3E
    inc inc ebx
    cmp cmp ebx, dword ptr [edi + 4]
    jb sub_10067A28
    jmp sub_10067A46
    cmp cmp dword ptr [ebp - 4], 0
    jne sub_10067A97
    cmp cmp dword ptr [ebp + 12], 0
    je sub_10067A96
    mov mov esi, dword ptr [ebp + 8]
    mov mov edi, ebx
    sub sub edi, esi
    lea lea eax, [edi + 1]
    add add eax, 3
    and and eax, -4
    mov mov dword ptr [ebp - 4], edi
    call sub_100F8982
    mov mov ecx, edi
    mov mov edx, ecx
    mov mov eax, esp
    shr shr ecx, 2
    mov mov edi, eax
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, edx
    push push eax
    mov mov byte ptr [eax + ecx], 0
    call sub_100F5F24
    mov mov eax, dword ptr [ebp + 12]
    pop pop ecx
    fstp fstp qword ptr [eax]
    mov mov eax, ebx
    sub sub eax, dword ptr [ebp + 8]
    jmp sub_10067AE4
    xor xor eax, eax
    lea lea esp, [ebp - 16]
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
FUN_100677e4 ENDP
END
