.686
.MODEL FLAT, C
EXTRN sub_1006C7AD:PROC
EXTRN sub_1006C8AE:PROC
EXTRN sub_1006E095:PROC
EXTRN sub_1006ECAF:PROC
EXTRN sub_10070E12:PROC
EXTRN sub_10070FC9:PROC
EXTRN sub_1007115E:PROC
EXTRN sub_100717C9:PROC
EXTRN sub_1007AA33:PROC
EXTRN sub_1007AA3C:PROC
EXTRN sub_1007AA59:PROC
EXTRN sub_1007AA6D:PROC
EXTRN sub_1007AA72:PROC
EXTRN sub_1007AA77:PROC
EXTRN sub_1007AA81:PROC
EXTRN sub_1007AA88:PROC
EXTRN sub_1007AA8D:PROC
EXTRN sub_1007AAB7:PROC
EXTRN sub_1007AABB:PROC
EXTRN sub_1007AABF:PROC
EXTRN sub_1007AAC9:PROC
EXTRN sub_1007AB0D:PROC
EXTRN sub_1007AB43:PROC
EXTRN sub_1007AB64:PROC
EXTRN sub_1007AB7D:PROC
EXTRN sub_1007ABA3:PROC
EXTRN sub_1007ABAB:PROC
EXTRN sub_1007ABC5:PROC
EXTRN sub_1007ABD2:PROC
EXTRN sub_1007ABE9:PROC
EXTRN sub_1007ABEE:PROC
EXTRN sub_1007ABFF:PROC
EXTRN sub_1007AC05:PROC
EXTRN sub_1007AC0C:PROC
EXTRN sub_1007AC12:PROC
EXTRN sub_1007AC1A:PROC
EXTRN sub_1007AC3D:PROC
EXTRN sub_1007AC58:PROC
EXTRN sub_1007AC60:PROC
EXTRN sub_1007AC8B:PROC
EXTRN sub_1007ACBB:PROC
EXTRN sub_1007ACC3:PROC
EXTRN sub_1007ACCB:PROC
EXTRN sub_1007ACD0:PROC
EXTRN sub_1007ACD6:PROC
EXTRN sub_1007AD45:PROC
EXTRN sub_1007AD48:PROC
EXTRN sub_1007AD4D:PROC
EXTRN sub_1007AD52:PROC
EXTRN sub_1007AD6B:PROC
EXTRN sub_1007AD77:PROC
EXTRN sub_1007AD7C:PROC
EXTRN sub_1007ADF0:PROC
EXTRN sub_1007AE10:PROC
EXTRN sub_1007B6D5:PROC
EXTRN sub_1007B85C:PROC
EXTRN sub_1007B88C:PROC
EXTRN sub_1008626A:PROC
.CODE
FUN_1007a632 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 28
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    push push edi
    xor xor edi, edi
    cmp cmp esi, edi
    mov mov ebx, ecx
    je L19
    cmp cmp dword ptr [ebx + 80], edi
    jne sub_1007AA33
    cmp cmp dword ptr [ebx + 84], edi
    jne sub_1007AA3C
    mov mov eax, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [eax + 12]
    mov mov eax, dword ptr [esi + 4]
    xor xor edx, edx
    inc inc edx
    cmp cmp eax, 6
    mov mov dword ptr [ebp - 28], ecx
    jne L9
    mov mov eax, dword ptr [esi + 16]
    cmp cmp eax, edx
    jne L3
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [eax + 16]
    mov mov dword ptr [ebp + 8], ecx
    mov mov ecx, dword ptr [eax + 20]
    mov mov dword ptr [ebp - 12], ecx
    mov mov ecx, dword ptr [eax + 24]
    cmp cmp ecx, edi
    jne L0
    test test byte ptr [eax + 28], 64
    mov mov dword ptr [ebp - 8], edx
    jne L1
    mov mov dword ptr [ebp - 8], edi
    cmp cmp ecx, edi
    je L2
    test test byte ptr [eax + 28], 2
    mov mov dword ptr [ebp - 16], edx
    jne L4
    mov mov dword ptr [ebp - 16], edi
    mov mov ecx, dword ptr [eax + 28]
    mov mov edi, dword ptr [eax + 32]
    mov mov edx, ecx
    mov mov dword ptr [ebp - 20], edi
    mov mov edi, dword ptr [eax + 48]
    and and edx, 080h
    and and ecx, 0FFFFF3FFh
    mov mov dword ptr [ebp - 24], edi
    mov mov edi, dword ptr [ebp + 8]
    mov mov dword ptr [eax + 28], ecx
    jmp L6
    cmp cmp eax, 2
    jne sub_1007AABB
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [eax + 20]
    mov mov edi, dword ptr [eax + 16]
    mov mov dword ptr [ebp - 12], ecx
    mov mov ecx, dword ptr [eax + 32]
    xor xor edx, edx
    and and byte ptr [eax + 25], 0F3h
    mov mov dword ptr [ebp - 20], ecx
    mov mov ecx, dword ptr [eax + 52]
    mov mov dword ptr [ebp - 8], edx
    mov mov dword ptr [ebp - 16], edx
    mov mov dword ptr [ebp - 24], ecx
    xor xor eax, eax
    cmp cmp edx, eax
    je L7
    push push eax
    mov mov eax, dword ptr [ebx + 24]
    lea lea eax, [eax + edi*4]
    push push eax
    mov mov eax, dword ptr [esi + 24]
    push push dword ptr [eax + 40]
    mov mov ecx, ebx
    call sub_1007B6D5
    jmp sub_1007AA81
    cmp cmp dword ptr [ebp - 12], eax
    mov mov dword ptr [ebp + 8], eax
    jbe L12
L4:
    mov mov ecx, edi
    shl shl ecx, 2
    mov mov dword ptr [ebp - 4], ecx
    cmp cmp dword ptr [ebp - 16], eax
    je L8
    mov mov ecx, dword ptr [ebx + 24]
    mov mov edx, dword ptr [ebp - 4]
    cmp cmp dword ptr [edx + ecx], -1
    jne L14
    cmp cmp dword ptr [ebp - 8], eax
    mov mov ecx, dword ptr [ebx + 8]
    je L10
    mov mov eax, dword ptr [ecx + 124]
    jmp L11
    mov mov eax, dword ptr [ecx + 116]
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push 0
    push push 0
    push push eax
    call sub_1008626A
    mov mov ecx, dword ptr [ebx + 8]
    cmp cmp eax, dword ptr [ecx + 8]
    jae L15
    mov mov ecx, dword ptr [ecx + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    jmp L16
    xor xor ecx, ecx
    test test ecx, ecx
    je L17
    mov mov edx, dword ptr [ebp + 8]
    add add edx, edi
    mov mov dword ptr [ecx + 48], edx
    mov mov edx, dword ptr [ebp + 8]
    mov mov dword ptr [ecx + 96], esi
    mov mov dword ptr [ecx + 100], edx
    mov mov ecx, dword ptr [ebx + 24]
    mov mov edx, dword ptr [ebp - 4]
    mov mov dword ptr [edx + ecx], eax
    xor xor eax, eax
    inc inc dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ebp + 8]
    add add dword ptr [ebp - 4], 4
    cmp cmp ecx, dword ptr [ebp - 12]
    jb L13
    cmp cmp dword ptr [ebp - 8], eax
    je sub_1007AB0D
    push push dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebx + 24]
    shl shl edi, 2
    add add eax, edi
    push push eax
    push push dword ptr [ebp - 20]
    mov mov ecx, ebx
    call sub_1006ECAF
    test test eax, eax
    jl sub_1007ABAB
    push push dword ptr [ebp - 24]
    mov mov eax, dword ptr [ebx + 8]
    push push 0
    push push 0
    push push 1
    push push dword ptr [eax + 124]
    mov mov eax, dword ptr [ebx + 24]
    add add eax, edi
    push push eax
    push push dword ptr [ebp - 20]
    mov mov ecx, ebx
    call sub_1007115E
    test test eax, eax
    jl sub_1007ABD2
    push push dword ptr [esi + 24]
    mov mov ecx, ebx
    call sub_1006C8AE
    test test eax, eax
    jge sub_1007AB64
    jmp sub_1007ABE9
    cmp cmp eax, 12
    jne sub_1007AB43
    mov mov eax, dword ptr [esi + 16]
    cmp cmp eax, edi
    jl sub_1007AB7D
    cmp cmp eax, 1
    jle sub_1007AAB7
    cmp cmp eax, 2
    je sub_1007AA88
    cmp cmp eax, 3
    je sub_1007AA77
    cmp cmp eax, 4
    je sub_1007AA72
    cmp cmp eax, 5
    je sub_1007AA6D
    cmp cmp eax, 6
    jne sub_1007ABA3
    xor xor edi, edi
    inc inc edi
L8:
    push push edi
    lea lea eax, [ebx + 40]
    push push eax
    push push dword ptr [esi + 24]
    mov mov ecx, ebx
    call sub_10070E12
    test test eax, eax
    jl sub_1007AC3D
    mov mov dword ptr [ebx + 84], edi
    jmp sub_1007ABC5
    mov mov eax, dword ptr [esi + 28]
    push push eax
    push push dword ptr [esi + 24]
    push push eax
    jmp sub_1007AABF
L11:
    push push dword ptr [esi + 28]
    push push dword ptr [esi + 24]
    push push 0
    jmp sub_1007AAC9
    push push dword ptr [esi + 28]
    push push dword ptr [esi + 24]
    push push dword ptr [esi + 20]
    push push esi
    mov mov ecx, ebx
    call L5
    jmp sub_1007AA59
    or or dword ptr [ebp + 8], -1
    push push 0
    lea lea eax, [ebp + 8]
    push push eax
    push push dword ptr [esi + 24]
    mov mov ecx, ebx
    call sub_1007B85C
L13:
    test test eax, eax
L14:
    jl sub_1007AC8B
    push push dword ptr [esi + 32]
    mov mov ecx, ebx
    push push dword ptr [esi + 28]
    push push dword ptr [ebp + 8]
L16:
    push push dword ptr [esi + 24]
    call sub_100717C9
    jmp sub_1007AA8D
    push push 0
    push push 0
    push push dword ptr [esi + 20]
    mov mov edi, ecx
    mov mov ecx, ebx
    call sub_1007B88C
    test test eax, eax
    jl sub_1007ACBB
    mov mov eax, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [eax + 12]
    and and dword ptr [ebp - 20], 0
    and and dword ptr [ebp - 24], 0
    cmp cmp edi, ecx
    mov mov dword ptr [ebp - 16], ecx
    jae sub_1007ABEE
    mov mov eax, dword ptr [eax + 24]
    lea lea eax, [eax + edi*4]
    mov mov dword ptr [ebp + 8], eax
    mov mov eax, dword ptr [ebx + 8]
    mov mov eax, dword ptr [eax + 12]
    sub sub eax, edi
    mov mov ecx, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ecx]
    mov mov edx, dword ptr [ebx + 56]
    cmp cmp dword ptr [ecx + 56], edx
    jne sub_1007AC05
    mov mov ecx, dword ptr [ecx + 60]
    test test ecx, ecx
    je sub_1007AC0C
    cmp cmp dword ptr [ecx + 4], 13
    jne sub_1007AC12
    mov mov edx, dword ptr [ecx + 68]
    cmp cmp edx, dword ptr [ebp - 24]
    jb sub_1007AC1A
    mov mov dword ptr [ebp - 20], ecx
    mov mov dword ptr [ebp - 24], edx
    add add dword ptr [ebp + 8], 4
    dec dec eax
    jne sub_1007ABFF
    cmp cmp edi, dword ptr [ebp - 16]
    jae sub_1007AC58
    mov mov eax, dword ptr [ebx + 8]
    mov mov eax, dword ptr [eax + 24]
    mov mov eax, dword ptr [eax + edi*4]
    mov mov ecx, dword ptr [eax + 56]
    cmp cmp ecx, dword ptr [ebx + 56]
    jne sub_1007AC60
    mov mov ecx, dword ptr [ebp - 20]
    mov mov dword ptr [eax + 60], ecx
    mov mov eax, dword ptr [ebx + 8]
    inc inc edi
    cmp cmp edi, dword ptr [eax + 12]
    jb sub_1007AC58
    xor xor eax, eax
    cmp cmp dword ptr [esi + 16], 1
    sete sete al
    mov mov dword ptr [ebx + 80], eax
    jmp sub_1007ACC3
    cmp cmp eax, edx
    jne sub_1007AD52
    cmp cmp dword ptr [ebx + 80], edi
    jne sub_1007ACD0
    cmp cmp dword ptr [ebx + 84], 0
    jne sub_1007ACD6
    xor xor edi, edi
    push push edi
    push push dword ptr [esi + 8]
    mov mov ecx, ebx
    call L18
L18:
    cmp cmp eax, edi
    jl sub_1007AD6B
    mov mov esi, dword ptr [esi + 12]
    cmp cmp esi, edi
    jne sub_1007ACCB
    xor xor edi, edi
    cmp cmp dword ptr [ebx + 84], edi
    je sub_1007AD77
    cmp cmp dword ptr [ebp + 12], edi
    je sub_1007AD7C
    mov mov esi, dword ptr [ebp - 28]
    mov mov dword ptr [ebp + 8], edi
    jmp sub_1007AD45
    mov mov eax, dword ptr [eax + 24]
    mov mov ecx, dword ptr [eax + esi*4]
    mov mov eax, dword ptr [ecx]
    and and eax, 0FFF00000h
    cmp cmp eax, 011000000h
    jne sub_1007AD48
    mov mov eax, dword ptr [ecx + 60]
    mov mov dword ptr [ebp + 8], eax
    push push 1
    call sub_1006C7AD
    mov mov eax, dword ptr [ebx + 8]
    mov mov eax, dword ptr [eax + 24]
    mov mov dword ptr [eax + esi*4], edi
    inc inc esi
    mov mov eax, dword ptr [ebx + 8]
    cmp cmp esi, dword ptr [eax + 12]
    jb sub_1007AD4D
    mov mov ecx, dword ptr [ebp - 28]
    mov mov esi, dword ptr [ebp + 12]
    mov mov dword ptr [eax + 12], ecx
    mov mov eax, dword ptr [ebx + 4]
    mov mov ecx, dword ptr [eax + 24]
    mov mov edi, dword ptr [ebx + 24]
    shl shl ecx, 2
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    push push 1
    lea lea eax, [ebx + 40]
    and and ecx, 3
    push push eax
    push push dword ptr [ebp + 8]
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, ebx
    call sub_10070FC9
    test test eax, eax
    jl sub_1007ADF0
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
    push push 01010FA8Ch
    push push edi
    push push edi
    push push ebx
    call sub_1006E095
    add add esp, 16
    mov mov eax, 080004005h
    jmp sub_1007AE10
FUN_1007a632 ENDP
END
