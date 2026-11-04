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
EXTRN sub_1007A75C:PROC
EXTRN sub_1007B6D5:PROC
EXTRN sub_1007B85C:PROC
EXTRN sub_1007B88C:PROC
EXTRN sub_1008626A:PROC
.CODE
FUN_1007a632 PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 28
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    xor edi, edi
    cmp esi, edi
    mov ebx, ecx
    je L37
    cmp dword ptr [ebx + 80], edi
    jne L37
    cmp dword ptr [ebx + 84], edi
    jne L37
    mov eax, dword ptr [ebx + 8]
    mov ecx, dword ptr [eax + 12]
    mov eax, dword ptr [esi + 4]
    xor edx, edx
    inc edx
    cmp eax, 6
    mov dword ptr [ebp - 28], ecx
    jne L18
    mov eax, dword ptr [esi + 16]
    cmp eax, edx
    jne L5
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [eax + 16]
    mov dword ptr [ebp + 8], ecx
    mov ecx, dword ptr [eax + 20]
    mov dword ptr [ebp - 12], ecx
    mov ecx, dword ptr [eax + 24]
    cmp ecx, edi
    jne L1
    test byte ptr [eax + 28], 64
    mov dword ptr [ebp - 8], edx
    jne L2
L1:
    mov dword ptr [ebp - 8], edi
L2:
    cmp ecx, edi
    je L3
    test byte ptr [eax + 28], 2
    mov dword ptr [ebp - 16], edx
    jne L4
L3:
    mov dword ptr [ebp - 16], edi
L4:
    mov ecx, dword ptr [eax + 28]
    mov edi, dword ptr [eax + 32]
    mov edx, ecx
    mov dword ptr [ebp - 20], edi
    mov edi, dword ptr [eax + 48]
    and edx, 000000080h
    and ecx, 0FFFFF3FFh
    mov dword ptr [ebp - 24], edi
    mov edi, dword ptr [ebp + 8]
    mov dword ptr [eax + 28], ecx
    jmp L6
L5:
    cmp eax, 2
    jne L37
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [eax + 20]
    mov edi, dword ptr [eax + 16]
    mov dword ptr [ebp - 12], ecx
    mov ecx, dword ptr [eax + 32]
    xor edx, edx
    and byte ptr [eax + 25], 0000000F3h
    mov dword ptr [ebp - 20], ecx
    mov ecx, dword ptr [eax + 52]
    mov dword ptr [ebp - 8], edx
    mov dword ptr [ebp - 16], edx
    mov dword ptr [ebp - 24], ecx
L6:
    xor eax, eax
    cmp edx, eax
    je L7
    push eax
    mov eax, dword ptr [ebx + 24]
    lea eax, [eax + edi*4]
    push eax
    mov eax, dword ptr [esi + 24]
    push dword ptr [eax + 40]
    mov ecx, ebx
    call sub_1007B6D5
    jmp L33
L7:
    cmp dword ptr [ebp - 12], eax
    mov dword ptr [ebp + 8], eax
    jbe L16
    mov ecx, edi
    shl ecx, 2
    mov dword ptr [ebp - 4], ecx
L8:
    cmp dword ptr [ebp - 16], eax
    je L9
    mov ecx, dword ptr [ebx + 24]
    mov edx, dword ptr [ebp - 4]
    cmp dword ptr [edx + ecx], -1
    jne L15
L9:
    cmp dword ptr [ebp - 8], eax
    mov ecx, dword ptr [ebx + 8]
    je L10
    mov eax, dword ptr [ecx + 124]
    jmp L11
L10:
    mov eax, dword ptr [ecx + 116]
L11:
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push 0
    push 0
    push eax
    call sub_1008626A
    mov ecx, dword ptr [ebx + 8]
    cmp eax, dword ptr [ecx + 8]
    jae L12
    mov ecx, dword ptr [ecx + 20]
    mov ecx, dword ptr [ecx + eax*4]
    jmp L13
L12:
    xor ecx, ecx
L13:
    test ecx, ecx
    je L14
    mov edx, dword ptr [ebp + 8]
    add edx, edi
    mov dword ptr [ecx + 48], edx
    mov edx, dword ptr [ebp + 8]
    mov dword ptr [ecx + 96], esi
    mov dword ptr [ecx + 100], edx
L14:
    mov ecx, dword ptr [ebx + 24]
    mov edx, dword ptr [ebp - 4]
    mov dword ptr [edx + ecx], eax
    xor eax, eax
L15:
    inc dword ptr [ebp + 8]
    mov ecx, dword ptr [ebp + 8]
    add dword ptr [ebp - 4], 4
    cmp ecx, dword ptr [ebp - 12]
    jb L8
L16:
    cmp dword ptr [ebp - 8], eax
    je L33
    push dword ptr [ebp - 12]
    mov eax, dword ptr [ebx + 24]
    shl edi, 2
    add eax, edi
    push eax
    push dword ptr [ebp - 20]
    mov ecx, ebx
    call sub_1006ECAF
    test eax, eax
    jl L38
    push dword ptr [ebp - 24]
    mov eax, dword ptr [ebx + 8]
    push 0
    push 0
    push 1
    push dword ptr [eax + 124]
    mov eax, dword ptr [ebx + 24]
    add eax, edi
    push eax
    push dword ptr [ebp - 20]
    mov ecx, ebx
    call sub_1007115E
    test eax, eax
    jl L38
    push dword ptr [esi + 24]
    mov ecx, ebx
    call sub_1006C8AE
L17:
    test eax, eax
    jge L33
    jmp L38
L18:
    cmp eax, 12
    jne L31
    mov eax, dword ptr [esi + 16]
    cmp eax, edi
    jl L33
    cmp eax, 1
    jle L24
    cmp eax, 2
    je L23
    cmp eax, 3
    je L21
    cmp eax, 4
    je L20
    cmp eax, 5
    je L19
    cmp eax, 6
    jne L33
    xor edi, edi
    inc edi
    push edi
    lea eax, [ebx + 40]
    push eax
    push dword ptr [esi + 24]
    mov ecx, ebx
    call sub_10070E12
    test eax, eax
    jl L38
    mov dword ptr [ebx + 84], edi
    jmp L33
L19:
    mov eax, dword ptr [esi + 28]
    push eax
    push dword ptr [esi + 24]
    push eax
    jmp L22
L20:
    push dword ptr [esi + 28]
    push dword ptr [esi + 24]
    push 0
    jmp L22
L21:
    push dword ptr [esi + 28]
    push dword ptr [esi + 24]
    push dword ptr [esi + 20]
L22:
    push esi
    mov ecx, ebx
    call sub_1007A75C
    jmp L17
L23:
    or dword ptr [ebp + 8], 0FFFFFFFFh
    push 0
    lea eax, [ebp + 8]
    push eax
    push dword ptr [esi + 24]
    mov ecx, ebx
    call sub_1007B85C
    test eax, eax
    jl L38
    push dword ptr [esi + 32]
    mov ecx, ebx
    push dword ptr [esi + 28]
    push dword ptr [ebp + 8]
    push dword ptr [esi + 24]
    call sub_100717C9
    jmp L17
L24:
    push 0
    push 0
    push dword ptr [esi + 20]
    mov edi, ecx
    mov ecx, ebx
    call sub_1007B88C
    test eax, eax
    jl L38
    mov eax, dword ptr [ebx + 8]
    mov ecx, dword ptr [eax + 12]
    and dword ptr [ebp - 20], 0
    and dword ptr [ebp - 24], 0
    cmp edi, ecx
    mov dword ptr [ebp - 16], ecx
    jae L27
    mov eax, dword ptr [eax + 24]
    lea eax, [eax + edi*4]
    mov dword ptr [ebp + 8], eax
    mov eax, dword ptr [ebx + 8]
    mov eax, dword ptr [eax + 12]
    sub eax, edi
L25:
    mov ecx, dword ptr [ebp + 8]
    mov ecx, dword ptr [ecx]
    mov edx, dword ptr [ebx + 56]
    cmp dword ptr [ecx + 56], edx
    jne L26
    mov ecx, dword ptr [ecx + 60]
    test ecx, ecx
    je L26
    cmp dword ptr [ecx + 4], 13
    jne L26
    mov edx, dword ptr [ecx + 68]
    cmp edx, dword ptr [ebp - 24]
    jb L26
    mov dword ptr [ebp - 20], ecx
    mov dword ptr [ebp - 24], edx
L26:
    add dword ptr [ebp + 8], 4
    dec eax
    jne L25
L27:
    cmp edi, dword ptr [ebp - 16]
    jae L30
L28:
    mov eax, dword ptr [ebx + 8]
    mov eax, dword ptr [eax + 24]
    mov eax, dword ptr [eax + edi*4]
    mov ecx, dword ptr [eax + 56]
    cmp ecx, dword ptr [ebx + 56]
    jne L29
    mov ecx, dword ptr [ebp - 20]
    mov dword ptr [eax + 60], ecx
L29:
    mov eax, dword ptr [ebx + 8]
    inc edi
    cmp edi, dword ptr [eax + 12]
    jb L28
L30:
    xor eax, eax
    cmp dword ptr [esi + 16], 1
    sete al
    mov dword ptr [ebx + 80], eax
    jmp L33
L31:
    cmp eax, edx
    jne L39
L32:
    cmp dword ptr [ebx + 80], edi
    jne L33
    cmp dword ptr [ebx + 84], 0
    jne L33
    xor edi, edi
    push edi
    push dword ptr [esi + 8]
    mov ecx, ebx
    call L0
    cmp eax, edi
    jl L38
    mov esi, dword ptr [esi + 12]
    cmp esi, edi
    jne L32
L33:
    xor edi, edi
    cmp dword ptr [ebx + 84], edi
    je L37
    cmp dword ptr [ebp + 12], edi
    je L37
    mov esi, dword ptr [ebp - 28]
    mov dword ptr [ebp + 8], edi
    jmp L36
L34:
    mov eax, dword ptr [eax + 24]
    mov ecx, dword ptr [eax + esi*4]
    mov eax, dword ptr [ecx]
    and eax, 0FFF00000h
    cmp eax, 011000000h
    jne L35
    mov eax, dword ptr [ecx + 60]
    mov dword ptr [ebp + 8], eax
L35:
    push 1
    call sub_1006C7AD
    mov eax, dword ptr [ebx + 8]
    mov eax, dword ptr [eax + 24]
    mov dword ptr [eax + esi*4], edi
    inc esi
L36:
    mov eax, dword ptr [ebx + 8]
    cmp esi, dword ptr [eax + 12]
    jb L34
    mov ecx, dword ptr [ebp - 28]
    mov esi, dword ptr [ebp + 12]
    mov dword ptr [eax + 12], ecx
    mov eax, dword ptr [ebx + 4]
    mov ecx, dword ptr [eax + 24]
    mov edi, dword ptr [ebx + 24]
    shl ecx, 2
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    push 1
    lea eax, [ebx + 40]
    and ecx, 3
    push eax
    push dword ptr [ebp + 8]
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, ebx
    call sub_10070FC9
    test eax, eax
    jl L38
L37:
    xor eax, eax
L38:
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
L39:
    push 01010FA8Ch
    push edi
    push edi
    push ebx
    call sub_1006E095
    add esp, 16
    mov eax, 080004005h
    jmp L38
FUN_1007a632 ENDP
END
