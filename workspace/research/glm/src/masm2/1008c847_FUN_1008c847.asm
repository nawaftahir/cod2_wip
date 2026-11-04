.686
.MODEL FLAT, C
EXTRN sub_1008A9CE:PROC
EXTRN sub_1008B069:PROC
EXTRN sub_1008B221:PROC
EXTRN sub_1008B258:PROC
EXTRN sub_1008CB52:PROC
EXTRN sub_1008CB56:PROC
EXTRN sub_1008CB5A:PROC
EXTRN sub_1008CB66:PROC
EXTRN sub_1008CC26:PROC
EXTRN sub_1008CC29:PROC
EXTRN sub_1008CC2D:PROC
EXTRN sub_1008CC8D:PROC
EXTRN sub_1008CCA6:PROC
EXTRN sub_1008CCAA:PROC
EXTRN sub_1008CCB0:PROC
EXTRN sub_1008CCB7:PROC
EXTRN sub_1008CCC1:PROC
EXTRN sub_1008CCD6:PROC
EXTRN sub_1008CCE2:PROC
EXTRN sub_1008CCF6:PROC
EXTRN sub_1008CCFC:PROC
EXTRN sub_1008CD09:PROC
EXTRN sub_1008CD19:PROC
EXTRN sub_1008CD73:PROC
EXTRN sub_1008CD79:PROC
EXTRN sub_1008CD7F:PROC
EXTRN sub_1008CD82:PROC
EXTRN sub_1008CD85:PROC
EXTRN sub_1008CD88:PROC
EXTRN sub_1008CD8A:PROC
EXTRN sub_1008CDA8:PROC
EXTRN sub_1008CDC4:PROC
EXTRN sub_1008CDC7:PROC
EXTRN sub_1008CDCC:PROC
EXTRN sub_1008CE22:PROC
EXTRN sub_1008CE36:PROC
EXTRN sub_1008CE3A:PROC
EXTRN sub_100F9261:PROC
EXTRN sub_100F93AB:PROC
EXTRN sub_100F93E2:PROC
EXTRN EXTRN g_1019BEB0:DWORD:DWORD
.CODE
FUN_1008c847 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 36
    push push ebx
    xor xor eax, eax
    push push esi
    mov mov esi, ecx
    cmp cmp dword ptr [esi + 8], eax
    push push edi
    mov mov dword ptr [ebp - 12], eax
    mov mov dword ptr [ebp - 16], eax
    mov mov dword ptr [ebp - 20], eax
    mov mov dword ptr [ebp - 8], eax
    jbe sub_1008CB56
    jmp L0
    xor xor eax, eax
    mov mov ecx, dword ptr [esi + 20]
    mov mov edx, dword ptr [ebp - 8]
    mov mov ebx, dword ptr [ecx + edx*4]
    mov mov ecx, dword ptr [esi + 116]
    cmp cmp ecx, dword ptr [ebx + 4]
    je sub_1008CB5A
    lea lea edi, [ebx + 8]
    cmp cmp dword ptr [edi], -1
    je sub_1008CB66
    cmp cmp dword ptr [ebp - 20], eax
    jne L1
L0:
    mov mov ecx, esi
    call sub_1008A9CE
    mov mov dword ptr [ebp - 20], 1
    mov mov ecx, dword ptr [edi]
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [eax + 72]
    cmp cmp eax, -1
    mov mov dword ptr [ebp - 28], ecx
    je L2
    mov mov edx, dword ptr [esi + 24]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov edx, dword ptr [eax]
    and and edx, 0FFF00000h
    cmp cmp edx, 010000000h
    jne L3
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [eax + 12], 0
    jbe L4
    mov mov edx, dword ptr [eax + 16]
    cmp cmp dword ptr [edx], ecx
    je L6
    inc inc dword ptr [ebp - 4]
    mov mov edi, dword ptr [eax + 12]
    add add edx, 4
    cmp cmp dword ptr [ebp - 4], edi
    jb L5
    mov mov eax, dword ptr [eax + 8]
    mov mov ecx, dword ptr [ebp - 4]
L1:
    lea lea edi, [eax + ecx*4]
    test test byte ptr [esi + 111], 1
    mov mov edx, dword ptr [edi]
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov dword ptr [ebp - 4], edi
    je L7
    fldz fldz
    jmp L8
    fld fld qword ptr [g_1019BEB0]
    mov mov ecx, dword ptr [esi + 16]
    fstp fstp qword ptr [ebp - 36]
    mov mov edi, dword ptr [eax + 4]
    mov mov ecx, dword ptr [ecx + edi*4]
    mov mov ecx, dword ptr [ecx + 4]
    test test ch, 1
    je L17
    cmp cmp dword ptr [eax + 8], -1
    jne L19
    fld fld qword ptr [ebp - 36]
    fadd fadd qword ptr [eax + 32]
    call sub_100F9261
    mov mov ecx, dword ptr [esi + 8]
    and and dword ptr [ebp - 4], 0
    mov mov edi, eax
    add add edi, dword ptr [ebx + 12]
    test test ecx, ecx
    jbe L14
    mov mov eax, dword ptr [esi + 20]
    mov mov dword ptr [ebp - 12], eax
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebp - 8]
    je L9
    mov mov eax, dword ptr [ebp - 12]
    mov mov eax, dword ptr [eax]
    mov mov edx, dword ptr [eax + 4]
    cmp cmp edx, dword ptr [ebx + 4]
    jne L11
    cmp cmp dword ptr [eax + 8], -1
    jne L12
    cmp cmp dword ptr [eax + 12], edi
    jne L13
    mov mov edx, dword ptr [eax + 16]
    cmp cmp edx, dword ptr [ebx + 16]
    jne L15
L4:
    mov mov edx, dword ptr [eax + 20]
L5:
    cmp cmp edx, dword ptr [ebx + 20]
    jne L16
    mov mov eax, dword ptr [eax + 24]
    cmp cmp eax, dword ptr [ebx + 24]
    je L18
    inc inc dword ptr [ebp - 4]
    add add dword ptr [ebp - 12], 4
    cmp cmp dword ptr [ebp - 4], ecx
    jb L10
    jmp L20
    cmp cmp dword ptr [ebp - 16], 0
    jne L20
    mov mov ecx, esi
    call sub_1008B069
    mov mov dword ptr [ebp - 16], 1
    mov mov eax, dword ptr [ebp - 4]
    mov mov dword ptr [ebx + 48], eax
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [esi + 8]
    jne sub_1008CC8D
    or or dword ptr [ebx + 8], -1
    mov mov eax, dword ptr [ebx + 4]
    mov mov dword ptr [ebx + 12], edi
    mov mov ecx, dword ptr [esi + 16]
    mov mov eax, dword ptr [ecx + eax*4]
    cmp cmp edi, dword ptr [eax + 8]
L8:
    jb sub_1008CCA6
    push push 01010FA70h
    push push 0FA7h
    push push dword ptr [ebx + 96]
    push push esi
    call sub_1008B258
    add add esp, 16
    mov mov eax, 080004005h
    jmp sub_1008CCF6
    test test cl, 2
    je sub_1008CCD6
    mov mov eax, dword ptr [eax + 72]
    cmp cmp eax, -1
    je sub_1008CCE2
    mov mov ecx, dword ptr [esi + 24]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [eax]
    and and ecx, 0FFF00000h
    cmp cmp ecx, 020400000h
    jne sub_1008CCFC
    mov mov ebx, dword ptr [eax + 12]
    xor xor edi, edi
    test test ebx, ebx
    jbe sub_1008CC26
    mov mov ecx, dword ptr [eax + 16]
    cmp cmp dword ptr [ecx], edx
    je sub_1008CC2D
    inc inc edi
    add add ecx, 4
    cmp cmp edi, ebx
    jb sub_1008CC29
    mov mov eax, dword ptr [eax + 8]
    mov mov edx, dword ptr [eax + edi*4]
    mov mov ecx, dword ptr [esi + 20]
    add add ebx, edi
    mov mov edi, dword ptr [eax + ebx*4]
    mov mov eax, dword ptr [esi + 16]
    mov mov dword ptr [ebp - 24], edx
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov ebx, dword ptr [edx + 4]
    mov mov ebx, dword ptr [eax + ebx*4]
    test test byte ptr [ebx + 5], 1
    mov mov ecx, dword ptr [ecx + edi*4]
    je sub_1008CCAA
    cmp cmp dword ptr [edx + 8], -1
    jne sub_1008CCB0
    mov mov ebx, dword ptr [edx]
    test test bl, 4
    je sub_1008CCB7
    test test bl, 2
    jne sub_1008CCAA
    test test byte ptr [ecx], 2
    je sub_1008CCC1
    fld fld qword ptr [ebp - 36]
    fadd fadd qword ptr [edx + 32]
    call sub_100F93AB
    mov mov dword ptr [ebp - 12], eax
    mov mov eax, edi
    jmp sub_1008CD09
    mov mov edi, dword ptr [ecx + 4]
    mov mov eax, dword ptr [eax + edi*4]
    test test byte ptr [eax + 5], 1
    je sub_1008CD73
L9:
    cmp cmp dword ptr [ecx + 8], -1
L10:
    jne sub_1008CD79
    mov mov eax, dword ptr [ecx]
    test test al, 4
    je sub_1008CD7F
    test test byte ptr [edx], 2
    jne sub_1008CD19
    test test al, 2
L12:
    je sub_1008CD88
    fld fld qword ptr [ebp - 36]
L13:
    fadd fadd qword ptr [ecx + 32]
    call sub_100F93E2
L15:
    mov mov dword ptr [ebp - 12], eax
    mov mov eax, dword ptr [ebp - 24]
    mov mov edi, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [edi]
    mov mov ebx, dword ptr [ebp - 28]
    xor xor edx, edx
    cmp cmp ecx, ebx
    mov mov dword ptr [ebp - 24], eax
    jne sub_1008CD82
    cmp cmp dword ptr [esi + 8], edx
L17:
    jbe sub_1008CDA8
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + edx*4]
    cmp cmp ebx, dword ptr [ecx + 8]
    jne sub_1008CD8A
    mov mov edi, dword ptr [ebp - 12]
    add add dword ptr [ecx + 12], edi
    mov mov dword ptr [ecx + 8], eax
    inc inc edx
    cmp cmp edx, dword ptr [esi + 8]
    jb sub_1008CD85
    jmp sub_1008CDC4
    cmp cmp dword ptr [esi + 8], edx
    jbe sub_1008CDC7
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + edx*4]
    cmp cmp ebx, dword ptr [ecx + 8]
L20:
    jne sub_1008CDCC
    mov mov eax, dword ptr [ebp - 12]
    add add dword ptr [ecx + 12], eax
    mov mov eax, dword ptr [ebp - 24]
    inc inc edx
    cmp cmp edx, dword ptr [esi + 8]
    jb sub_1008CDC7
    mov mov dword ptr [edi], eax
    mov mov dword ptr [ebp - 12], 1
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [esi + 8]
    jb sub_1008CB52
    cmp cmp dword ptr [ebp - 12], 0
    jne sub_1008CE22
    xor xor eax, eax
    inc inc eax
    jmp sub_1008CE36
    cmp cmp dword ptr [ebp - 16], 0
    je sub_1008CE3A
    mov mov ecx, esi
    call sub_1008B221
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_1008c847 ENDP
END
