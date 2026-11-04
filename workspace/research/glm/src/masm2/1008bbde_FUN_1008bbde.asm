.686
.MODEL FLAT, C
EXTRN sub_10085580:PROC
EXTRN sub_10086189:PROC
EXTRN sub_1008631B:PROC
EXTRN sub_10086A0E:PROC
EXTRN sub_1008A990:PROC
EXTRN sub_1008AFB6:PROC
EXTRN sub_1008BE75:PROC
EXTRN sub_1008BE7E:PROC
EXTRN sub_1008BE8E:PROC
EXTRN sub_1008BE96:PROC
EXTRN sub_1008BE9E:PROC
EXTRN sub_1008BEB5:PROC
EXTRN sub_1008BEB6:PROC
EXTRN sub_1008BF06:PROC
EXTRN sub_1008BF52:PROC
EXTRN sub_1008BF62:PROC
EXTRN sub_1008BF80:PROC
EXTRN sub_1008BFAE:PROC
EXTRN sub_1008BFB1:PROC
EXTRN sub_1008BFB4:PROC
EXTRN sub_1008BFB7:PROC
EXTRN sub_1008BFD1:PROC
EXTRN sub_1008BFD4:PROC
EXTRN sub_1008BFD8:PROC
EXTRN sub_1008BFDC:PROC
EXTRN sub_1008BFE5:PROC
EXTRN sub_1008C033:PROC
EXTRN sub_1008C07E:PROC
EXTRN sub_1008C080:PROC
EXTRN sub_100F7908:PROC
EXTRN sub_100F7969:PROC
.CODE
FUN_1008bbde PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 36
    push push ebx
    push push esi
    xor xor ebx, ebx
    push push edi
    mov mov esi, ecx
    mov mov dword ptr [ebp - 12], ebx
    call sub_1008A990
    cmp cmp dword ptr [esi + 8], ebx
    mov mov dword ptr [ebp - 4], ebx
    jbe L3
    mov mov eax, dword ptr [esi + 20]
    mov mov edi, dword ptr [eax + ebx*4]
    mov mov eax, dword ptr [edi + 4]
    mov mov ecx, dword ptr [esi + 16]
    mov mov eax, dword ptr [ecx + eax*4]
    test test byte ptr [eax + 4], 32
    je L1
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push 0
    push push 0
    push push dword ptr [esi + 088h]
    mov mov ecx, esi
    call sub_10086189
    cmp cmp eax, -1
    mov mov dword ptr [edi + 48], eax
    je sub_1008BEB6
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [edi + 20]
    inc inc dword ptr [ebp - 4]
    mov mov dword ptr [eax + 20], ecx
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [edi + 48]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [edi + 24]
    mov mov dword ptr [eax + 24], ecx
    jmp L2
    mov mov dword ptr [edi + 48], ebx
    inc inc ebx
    cmp cmp ebx, dword ptr [esi + 8]
    jb L0
    cmp cmp dword ptr [ebp - 4], 0
    je L4
    mov mov ecx, esi
    call sub_1008AFB6
    mov mov eax, dword ptr [ebp - 4]
    shl shl eax, 2
    push push eax
    call sub_100F7908
    xor xor edi, edi
    cmp cmp eax, edi
    pop pop ecx
    mov mov dword ptr [ebp - 12], eax
    je sub_1008BF06
    xor xor eax, eax
    cmp cmp dword ptr [esi + 8], edi
    mov mov dword ptr [ebp - 4], edi
L1:
    jbe L5
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ecx + 4]
    mov mov edx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [edx + ecx*4]
    test test byte ptr [ecx + 4], 32
    je L6
    mov mov edx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ebp - 12]
    inc inc dword ptr [ebp - 4]
    mov mov dword ptr [ecx + edx*4], eax
    inc inc eax
    cmp cmp eax, dword ptr [esi + 8]
    jb L5
    push push esi
    push push dword ptr [ebp - 4]
    push push dword ptr [ebp - 12]
    push push 010086538h
    call sub_10086A0E
    xor xor edx, edx
    cmp cmp dword ptr [ebp - 4], edi
    mov mov dword ptr [ebp - 20], edx
    ja L7
    and and dword ptr [ebp - 24], 0
    push push dword ptr [ebp - 12]
    call sub_100F7969
    mov mov eax, dword ptr [ebp - 24]
    pop pop ecx
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
    mov mov edx, dword ptr [ebp - 20]
    mov mov eax, dword ptr [ebp - 12]
    lea lea edi, [eax + edx*4]
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [edi]
L3:
    mov mov ecx, dword ptr [eax + ecx*4]
    inc inc edx
    cmp cmp edx, dword ptr [ebp - 4]
    mov mov dword ptr [ebp - 36], edi
    mov mov dword ptr [ebp - 8], 1
    jae sub_1008BE75
    mov mov dword ptr [ebp - 16], edx
    lea lea edx, [edi + 4]
    mov mov dword ptr [ebp - 24], edx
    mov mov edx, dword ptr [ebp - 24]
    mov mov edx, dword ptr [edx]
    mov mov edx, dword ptr [eax + edx*4]
    mov mov ebx, dword ptr [ecx + 4]
    cmp cmp ebx, dword ptr [edx + 4]
    jne sub_1008BE8E
    mov mov ebx, dword ptr [ecx + 8]
    cmp cmp ebx, dword ptr [edx + 8]
    jne sub_1008BE96
    mov mov ebx, dword ptr [ecx + 12]
    cmp cmp ebx, dword ptr [edx + 12]
    jne sub_1008BE9E
    inc inc dword ptr [ebp - 8]
    inc inc dword ptr [ebp - 16]
    mov mov edx, dword ptr [ebp - 16]
    add add dword ptr [ebp - 24], 4
    cmp cmp edx, dword ptr [ebp - 4]
    jb sub_1008BE7E
    mov mov eax, dword ptr [ebp - 8]
    push push -1
    and and eax, 0FFFFFh
    push push -1
    or or eax, 010000000h
    push push eax
    mov mov ecx, esi
    call sub_1008631B
    cmp cmp eax, -1
    je sub_1008BFE5
    mov mov ecx, dword ptr [esi + 24]
    mov mov eax, dword ptr [ecx + eax*4]
    and and dword ptr [ebp - 32], 0
    cmp cmp dword ptr [ebp - 8], 0
    mov mov dword ptr [ebp - 16], eax
    jbe sub_1008BFB4
L6:
    mov mov dword ptr [ebp - 28], edi
    mov mov eax, dword ptr [ebp - 28]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ebx, dword ptr [eax + 48]
    mov mov eax, dword ptr [eax + 72]
    cmp cmp eax, -1
    je sub_1008BFB1
    mov mov ecx, dword ptr [esi + 24]
    mov mov edi, dword ptr [ecx + eax*4]
    cmp cmp dword ptr [edi + 60], 0
    je sub_1008BF80
    mov mov ecx, dword ptr [ebp - 16]
    push push edi
    call sub_10085580
    test test eax, eax
    mov mov dword ptr [ebp - 24], eax
    jl sub_1008BEB5
    mov mov eax, dword ptr [edi]
    and and eax, 0FFF00000h
    cmp cmp eax, 010000000h
    jne sub_1008BFDC
    mov mov ecx, dword ptr [edi + 12]
    xor xor eax, eax
    test test ecx, ecx
    jbe sub_1008BFD1
    mov mov edx, dword ptr [edi + 16]
    cmp cmp ebx, dword ptr [edx]
    je sub_1008BFD8
    inc inc eax
    add add edx, 4
    cmp cmp eax, ecx
    jb sub_1008BFD4
    mov mov ecx, dword ptr [edi + 8]
    mov mov ebx, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + ebx*4]
    mov mov eax, dword ptr [eax + 72]
    cmp cmp eax, -1
    jne sub_1008BFAE
    mov mov edi, dword ptr [ebp - 36]
    mov mov eax, dword ptr [ebp - 16]
    cmp cmp dword ptr [eax + 60], 0
    jne sub_1008C033
    inc inc dword ptr [ebp - 32]
    mov mov eax, dword ptr [ebp - 32]
    add add dword ptr [ebp - 28], 4
    cmp cmp eax, dword ptr [ebp - 8]
    jb sub_1008BFB7
    xor xor edx, edx
    cmp cmp dword ptr [ebp - 8], edx
    jbe sub_1008C07E
    mov mov eax, edi
    mov mov ecx, dword ptr [eax]
    mov mov edi, dword ptr [esi + 20]
    mov mov ecx, dword ptr [edi + ecx*4]
    mov mov ecx, dword ptr [ecx + 48]
    mov mov edi, dword ptr [ebp - 16]
    mov mov edi, dword ptr [edi + 8]
    mov mov dword ptr [edi + edx*4], ecx
    mov mov ecx, dword ptr [ebp - 16]
    mov mov edi, dword ptr [eax]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov dword ptr [ecx + edx*4], edi
    inc inc edx
    add add eax, 4
    cmp cmp edx, dword ptr [ebp - 8]
    jb sub_1008C080
    mov mov eax, dword ptr [ebp - 8]
    add add dword ptr [ebp - 20], eax
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp eax, dword ptr [ebp - 4]
    jb sub_1008BF62
    jmp sub_1008BF52
    mov mov dword ptr [ebp - 24], 08007000Eh
    jmp sub_1008BF62
FUN_1008bbde ENDP
END
