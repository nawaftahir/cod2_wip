.686
.MODEL FLAT, C
EXTRN sub_1006C7E7:PROC
EXTRN sub_1006C809:PROC
EXTRN sub_1006C890:PROC
EXTRN sub_100856F4:PROC
EXTRN sub_10085791:PROC
EXTRN sub_10085B84:PROC
EXTRN sub_10085C1F:PROC
EXTRN sub_100B9A39:PROC
EXTRN sub_100B9A8A:PROC
EXTRN g_1019BEB8:DWORD
.CODE
FUN_100a8ea3 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000124h
    push edi
    mov edi, ecx
    mov eax, dword ptr [edi + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000104h
    mov dword ptr [ebp - 4], edi
    jb L0
    xor eax, eax
    inc eax
    jmp L34
L0:
    mov eax, dword ptr [edi + 000000100h]
    push ebx
    push esi
    xor ecx, ecx
    xor esi, esi
    push 3
    inc ecx
    pop ebx
    mov dword ptr [ebp - 24], esi
    mov dword ptr [ebp - 68], esi
    mov dword ptr [ebp - 64], ecx
    mov dword ptr [ebp - 60], 2
    mov dword ptr [ebp - 56], ebx
    mov eax, dword ptr [eax]
    and eax, 0000FFFFFh
    cmp eax, ebx
    jne L7
L1:
    push 0
    push ebx
    lea eax, [ebp - 68]
    push eax
    lea eax, [ebp - 0000000E4h]
    push eax
    lea eax, [ebp - 24]
    push eax
    lea eax, [ebp - 000000124h]
    push eax
    push dword ptr [esi*4 + 0101A3FA0h]
    mov ecx, edi
    push dword ptr [edi + 000000100h]
    call sub_100B9A39
    test eax, eax
    je L2
    inc esi
    cmp esi, 9
    jb L1
L2:
    and dword ptr [ebp - 16], 0
    and dword ptr [ebp - 20], 0
    cmp esi, 4
    jbe L3
    mov dword ptr [ebp - 20], 1
L3:
    test eax, eax
    je L8
    xor esi, esi
L4:
    push 0
    push ebx
    lea eax, [ebp - 68]
    push eax
    lea eax, [ebp - 0000000E4h]
    push eax
    lea eax, [ebp - 24]
    push eax
    lea eax, [ebp - 000000124h]
    push eax
    push dword ptr [esi*4 + 0101A3FC4h]
    mov ecx, edi
    push dword ptr [edi + 000000100h]
    call sub_100B9A8A
    test eax, eax
    je L5
    inc esi
    cmp esi, ebx
    jb L4
L5:
    and dword ptr [ebp - 20], 0
    xor ecx, ecx
    inc ecx
    cmp esi, ecx
    jbe L6
    mov dword ptr [ebp - 20], ecx
L6:
    test eax, eax
    mov dword ptr [ebp - 16], ecx
    je L8
L7:
    mov eax, ecx
    jmp L33
L8:
    and dword ptr [ebp - 12], 0
    mov ebx, dword ptr [edi + 20]
    mov dword ptr [ebp - 28], 12
    lea eax, [ebp - 52]
    sub dword ptr [ebp - 28], eax
L9:
    mov edx, dword ptr [ebp - 12]
    mov ecx, edx
    shl ecx, 2
    mov esi, dword ptr [ebp + ecx - 0000000D4h]
    mov eax, dword ptr [ebx + esi*4]
    cmp dword ptr [eax + 16], edx
    jne L21
    cmp dword ptr [ebp + 8], 0
    je L12
    cmp dword ptr [eax + 72], -1
    jne L21
    mov edi, dword ptr [eax + 4]
    mov ebx, dword ptr [ebp - 4]
    cmp edi, dword ptr [ebx + 000000080h]
    jne L21
    movzx edi, byte ptr [eax + 109]
    inc edx
    cmp edi, edx
    jne L21
    cmp byte ptr [eax + 108], 5
    jne L21
    cmp dword ptr [ebp - 20], 0
    mov dword ptr [ebp + ecx - 52], esi
    jne L10
    cmp dword ptr [eax + 60], 000080000h
    jne L21
    mov edi, dword ptr [eax + 56]
    lea ebx, [ebp + ecx - 0000000B4h]
    mov edx, dword ptr [ebx]
    cmp edx, edi
    mov dword ptr [ebp - 8], edi
    jne L15
    mov eax, dword ptr [ebp + ecx - 0000000A4h]
    mov esi, dword ptr [ebx - 16]
    cmp eax, esi
    jne L15
    lea edx, [ebp + ecx - 000000094h]
    mov eax, dword ptr [edx]
    cmp eax, dword ptr [ebx + 48]
    jne L15
    cmp dword ptr [ebp + ecx - 0000000A4h], eax
    je L17
    jmp L15
L10:
    cmp dword ptr [eax + 60], 0
    jne L21
    lea ebx, [ebp + ecx - 0000000B4h]
    cmp dword ptr [ebx], esi
    jne L11
    mov edi, dword ptr [ebp + ecx - 0000000A4h]
    mov esi, dword ptr [ebx - 16]
    cmp edi, esi
    jne L11
    lea edx, [ebp + ecx - 000000094h]
    mov eax, dword ptr [edx]
    cmp eax, dword ptr [ebx + 48]
    jne L11
    cmp edi, eax
    je L17
L11:
    mov eax, dword ptr [ebp + ecx - 0000000D4h]
    cmp dword ptr [ebp + ecx - 0000000A4h], eax
    jmp L16
L12:
    cmp dword ptr [ebp - 20], 0
    je L13
    mov edx, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 4]
    mov edx, dword ptr [edx + 16]
    mov eax, dword ptr [edx + eax*4]
    test byte ptr [eax + 5], 2
    je L21
    lea edx, [ebp + ecx - 52]
    mov dword ptr [edx], esi
    jmp L14
L13:
    mov eax, dword ptr [eax + 72]
    cmp eax, -1
    je L21
    mov esi, dword ptr [ebp - 4]
    mov edx, dword ptr [esi + 24]
    mov eax, dword ptr [edx + eax*4]
    cmp dword ptr [eax], 020500003h
    jne L21
    mov eax, dword ptr [eax + 8]
    mov edx, dword ptr [ecx + eax]
    mov esi, dword ptr [esi + 16]
    mov dword ptr [ebp - 8], edx
    mov edx, dword ptr [ebx + edx*4]
    mov edi, dword ptr [edx + 4]
    mov edi, dword ptr [esi + edi*4]
    test byte ptr [edi + 5], 2
    je L21
    mov edi, dword ptr [ebp - 12]
    cmp dword ptr [edx + 16], edi
    jne L21
    mov edi, dword ptr [ebp - 28]
    add edi, eax
    lea edx, [ebp + ecx - 52]
    mov eax, dword ptr [edi + edx]
    mov ebx, dword ptr [ebx + eax*4]
    mov eax, dword ptr [ebx + 4]
    mov eax, dword ptr [esi + eax*4]
    test byte ptr [eax + 5], 1
    je L21
    fld qword ptr [g_1019BEB8]
    fld qword ptr [ebx + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jp L21
    mov eax, dword ptr [ebp - 8]
    mov dword ptr [edx], eax
L14:
    mov edi, dword ptr [edx]
    lea ebx, [ebp + ecx - 0000000B4h]
    mov eax, dword ptr [ebx]
    cmp eax, edi
    mov dword ptr [ebp - 8], edi
    jne L15
    mov eax, dword ptr [ebp + ecx - 0000000A4h]
    mov esi, dword ptr [ebx - 16]
    cmp eax, esi
    jne L15
    lea edx, [ebp + ecx - 000000094h]
    mov eax, dword ptr [edx]
    cmp eax, dword ptr [ebx + 48]
    jne L15
    cmp dword ptr [ebp + ecx - 0000000A4h], eax
    je L17
L15:
    cmp dword ptr [ebp + ecx - 0000000A4h], edi
L16:
    jne L21
    mov edi, dword ptr [ebx]
    mov esi, dword ptr [ebx - 16]
    cmp edi, esi
    jne L21
    lea edx, [ebp + ecx - 000000094h]
    mov eax, dword ptr [edx]
    cmp eax, dword ptr [ebx + 48]
    jne L21
    cmp edi, eax
    jne L21
L17:
    cmp dword ptr [ebp - 16], 0
    mov dword ptr [ebp + ecx - 40], esi
    je L18
    cmp eax, dword ptr [edx + 32]
    jne L21
L18:
    mov eax, dword ptr [ebp - 4]
    mov ebx, dword ptr [eax + 20]
    mov eax, dword ptr [ebx + esi*4]
    mov eax, dword ptr [eax + 16]
    cmp eax, dword ptr [ebp - 12]
    jne L21
    inc dword ptr [ebp - 12]
    cmp dword ptr [ebp - 12], 3
    jb L9
    xor esi, esi
    xor eax, eax
    cmp dword ptr [ebp - 24], esi
    jbe L20
L19:
    mov ecx, dword ptr [ebp + eax*4 - 000000124h]
    inc eax
    mov dword ptr [ecx], esi
    cmp eax, dword ptr [ebp - 24]
    jb L19
L20:
    push 116
    call sub_10085B84
    cmp eax, esi
    je L22
    mov ecx, eax
    call sub_100856F4
    mov ebx, eax
    jmp L23
L21:
    xor eax, eax
    inc eax
    jmp L33
L22:
    xor ebx, ebx
L23:
    cmp ebx, esi
    jne L24
    mov eax, 08007000Eh
    jmp L33
L24:
    cmp dword ptr [ebp + 8], esi
    push esi
    mov esi, dword ptr [ebp - 4]
    mov eax, dword ptr [esi + 000000100h]
    push dword ptr [eax + 12]
    mov ecx, ebx
    je L25
    push 6
    push 072C00003h
    jmp L26
L25:
    push 9
    push 072D00003h
L26:
    call sub_10085C1F
    mov edi, eax
    test edi, edi
    mov ecx, ebx
    jge L27
    push 1
    call sub_1006C7E7
    mov eax, edi
    jmp L33
L27:
    push dword ptr [esi + 000000100h]
    call sub_10085791
    test eax, eax
    mov dword ptr [ebp - 16], eax
    jge L28
    push 1
    mov ecx, ebx
    call sub_1006C809
    jmp L32
L28:
    mov edx, dword ptr [ebp - 4]
    mov eax, dword ptr [edx + 000000100h]
    mov ecx, dword ptr [eax + 12]
    mov esi, dword ptr [eax + 16]
    mov edi, dword ptr [ebx + 16]
    shl ecx, 2
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    push 12
    pop eax
    lea ecx, [ebp - 40]
    lea esi, [ebp - 52]
    sub ecx, eax
    sub esi, eax
    mov dword ptr [ebp - 8], esi
L29:
    cmp dword ptr [ebp + 8], 0
    mov esi, dword ptr [edx + 000000100h]
    mov esi, dword ptr [esi + 8]
    mov edi, dword ptr [ebx + 8]
    mov esi, dword ptr [esi]
    mov dword ptr [eax + edi - 12], esi
    mov esi, dword ptr [ebx + 8]
    mov edi, dword ptr [ecx + eax]
    mov dword ptr [eax + esi], edi
    jne L30
    mov edi, dword ptr [ebp - 8]
    mov esi, dword ptr [ebx + 8]
    mov edi, dword ptr [edi + eax]
    mov dword ptr [eax + esi + 12], edi
L30:
    add eax, 4
    cmp eax, 24
    jb L29
    mov ecx, dword ptr [edx + 24]
    lea esi, [edx + 0000000FCh]
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [ecx + eax*4]
    test ecx, ecx
    je L31
    push 1
    call sub_1006C890
    mov edx, dword ptr [ebp - 4]
L31:
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [edx + 24]
    mov dword ptr [ecx + eax*4], ebx
L32:
    mov eax, dword ptr [ebp - 16]
L33:
    pop esi
    pop ebx
L34:
    pop edi
    leave
    ret 4
FUN_100a8ea3 ENDP
END
