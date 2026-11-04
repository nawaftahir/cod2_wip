.686
.MODEL FLAT, C
EXTRN sub_1006C7D1:PROC
EXTRN sub_1006C7DF:PROC
EXTRN sub_10085543:PROC
EXTRN sub_100855B0:PROC
EXTRN sub_100856C0:PROC
EXTRN sub_100859D1:PROC
EXTRN sub_10085A4C:PROC
EXTRN sub_10085B50:PROC
EXTRN sub_10085E2B:PROC
EXTRN sub_10085EDB:PROC
EXTRN sub_100862DC:PROC
EXTRN sub_10086330:PROC
EXTRN sub_10086386:PROC
EXTRN sub_1008638E:PROC
EXTRN sub_100A8049:PROC
.CODE
FUN_100a7f9b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0000000E8h
    and dword ptr [ebp - 4], 0
    and dword ptr [ebp - 8], 0
    push ebx
    mov ebx, ecx
    mov ecx, dword ptr [ebx + 000000224h]
    mov eax, dword ptr [ebx + 76]
    push esi
    push edi
    mov dword ptr [ebp - 56], ecx
    cmp eax, ecx
    jmp L27
L0:
    mov ecx, dword ptr [ebx + 000000230h]
    mov esi, dword ptr [ecx + eax*4]
    test esi, esi
    mov dword ptr [ebp - 40], esi
    je L26
    mov eax, dword ptr [esi]
    test eax, eax
    je L26
    and eax, 0000FFFFFh
    mov dword ptr [ebp - 16], eax
    mov eax, dword ptr [esi + 4]
    xor edx, edx
    div dword ptr [ebp - 16]
    and dword ptr [ebp - 32], 0
    test eax, eax
    mov dword ptr [ebp - 52], eax
    jbe L23
    and dword ptr [ebp - 20], 0
    lea eax, [ebp - 000000098h]
    mov dword ptr [ebp - 28], eax
L1:
    mov edi, dword ptr [ebp - 28]
    or eax, 0FFFFFFFFh
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    or eax, 0FFFFFFFFh
    lea edi, [ebp - 0000000E8h]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    xor edx, edx
    cmp dword ptr [ebp - 16], edx
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    mov dword ptr [ebp - 36], edx
    mov dword ptr [ebp - 44], edx
    jbe L10
    mov eax, dword ptr [esi]
    and eax, 0FFF00000h
    mov dword ptr [ebp - 24], eax
    mov eax, dword ptr [esi + 8]
    add eax, dword ptr [ebp - 20]
L2:
    cmp dword ptr [ebp - 24], 050000000h
    mov edi, dword ptr [eax]
    mov ecx, dword ptr [ebx + 20]
    mov edi, dword ptr [ecx + edi*4]
    mov dword ptr [ebp - 12], edi
    je L3
    mov edi, dword ptr [ebp - 16]
    cmp edi, dword ptr [esi + 12]
    jne L3
    mov edi, dword ptr [esi + 16]
    mov edx, dword ptr [edi + edx*4]
    mov ecx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [ecx + 16]
L3:
    mov ecx, dword ptr [ebp - 12]
    mov edi, dword ptr [ecx + 4]
    mov ecx, dword ptr [ebx + 16]
    mov ecx, dword ptr [ecx + edi*4]
    test byte ptr [ecx + 5], 1
    mov ecx, dword ptr [ebp - 32]
    lea ecx, [edx + ecx*4]
    je L4
    mov dword ptr [ebp + ecx*4 - 000000098h], edx
    jmp L5
L4:
    mov edi, dword ptr [ebp - 12]
    mov edi, dword ptr [edi + 16]
    mov dword ptr [ebp + ecx*4 - 000000098h], edi
L5:
    cmp edx, 3
    jne L6
    mov dword ptr [ebp - 36], 1
L6:
    and dword ptr [ebp + edx*4 - 0000000E8h], 0
    mov edx, dword ptr [ebp - 44]
    inc edx
    add eax, 4
    cmp edx, dword ptr [ebp - 16]
    mov dword ptr [ebp - 44], edx
    jb L2
    cmp dword ptr [ebp - 36], 0
    je L10
    xor edx, edx
    inc edx
    cmp dword ptr [ebp - 16], edx
    jne L10
    cmp dword ptr [ebp - 24], 050000000h
    jne L7
    cmp dword ptr [esi + 12], edx
    je L10
L7:
    mov ecx, dword ptr [ebp - 28]
    xor eax, eax
L8:
    mov edi, dword ptr [ecx]
    cmp edi, dword ptr [eax + 0101A4060h]
    je L9
    cmp dword ptr [ebp + eax - 0000000E8h], -1
    je L9
    xor edx, edx
L9:
    add eax, 4
    add ecx, 4
    cmp eax, 16
    jb L8
    test edx, edx
    jne L22
L10:
    push 2
    lea eax, [ebp - 0000000E8h]
    push eax
    push dword ptr [ebp - 28]
    call sub_100A8049
    test eax, eax
    jne L22
    xor edi, edi
L11:
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push 3
    push 0
    push dword ptr [ebx + 000000088h]
    mov ecx, ebx
    call sub_100862DC
    cmp eax, -1
    mov dword ptr [ebp + edi*4 - 72], eax
    je L31
    inc edi
    cmp edi, 1
    jb L11
    push 116
    call sub_100859D1
    xor edi, edi
    cmp eax, edi
    je L12
    mov ecx, eax
    call sub_10085543
    mov dword ptr [ebp - 4], eax
    jmp L13
L12:
    mov dword ptr [ebp - 4], edi
L13:
    cmp dword ptr [ebp - 4], edi
    je L31
    mov ecx, dword ptr [ebp - 4]
    push edi
    push 1
    push 6
    push 050000003h
    call sub_10085A4C
    mov edi, eax
    test edi, edi
    jl L28
    mov ecx, dword ptr [ebp - 4]
    push esi
    call sub_100855B0
    mov edi, eax
    test edi, edi
    jl L28
    mov ecx, dword ptr [ebp - 20]
    mov eax, dword ptr [esi + 8]
    mov eax, dword ptr [ecx + eax]
    mov ecx, dword ptr [ebx + 20]
    mov edi, dword ptr [ecx + eax*4]
    mov eax, dword ptr [edi + 16]
    mov dword ptr [ebp - 36], eax
    xor eax, eax
    mov dword ptr [ebp - 12], eax
    jmp L15
L14:
    mov eax, dword ptr [ebp - 12]
L15:
    cmp eax, dword ptr [ebp - 36]
    jne L16
    mov ecx, dword ptr [ebx + 000000444h]
    jmp L17
L16:
    mov ecx, dword ptr [ebx + 000000440h]
L17:
    fld qword ptr [edi + 32]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push eax
    push 0
    push dword ptr [edi + 4]
    mov dword ptr [ebp + eax*4 - 88], ecx
    mov ecx, ebx
    call sub_1008638E
    cmp eax, -1
    mov ecx, dword ptr [ebp - 12]
    mov dword ptr [ebp + ecx*4 - 104], eax
    je L31
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [ecx + eax*4]
    push edi
    mov ecx, eax
    mov dword ptr [ebp - 24], eax
    call sub_10085EDB
    mov ecx, dword ptr [ebp - 20]
    mov eax, dword ptr [esi + 8]
    mov eax, dword ptr [ecx + eax]
    mov ecx, dword ptr [ebx + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ecx + 56]
    cmp ecx, -1
    jne L18
    mov ecx, dword ptr [ebp - 24]
    mov dword ptr [ecx + 56], eax
    jmp L19
L18:
    mov eax, dword ptr [ebp - 24]
    mov dword ptr [eax + 56], ecx
L19:
    inc dword ptr [ebp - 12]
    cmp dword ptr [ebp - 12], 3
    jb L14
    mov eax, dword ptr [ebp - 4]
    mov edi, dword ptr [eax + 8]
    mov ecx, dword ptr [ebp - 16]
    lea esi, [ebp - 88]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    mov edi, dword ptr [eax + 8]
    add edi, 12
    test ecx, ecx
    lea esi, [ebp - 104]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    mov edi, dword ptr [eax + 16]
    lea esi, [ebp - 72]
    movsd dword ptr es:[edi], dword ptr [esi]
    jbe L21
    mov eax, dword ptr [ebp - 20]
L20:
    mov edx, dword ptr [ebp - 40]
    mov edx, dword ptr [edx + 8]
    mov esi, dword ptr [ebp - 72]
    mov dword ptr [eax + edx], esi
    add eax, 4
    dec ecx
    jne L20
L21:
    mov eax, dword ptr [ebx + 000000224h]
    cmp eax, 000000200h
    jae L31
    mov ecx, dword ptr [ebp - 4]
    mov edx, dword ptr [ebx + 000000230h]
    mov dword ptr [edx + eax*4], ecx
    inc dword ptr [ebx + 000000224h]
    push ecx
    mov ecx, ebx
    call sub_10086330
    test eax, eax
    jl L31
    and dword ptr [ebp - 4], 0
    mov esi, dword ptr [ebp - 40]
L22:
    mov eax, dword ptr [ebp - 16]
    inc dword ptr [ebp - 32]
    add dword ptr [ebp - 28], 16
    shl eax, 2
    add dword ptr [ebp - 20], eax
    mov eax, dword ptr [ebp - 32]
    cmp eax, dword ptr [ebp - 52]
    jb L1
L23:
    push 116
    call sub_10085B50
    test eax, eax
    je L24
    mov ecx, eax
    call sub_100856C0
    mov dword ptr [ebp - 8], eax
    jmp L25
L24:
    and dword ptr [ebp - 8], 0
L25:
    cmp dword ptr [ebp - 8], 0
    je L31
    push dword ptr [ebp - 8]
    mov ecx, ebx
    call sub_10086386
    test eax, eax
    jl L31
    mov ecx, dword ptr [ebp - 8]
    push esi
    call sub_10085E2B
    mov edi, eax
    test edi, edi
    jl L29
    mov eax, dword ptr [ebx + 000000224h]
    cmp eax, 000000200h
    jae L31
    mov ecx, dword ptr [ebx + 000000230h]
    mov edx, dword ptr [ebp - 8]
    and dword ptr [ebp - 8], 0
    mov dword ptr [ecx + eax*4], edx
    inc dword ptr [ebx + 000000224h]
    and dword ptr [esi], 0
L26:
    mov eax, dword ptr [ebp - 48]
    inc eax
    cmp eax, dword ptr [ebp - 56]
L27:
    mov dword ptr [ebp - 48], eax
    jb L0
    xor edi, edi
L28:
    mov ecx, dword ptr [ebp - 4]
    test ecx, ecx
    je L29
    push 1
    call sub_1006C7D1
L29:
    mov ecx, dword ptr [ebp - 8]
    test ecx, ecx
    je L30
    push 1
    call sub_1006C7DF
L30:
    mov eax, edi
    pop edi
    pop esi
    pop ebx
    leave
    ret
L31:
    mov edi, 08007000Eh
    jmp L28
FUN_100a7f9b ENDP
END
