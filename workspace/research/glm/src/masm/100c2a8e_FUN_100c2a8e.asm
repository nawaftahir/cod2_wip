.686
.MODEL FLAT, C
EXTRN sub_1006C7B3:PROC
EXTRN sub_100855BC:PROC
EXTRN sub_10085645:PROC
EXTRN sub_10085A4C:PROC
EXTRN sub_10085AE1:PROC
EXTRN sub_10086418:PROC
EXTRN sub_100864B9:PROC
EXTRN sub_100F6680:PROC
EXTRN sub_100F668F:PROC
EXTRN sub_100F669E:PROC
EXTRN sub_100F66AD:PROC
EXTRN sub_100F677D:PROC
EXTRN sub_100F678C:PROC
EXTRN sub_100F679B:PROC
EXTRN sub_100F67AA:PROC
.CODE
FUN_100c2a8e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 16
    and dword ptr [ebp - 8], 0
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    mov ebx, ecx
    mov ecx, dword ptr [edi]
    mov edx, ecx
    mov eax, 0000FFFFFh
    and ecx, eax
    and edx, 0FFF00000h
    cmp dword ptr [ebp + 12], 0
    mov esi, ecx
    mov dword ptr [ebp - 16], edx
    mov dword ptr [ebp - 12], esi
    je L8
    cmp edx, 010F00000h
    je L3
    cmp edx, 073500000h
    je L2
    cmp edx, 073600000h
    je L1
    cmp edx, 073700000h
    je L0
    cmp edx, 073800000h
    jne L31
    and esi, eax
    or esi, 073C00000h
    jmp L18
L0:
    and esi, eax
    or esi, 073B00000h
    jmp L18
L1:
    and esi, eax
    or esi, 073A00000h
    jmp L18
L2:
    and esi, eax
    or esi, 073900000h
    jmp L18
L3:
    mov edx, dword ptr [ebx + 20]
    mov ecx, esi
    and ecx, eax
    mov eax, dword ptr [edi + 8]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + 4]
    mov edx, dword ptr [ebx + 16]
    mov edi, dword ptr [edx + eax*4]
    mov esi, ecx
    or esi, 073000000h
    test word ptr [edi + 4], 000000208h
    mov dword ptr [ebp - 4], ecx
    je L7
    mov eax, dword ptr [edi]
    test eax, eax
    je L5
    push 105
    push eax
    call sub_100F6680
    test eax, eax
    pop ecx
    pop ecx
    jne L4
    push 73
    push dword ptr [edi]
    call sub_100F668F
    test eax, eax
    pop ecx
    pop ecx
    jne L4
    push 98
    push dword ptr [edi]
    call sub_100F669E
    test eax, eax
    pop ecx
    pop ecx
    jne L4
    push 66
    push dword ptr [edi]
    call sub_100F66AD
    test eax, eax
    pop ecx
    pop ecx
    jne L4
    test byte ptr [edi + 5], 8
    jne L6
L4:
    mov ecx, dword ptr [ebp - 4]
L5:
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [ebx + 20]
    mov eax, dword ptr [edx + eax*4]
    cmp dword ptr [eax + 8], -1
    je L18
    jmp L7
L6:
    mov ecx, dword ptr [ebp - 4]
L7:
    or ecx, 073B00000h
    jmp L17
L8:
    cmp edx, 010F00000h
    je L12
    cmp edx, 073500000h
    je L11
    cmp edx, 073600000h
    je L10
    cmp edx, 073700000h
    je L9
    cmp edx, 073800000h
    jne L31
    and esi, eax
    or esi, 074000000h
    jmp L18
L9:
    and esi, eax
    or esi, 073F00000h
    jmp L18
L10:
    and esi, eax
    or esi, 073E00000h
    jmp L18
L11:
    and esi, eax
    or esi, 073D00000h
    jmp L18
L12:
    mov edx, dword ptr [ebx + 20]
    mov ecx, esi
    and ecx, eax
    mov eax, dword ptr [edi + 8]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + 4]
    mov edx, dword ptr [ebx + 16]
    mov edi, dword ptr [edx + eax*4]
    mov esi, ecx
    or esi, 073100000h
    test word ptr [edi + 4], 000000208h
    mov dword ptr [ebp - 4], ecx
    je L16
    mov eax, dword ptr [edi]
    test eax, eax
    je L14
    push 105
    push eax
    call sub_100F677D
    test eax, eax
    pop ecx
    pop ecx
    jne L13
    push 73
    push dword ptr [edi]
    call sub_100F678C
    test eax, eax
    pop ecx
    pop ecx
    jne L13
    push 98
    push dword ptr [edi]
    call sub_100F679B
    test eax, eax
    pop ecx
    pop ecx
    jne L13
    push 66
    push dword ptr [edi]
    call sub_100F67AA
    test eax, eax
    pop ecx
    pop ecx
    jne L13
    test byte ptr [edi + 5], 8
    jne L15
L13:
    mov ecx, dword ptr [ebp - 4]
L14:
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [ebx + 20]
    mov eax, dword ptr [edx + eax*4]
    cmp dword ptr [eax + 8], -1
    je L18
    jmp L16
L15:
    mov ecx, dword ptr [ebp - 4]
L16:
    or ecx, 073F00000h
L17:
    mov esi, ecx
    mov dword ptr [ebp - 8], 1
L18:
    push 116
    call sub_10085A4C
    test eax, eax
    je L19
    mov ecx, eax
    call sub_100855BC
    mov edi, eax
    mov dword ptr [ebp - 4], edi
    jmp L20
L19:
    and dword ptr [ebp - 4], 0
    mov edi, dword ptr [ebp - 4]
L20:
    xor eax, eax
    cmp edi, eax
    je L31
    cmp dword ptr [ebp - 16], 010F00000h
    jne L21
    cmp dword ptr [ebp - 8], eax
    jne L21
    push eax
    push dword ptr [ebp - 12]
    push dword ptr [ebp - 12]
    jmp L22
L21:
    push eax
    mov eax, dword ptr [ebp - 12]
    push eax
    add eax, eax
    push eax
L22:
    mov ecx, edi
    push esi
    call sub_10085AE1
    test eax, eax
    mov ecx, edi
    jl L30
    mov esi, dword ptr [ebp + 8]
    push esi
    call sub_10085645
    test eax, eax
    jge L23
    mov ecx, edi
    jmp L30
L23:
    xor eax, eax
    cmp dword ptr [ebp + 12], eax
    je L24
    mov ecx, dword ptr [esi + 12]
    mov esi, dword ptr [esi + 16]
    mov edi, dword ptr [edi + 16]
    shl ecx, 2
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [ebp - 4]
    mov esi, dword ptr [ebp + 8]
    jmp L25
L24:
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push eax
    push eax
    push dword ptr [ebx + 0000000A8h]
    mov ecx, ebx
    call sub_10086418
    mov ecx, dword ptr [edi + 16]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [edi + 16]
    cmp dword ptr [eax], -1
    je L31
    mov ecx, dword ptr [edi + 16]
    mov eax, dword ptr [ebx + 20]
    mov edx, dword ptr [esi + 16]
    mov ecx, dword ptr [ecx]
    mov edx, dword ptr [edx]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [eax + edx*4]
    mov edx, dword ptr [eax + 24]
    mov dword ptr [ecx + 24], edx
    mov eax, dword ptr [eax + 20]
    mov dword ptr [ecx + 20], eax
L25:
    mov ecx, dword ptr [esi + 4]
    mov esi, dword ptr [esi + 8]
    mov edi, dword ptr [edi + 8]
    shl ecx, 2
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    xor eax, eax
    cmp dword ptr [ebp - 8], eax
    rep movsb byte ptr es:[edi], byte ptr [esi]
    je L33
    cmp dword ptr [ebx + 8], eax
    mov dword ptr [ebp + 8], eax
    jbe L28
    mov edx, dword ptr [ebx + 16]
    mov ecx, dword ptr [ebx + 20]
    mov esi, dword ptr [ebx + 8]
L26:
    mov eax, dword ptr [ecx]
    mov edi, dword ptr [eax + 4]
    mov edi, dword ptr [edx + edi*4]
    test byte ptr [edi + 5], 1
    je L27
    mov eax, dword ptr [eax + 12]
    cmp eax, dword ptr [ebp + 8]
    jb L27
    inc eax
    mov dword ptr [ebp + 8], eax
L27:
    add ecx, 4
    dec esi
    jne L26
L28:
    cmp dword ptr [ebx + 000000188h], -1
    jne L29
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push 0
    push dword ptr [ebp + 8]
    mov ecx, ebx
    push dword ptr [ebx + 120]
    call sub_100864B9
    mov dword ptr [ebx + 000000188h], eax
L29:
    mov ebx, dword ptr [ebx + 000000188h]
    cmp ebx, -1
    jne L32
    mov ecx, dword ptr [ebp - 4]
L30:
    push 1
    call sub_1006C7B3
L31:
    xor eax, eax
    jmp L34
L32:
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 8]
    mov dword ptr [eax + 4], ebx
L33:
    mov eax, dword ptr [ebp - 4]
L34:
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
FUN_100c2a8e ENDP
END
