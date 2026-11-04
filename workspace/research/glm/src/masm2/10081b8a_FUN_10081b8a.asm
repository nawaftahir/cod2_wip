.686
.MODEL FLAT, C
EXTRN sub_10081C9E:PROC
EXTRN sub_10081CF6:PROC
EXTRN sub_10081CFB:PROC
EXTRN sub_10081D15:PROC
EXTRN sub_10081D74:PROC
EXTRN sub_100F78D9:PROC
EXTRN sub_100F792E:PROC
EXTRN sub_100F91BC:PROC
EXTRN EXTRN g_1010FF34:DWORD:DWORD
EXTRN EXTRN g_1019BC80:DWORD:DWORD
.CODE
FUN_10081b8a PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 16
    mov mov eax, dword ptr [ebp + 8]
    push push ebx
    push push esi
    push push edi
    mov mov ebx, ecx
    lea lea esi, [eax + 1]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne L0
    mov mov ecx, dword ptr [ebx + 16]
    sub sub eax, esi
    mov mov edi, eax
    mov mov eax, dword ptr [ebx + 20]
    sub sub eax, edi
    dec dec eax
    add add ecx, 4
    cmp cmp ecx, eax
    mov mov dword ptr [ebp - 16], edi
    jbe sub_10081C9E
    mov mov esi, dword ptr [ebx + 8]
    fild fild dword ptr [ebx + 8]
    test test esi, esi
    jge L1
    fadd fadd dword ptr [g_1019BC80]
    fmul fmul dword ptr [g_1010FF34]
    call sub_100F91BC
    lea lea ecx, [esi + edi]
    cmp cmp ecx, eax
    mov mov dword ptr [ebp - 4], ecx
    ja L2
    mov mov dword ptr [ebp - 4], eax
    mov mov edi, dword ptr [ebp - 4]
    lea lea eax, [edi + 3]
    shr shr eax, 2
    shl shl eax, 2
    push push eax
    call sub_100F78D9
    mov mov edx, eax
    test test edx, edx
    pop pop ecx
    mov mov dword ptr [ebp - 8], edx
    jne L3
    mov mov eax, 08007000Eh
    jmp sub_10081D15
    mov mov esi, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [ebx + 12]
    sub sub ecx, esi
    add add ecx, dword ptr [ebx + 8]
    sub sub edx, ecx
    mov mov eax, ecx
    add add edx, edi
    shr shr ecx, 2
    mov mov edi, edx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov esi, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebx + 12]
    mov mov dword ptr [ebp - 12], edx
    sub sub edx, dword ptr [ebx + 20]
    jmp sub_10081CF6
    mov mov ecx, dword ptr [eax]
    add add ecx, edx
    mov mov dword ptr [esi], ecx
    add add esi, 4
    add add eax, 4
    cmp cmp eax, dword ptr [ebx + 16]
    jb sub_10081CFB
    push push dword ptr [ebx + 12]
    call sub_100F792E
    mov mov eax, dword ptr [ebp - 8]
    mov mov dword ptr [ebx + 12], eax
    mov mov eax, dword ptr [ebp - 4]
    mov mov dword ptr [ebx + 8], eax
    mov mov eax, dword ptr [ebp - 12]
    pop pop ecx
    mov mov dword ptr [ebx + 16], esi
    mov mov dword ptr [ebx + 20], eax
    mov mov ecx, dword ptr [ebp + 8]
    or or eax, -1
    sub sub eax, dword ptr [ebp - 16]
    add add dword ptr [ebx + 20], eax
    mov mov eax, dword ptr [ebx + 20]
    mov mov edx, eax
    mov mov al, byte ptr [ecx]
    inc inc ecx
    mov mov byte ptr [edx], al
    inc inc edx
    test test al, al
    jne sub_10081D74
    mov mov eax, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov dword ptr [eax], ecx
    add add dword ptr [ebx + 16], 4
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 4
FUN_10081b8a ENDP
END
