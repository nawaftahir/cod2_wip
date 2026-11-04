.686
.MODEL FLAT, C
EXTRN sub_100F78D9:PROC
EXTRN sub_100F792E:PROC
EXTRN sub_100F91BC:PROC
EXTRN g_1010FF34:DWORD
EXTRN g_1019BC80:DWORD
.CODE
FUN_10081b8a PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 16
    mov eax, dword ptr [ebp + 8]
    push ebx
    push esi
    push edi
    mov ebx, ecx
    lea esi, [eax + 1]
L0:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L0
    mov ecx, dword ptr [ebx + 16]
    sub eax, esi
    mov edi, eax
    mov eax, dword ptr [ebx + 20]
    sub eax, edi
    dec eax
    add ecx, 4
    cmp ecx, eax
    mov dword ptr [ebp - 16], edi
    jbe L6
    mov esi, dword ptr [ebx + 8]
    fild dword ptr [ebx + 8]
    test esi, esi
    jge L1
    fadd dword ptr [g_1019BC80]
L1:
    fmul dword ptr [g_1010FF34]
    call sub_100F91BC
    lea ecx, [esi + edi]
    cmp ecx, eax
    mov dword ptr [ebp - 4], ecx
    ja L2
    mov dword ptr [ebp - 4], eax
L2:
    mov edi, dword ptr [ebp - 4]
    lea eax, [edi + 3]
    shr eax, 2
    shl eax, 2
    push eax
    call sub_100F78D9
    mov edx, eax
    test edx, edx
    pop ecx
    mov dword ptr [ebp - 8], edx
    jne L3
    mov eax, 08007000Eh
    jmp L8
L3:
    mov esi, dword ptr [ebx + 20]
    mov ecx, dword ptr [ebx + 12]
    sub ecx, esi
    add ecx, dword ptr [ebx + 8]
    sub edx, ecx
    mov eax, ecx
    add edx, edi
    shr ecx, 2
    mov edi, edx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov esi, dword ptr [ebp - 8]
    mov eax, dword ptr [ebx + 12]
    mov dword ptr [ebp - 12], edx
    sub edx, dword ptr [ebx + 20]
    jmp L5
L4:
    mov ecx, dword ptr [eax]
    add ecx, edx
    mov dword ptr [esi], ecx
    add esi, 4
    add eax, 4
L5:
    cmp eax, dword ptr [ebx + 16]
    jb L4
    push dword ptr [ebx + 12]
    call sub_100F792E
    mov eax, dword ptr [ebp - 8]
    mov dword ptr [ebx + 12], eax
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [ebx + 8], eax
    mov eax, dword ptr [ebp - 12]
    pop ecx
    mov dword ptr [ebx + 16], esi
    mov dword ptr [ebx + 20], eax
L6:
    mov ecx, dword ptr [ebp + 8]
    or eax, 0FFFFFFFFh
    sub eax, dword ptr [ebp - 16]
    add dword ptr [ebx + 20], eax
    mov eax, dword ptr [ebx + 20]
    mov edx, eax
L7:
    mov al, byte ptr [ecx]
    inc ecx
    mov byte ptr [edx], al
    inc edx
    test al, al
    jne L7
    mov eax, dword ptr [ebx + 16]
    mov ecx, dword ptr [ebx + 20]
    mov dword ptr [eax], ecx
    add dword ptr [ebx + 16], 4
    xor eax, eax
L8:
    pop edi
    pop esi
    pop ebx
    leave
    ret 4
FUN_10081b8a ENDP
END
