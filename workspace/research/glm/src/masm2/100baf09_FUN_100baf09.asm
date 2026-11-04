.686
.MODEL FLAT, C
EXTRN sub_1008544E:PROC
EXTRN sub_10085E0E:PROC
EXTRN sub_100861FE:PROC
EXTRN sub_10086218:PROC
EXTRN sub_100BB0DB:PROC
EXTRN sub_100BB0FD:PROC
EXTRN sub_100BB112:PROC
EXTRN sub_100BB145:PROC
EXTRN sub_100BB14A:PROC
EXTRN sub_100BB199:PROC
EXTRN sub_100BB1F4:PROC
EXTRN sub_100BB1FF:PROC
EXTRN sub_100BB217:PROC
.CODE
FUN_100baf09 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 12
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [eax + 16]
    mov mov eax, dword ptr [esi + 20]
    mov mov edx, dword ptr [ecx]
    mov mov edx, dword ptr [eax + edx*4]
    mov mov ebx, dword ptr [esi + 16]
    push push edi
    mov mov edi, dword ptr [edx + 4]
    mov mov edi, dword ptr [ebx + edi*4]
    test test byte ptr [edi + 4], 1
    je L0
    cmp cmp dword ptr [edx + 60], 0
    jne L1
    mov mov ecx, dword ptr [ecx + 4]
    mov mov ecx, dword ptr [eax + ecx*4]
    cmp cmp dword ptr [ecx + 60], 0
    je sub_100BB0DB
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [esi + 8], 0
    jbe L2
    mov mov edx, dword ptr [esi + 088h]
    mov mov edi, dword ptr [esi + 8]
    mov mov ecx, dword ptr [eax]
    cmp cmp edx, dword ptr [ecx + 4]
    jne L4
    mov mov ecx, dword ptr [ecx + 12]
    cmp cmp ecx, dword ptr [ebp - 8]
    jb L5
    inc inc ecx
    mov mov dword ptr [ebp - 8], ecx
    add add eax, 4
    dec dec edi
    jne L3
    push push 4
    push push 4
    push push 010000004h
    mov mov ecx, esi
    call sub_10086218
    cmp cmp eax, -1
    je sub_100BB0FD
    mov mov ecx, dword ptr [esi + 24]
    mov mov eax, dword ptr [ecx + eax*4]
    push push dword ptr [esi + 0100h]
    mov mov ecx, eax
    mov mov dword ptr [ebp - 12], eax
    call sub_1008544E
    test test eax, eax
    jl sub_100BB14A
    and and dword ptr [ebp - 4], 0
    mov mov edi, dword ptr [ebp - 4]
    fldz fldz
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push edi
    push push dword ptr [ebp - 8]
    mov mov ecx, esi
    push push dword ptr [esi + 088h]
    call sub_100861FE
L3:
    mov mov ebx, eax
    cmp cmp ebx, -1
    je sub_100BB145
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov eax, dword ptr [esi + 20]
    shl shl edi, 2
    mov mov ecx, dword ptr [edi + ecx]
    push push dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [eax + ebx*4]
    call sub_10085E0E
    test test eax, eax
    jl sub_100BB199
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov ecx, dword ptr [edi + ecx]
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ecx + 24]
    mov mov eax, dword ptr [eax + ebx*4]
    mov mov dword ptr [eax + 24], ecx
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov ecx, dword ptr [edi + ecx]
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ecx + 20]
    mov mov eax, dword ptr [eax + ebx*4]
    inc inc dword ptr [ebp - 4]
    cmp cmp dword ptr [ebp - 4], 4
    mov mov dword ptr [eax + 20], ecx
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [eax + 16]
    mov mov ecx, dword ptr [edi + ecx]
    mov mov eax, dword ptr [ebp - 12]
    mov mov edx, dword ptr [eax + 16]
    mov mov dword ptr [edi + edx], ecx
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov dword ptr [edi + ecx], ebx
    mov mov eax, dword ptr [eax + 8]
    mov mov dword ptr [edi + eax], ebx
    jb sub_100BB112
    mov mov eax, dword ptr [esi + 12]
    dec dec eax
    dec dec eax
    lea lea ecx, [esi + 0FCh]
    jmp sub_100BB1F4
    mov mov eax, 08007000Eh
    jmp sub_100BB217
    mov mov edx, dword ptr [esi + 24]
    lea lea edx, [edx + eax*4]
    mov mov edi, dword ptr [edx]
    mov mov dword ptr [edx + 4], edi
    dec dec eax
    cmp cmp eax, dword ptr [ecx]
    ja sub_100BB1FF
    mov mov eax, dword ptr [ecx]
    mov mov ecx, dword ptr [esi + 24]
    mov mov edx, dword ptr [ebp - 12]
    mov mov dword ptr [ecx + eax*4 + 4], edx
    mov mov dword ptr [esi + 018Ch], 1
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100baf09 ENDP
END
