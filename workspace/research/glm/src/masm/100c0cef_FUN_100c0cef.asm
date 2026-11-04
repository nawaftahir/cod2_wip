.686
.MODEL FLAT, C
EXTRN sub_1006C6D1:PROC
EXTRN sub_10085486:PROC
EXTRN sub_100854F8:PROC
EXTRN sub_10085916:PROC
EXTRN sub_1008598F:PROC
EXTRN sub_10085D60:PROC
EXTRN sub_10086325:PROC
EXTRN sub_1008633F:PROC
EXTRN sub_100B9A11:PROC
EXTRN sub_100B9A3F:PROC
.CODE
FUN_100c0cef PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000104h
    push ebx
    push esi
    push edi
    mov ebx, ecx
    mov eax, dword ptr [ebx + 000000100h]
    mov esi, dword ptr [eax]
    xor ecx, ecx
    mov dword ptr [ebp - 8], ecx
    mov dword ptr [ebp - 36], ecx
    xor edi, edi
    mov dword ptr [ebp - 12], ecx
    inc edi
    push edi
    and esi, 0000FFFFFh
    push esi
    lea ecx, [ebp - 36]
    push ecx
    lea ecx, [ebp - 0000000C4h]
    push ecx
    lea ecx, [ebp - 8]
    push ecx
    lea ecx, [ebp - 000000104h]
    push ecx
    push 010119C58h
    push eax
    mov ecx, ebx
    mov dword ptr [ebp - 32], edi
    mov dword ptr [ebp - 28], 2
    mov dword ptr [ebp - 24], 3
    call sub_100B9A11
    test eax, eax
    je L0
    push edi
    push esi
    lea eax, [ebp - 36]
    push eax
    lea eax, [ebp - 0000000C4h]
    push eax
    lea eax, [ebp - 8]
    push eax
    lea eax, [ebp - 000000104h]
    push eax
    push 010119CB8h
    push dword ptr [ebx + 000000100h]
    mov ecx, ebx
    call sub_100B9A3F
    test eax, eax
    jne L15
    mov dword ptr [ebp - 12], edi
L0:
    mov eax, dword ptr [ebp - 000000104h]
    cmp dword ptr [eax], 050000002h
    jne L14
    cmp esi, edi
    mov dword ptr [ebp - 4], edi
    jbe L3
    mov eax, dword ptr [ebx + 000000100h]
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [eax]
    mov dword ptr [ebp - 16], ecx
    lea ecx, [esi*4 + 4]
    lea edx, [eax + 4]
    jmp L2
L1:
    xor edi, edi
    inc edi
L2:
    mov eax, dword ptr [ebp - 16]
    cmp dword ptr [edx], eax
    jne L14
    mov eax, dword ptr [ebx + 000000100h]
    mov eax, dword ptr [eax + 8]
    mov edi, dword ptr [ecx + eax]
    cmp edi, dword ptr [eax + esi*4]
    jne L4
    inc dword ptr [ebp - 4]
    add edx, 4
    add ecx, 4
    cmp dword ptr [ebp - 4], esi
    jb L1
L3:
    push 116
    call sub_10085916
    test eax, eax
    je L5
    mov ecx, eax
    call sub_10085486
    mov dword ptr [ebp - 4], eax
    jmp L6
L4:
    xor edi, edi
    inc edi
    jmp L14
L5:
    and dword ptr [ebp - 4], 0
L6:
    mov ecx, dword ptr [ebp - 4]
    push 0
    push esi
    push 6
    push 070800002h
    call sub_1008598F
    mov edi, eax
    test edi, edi
    jl L13
    push dword ptr [ebx + 000000100h]
    mov ecx, dword ptr [ebp - 4]
    call sub_100854F8
    mov edi, eax
    test edi, edi
    jl L13
    cmp dword ptr [ebp - 12], 0
    mov eax, dword ptr [ebx + 000000100h]
    mov ecx, esi
    mov esi, dword ptr [eax + 16]
    mov eax, dword ptr [ebp - 4]
    mov edi, dword ptr [eax + 16]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, dword ptr [ebp - 0000000C4h]
    mov edi, eax
    mov eax, dword ptr [edi + 8]
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [ebp - 0000000C0h]
    mov dword ptr [eax + 4], ecx
    jne L7
    mov ecx, dword ptr [ebp - 0000000B4h]
    mov eax, dword ptr [edi + 8]
    mov dword ptr [eax + 8], ecx
    mov ecx, dword ptr [ebp - 0000000B0h]
    jmp L10
L7:
    mov eax, dword ptr [ebp - 0000000B4h]
    mov ecx, dword ptr [ebx + 20]
    mov edx, dword ptr [ebp - 0000000B0h]
    mov esi, dword ptr [ecx + edx*4]
    mov dword ptr [ebp - 20], eax
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax + 56]
    cmp ecx, -1
    mov dword ptr [ebp - 12], edx
    je L8
    mov eax, dword ptr [ebx + 20]
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [ebp - 20], ecx
L8:
    mov ecx, dword ptr [esi + 56]
    cmp ecx, -1
    je L9
    mov edx, dword ptr [ebx + 20]
    mov esi, dword ptr [edx + ecx*4]
    mov dword ptr [ebp - 12], ecx
L9:
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push dword ptr [eax + 16]
    mov ecx, ebx
    push dword ptr [eax + 12]
    push dword ptr [eax + 4]
    call sub_10086325
    fldz
    push ecx
    push ecx
    fstp qword ptr [esp]
    push dword ptr [esi + 16]
    mov ecx, ebx
    push dword ptr [esi + 12]
    mov dword ptr [ebp - 16], eax
    push dword ptr [esi + 4]
    call sub_1008633F
    mov dword ptr [ebp - 8], eax
    mov eax, dword ptr [ebp - 16]
    cmp eax, -1
    je L12
    cmp dword ptr [ebp - 8], -1
    je L12
    mov esi, dword ptr [ebx + 20]
    mov edx, dword ptr [ebp - 20]
    shl eax, 2
    mov esi, dword ptr [eax + esi]
    mov ecx, 000080000h
    xor edx, ecx
    mov dword ptr [esi + 60], edx
    mov edx, dword ptr [ebp - 8]
    mov esi, dword ptr [ebp - 12]
    shl edx, 2
    xor esi, ecx
    mov ecx, dword ptr [ebx + 20]
    mov ecx, dword ptr [edx + ecx]
    mov dword ptr [ecx + 60], esi
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [eax + ecx]
    mov ecx, dword ptr [ebp - 20]
    mov dword ptr [eax + 56], ecx
    mov eax, dword ptr [ebx + 20]
    mov eax, dword ptr [edx + eax]
    mov ecx, dword ptr [ebp - 12]
    mov dword ptr [eax + 56], ecx
    mov eax, dword ptr [edi + 8]
    mov ecx, dword ptr [ebp - 16]
    mov dword ptr [eax + 8], ecx
    mov eax, dword ptr [edi + 8]
    mov ecx, dword ptr [ebp - 8]
L10:
    mov dword ptr [eax + 12], ecx
    mov ecx, dword ptr [edi + 8]
    mov eax, dword ptr [ebp - 0000000A4h]
    mov dword ptr [ecx + 16], eax
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [ecx + 20], eax
    mov eax, dword ptr [ebx]
    push edi
    mov ecx, ebx
    call dword ptr [eax + 0x30]
    test eax, eax
    je L11
    xor edi, edi
    inc edi
    jmp L13
L11:
    mov ecx, dword ptr [ebx + 000000100h]
    push edi
    call sub_10085D60
    mov edi, eax
    jmp L13
L12:
    mov edi, 08007000Eh
L13:
    mov ecx, dword ptr [ebp - 4]
    test ecx, ecx
    je L14
    push 1
    call sub_1006C6D1
L14:
    mov eax, edi
L15:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100c0cef ENDP
END
