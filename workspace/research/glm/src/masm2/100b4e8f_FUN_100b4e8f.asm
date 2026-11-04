.686
.MODEL FLAT, C
EXTRN sub_1008B20D:PROC
EXTRN sub_100B403E:PROC
EXTRN sub_100B5025:PROC
EXTRN sub_100B5040:PROC
EXTRN sub_100B504B:PROC
EXTRN sub_100B507E:PROC
EXTRN sub_100B5086:PROC
EXTRN sub_100B50DB:PROC
EXTRN sub_100B50EF:PROC
EXTRN sub_100B5101:PROC
EXTRN sub_100B5104:PROC
EXTRN sub_100B5133:PROC
EXTRN sub_100B5172:PROC
EXTRN sub_100B5173:PROC
.CODE
FUN_100b4e8f PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 36
    mov mov eax, dword ptr [ebp + 8]
    mov mov eax, dword ptr [eax]
    push push ebx
    mov mov ebx, ecx
    push push esi
    mov mov esi, dword ptr [ebx + 20]
    shl shl eax, 2
    mov mov edx, dword ptr [esi + eax]
    mov mov dword ptr [ebp - 4], edx
    mov mov edx, dword ptr [edx + 4]
    push push edi
    mov mov edi, dword ptr [ebx + 16]
    mov mov edx, dword ptr [edi + edx*4]
    xor xor ecx, ecx
    test test byte ptr [edx + 4], 080h
    je L0
    mov mov eax, dword ptr [ebp + 20]
    mov mov dword ptr [eax], 0E40000h
    jmp sub_100B504B
    mov mov edi, dword ptr [ebp + 16]
    xor xor edx, edx
    inc inc edx
    test test edi, 010000h
    je L1
    and and dword ptr [ebp - 20], 0
    mov mov ecx, edx
    test test edi, 020000h
    je L2
    mov mov dword ptr [ebp + ecx*4 - 20], edx
    inc inc ecx
    test test edi, 040000h
    je L3
    mov mov dword ptr [ebp + ecx*4 - 20], 2
    inc inc ecx
    test test edi, 080000h
    je L4
    mov mov dword ptr [ebp + ecx*4 - 20], 3
    inc inc ecx
    cmp cmp dword ptr [ebp + 12], ecx
    jbe L5
    mov mov dword ptr [ebp + 12], ecx
    mov mov ecx, dword ptr [ebx + 108]
    shl shl ecx, 30
    sar sar ecx, 31
    mov mov dword ptr [ebp + 16], ecx
    je L6
    or or eax, -1
    jmp L8
    xor xor edx, edx
    cmp cmp dword ptr [ebp + 12], edx
    jbe L9
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [ecx + eax]
    mov mov eax, dword ptr [eax + 16]
    mov mov edi, dword ptr [ebp + 8]
    mov mov edi, dword ptr [edi + edx*4]
    mov mov edi, dword ptr [ecx + edi*4]
    cmp cmp eax, dword ptr [edi + 16]
L2:
    jne L10
    inc inc edx
    cmp cmp edx, dword ptr [ebp + 12]
    jb L7
    cmp cmp edx, dword ptr [ebp + 12]
    jae sub_100B5025
    xor xor eax, eax
    mov mov dword ptr [ebp + eax*4 - 36], eax
    inc inc eax
    cmp cmp eax, 4
    jb sub_100B5025
    jmp sub_100B5040
    mov mov eax, dword ptr [ebp - 4]
L3:
    mov mov eax, dword ptr [eax + 16]
    lea lea edi, [ebp - 36]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 12], eax
    jbe sub_100B507E
    mov mov ecx, dword ptr [ebp + 8]
    lea lea edx, [ebp - 20]
    sub sub ecx, edx
    mov mov edi, dword ptr [ebp + eax*4 - 20]
    lea lea edx, [ecx + eax*4]
    mov mov edx, dword ptr [ebp + edx - 20]
    mov mov edx, dword ptr [esi + edx*4]
    mov mov edx, dword ptr [edx + 16]
    inc inc eax
    cmp cmp eax, dword ptr [ebp + 12]
    mov mov dword ptr [ebp + edi*4 - 36], edx
    jb sub_100B5086
    xor xor esi, esi
    cmp cmp dword ptr [ebp + 16], esi
    je sub_100B5101
    mov mov edi, 0101A4218h
    mov mov dword ptr [ebp + 12], edi
    push push dword ptr [ebp + 12]
    lea lea eax, [ebp - 36]
    push push eax
    mov mov ecx, ebx
    call sub_100B403E
    test test eax, eax
    jne sub_100B50EF
    add add dword ptr [ebp + 12], 16
    inc inc esi
    cmp cmp esi, 8
    jb sub_100B50DB
    jmp sub_100B5104
    shl shl esi, 4
    add add esi, edi
    mov mov eax, esi
    jne sub_100B5133
    mov mov eax, dword ptr [ebx + 0100h]
    push push 010117C18h
    push push 012D2h
    push push dword ptr [eax + 60]
    push push ebx
    call sub_1008B20D
    add add esp, 16
    mov mov eax, 080004005h
    jmp sub_100B5172
    lea lea eax, [ebp - 36]
    push push 16
    xor xor edx, edx
    pop pop ecx
L7:
    mov mov esi, dword ptr [eax]
    shl shl esi, cl
    add add eax, 4
    or or edx, esi
L8:
    inc inc ecx
L9:
    inc inc ecx
    cmp cmp ecx, 24
L10:
    jb sub_100B5173
    mov mov eax, dword ptr [ebp + 20]
    mov mov dword ptr [eax], edx
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 16
FUN_100b4e8f ENDP
END
