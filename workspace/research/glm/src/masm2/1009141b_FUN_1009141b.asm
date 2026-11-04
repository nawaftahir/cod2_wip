.686
.MODEL FLAT, C
EXTRN sub_10085558:PROC
EXTRN sub_1008A778:PROC
EXTRN sub_1008A789:PROC
EXTRN sub_1008A7B2:PROC
EXTRN sub_1008A7D8:PROC
EXTRN sub_1008A989:PROC
EXTRN sub_1009164C:PROC
EXTRN sub_10091658:PROC
EXTRN sub_10091694:PROC
EXTRN sub_100916A1:PROC
EXTRN sub_100916A4:PROC
EXTRN sub_100916BA:PROC
EXTRN sub_10091705:PROC
EXTRN sub_10091714:PROC
EXTRN sub_1009174C:PROC
EXTRN sub_10091787:PROC
EXTRN sub_10091788:PROC
EXTRN sub_1009179A:PROC
EXTRN sub_100917B1:PROC
EXTRN sub_100917D5:PROC
EXTRN sub_100917E2:PROC
EXTRN sub_100917EA:PROC
EXTRN sub_100917F2:PROC
.CODE
FUN_1009141b PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 48
    push push edi
    mov mov edi, ecx
    call sub_1008A989
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [edi + 12], 0
    jbe sub_1009164C
    push push ebx
    push push esi
    mov mov ecx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [edi + 24]
    mov mov esi, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ebp - 4], ecx
    and and dword ptr [ebp - 4], 0FFF00000h
    je sub_10091658
    mov mov eax, dword ptr [esi + 4]
    mov mov ebx, ecx
    and and ebx, 0FFFFFh
    xor xor edx, edx
    div div ebx
    cmp cmp dword ptr [ebp - 4], 050000000h
    mov mov dword ptr [ebp - 24], eax
    jne L0
    push push 1
    push push ebx
    lea lea eax, [ebp - 48]
    push push eax
    mov mov eax, dword ptr [esi + 8]
    lea lea eax, [eax + ebx*4]
    push push eax
    mov mov ecx, edi
    call sub_1008A778
    push push 0
    push push ebx
    lea lea eax, [ebp - 48]
    push push eax
    push push dword ptr [esi + 8]
    mov mov ecx, edi
    call sub_1008A789
    jmp L1
    and and ecx, 0F0000000h
    cmp cmp ecx, 010000000h
    jb L2
    cmp cmp ecx, 040000000h
    ja L3
    push push 1
    push push ebx
    lea lea eax, [ebp - 48]
    push push eax
    push push dword ptr [esi + 16]
    mov mov ecx, edi
    call sub_1008A7B2
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [ebp - 24], 0
    jbe L4
    mov mov ecx, dword ptr [esi + 8]
    push push 0
    push push ebx
    lea lea eax, [ebp - 48]
    push push eax
    mov mov eax, dword ptr [esi + 12]
    imul imul eax, dword ptr [ebp - 4]
    lea lea eax, [ecx + eax*4]
    push push eax
    mov mov ecx, edi
    call sub_1008A7D8
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebp - 24]
L0:
    jb L4
    mov mov eax, dword ptr [esi]
    and and eax, 0F0000000h
    cmp cmp eax, 020000000h
    jne sub_10091705
    mov mov ecx, esi
    call sub_10085558
    test test eax, eax
    je sub_10091714
    mov mov eax, dword ptr [esi + 8]
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [edi + 20]
    mov mov eax, dword ptr [eax + ebx*4]
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov eax, dword ptr [ecx + eax*4]
    or or dword ptr [ebp - 20], -1
    or or dword ptr [ebp - 4], -1
    test test ebx, ebx
    mov mov dword ptr [ebp - 32], edx
    mov mov dword ptr [ebp - 24], eax
    jbe sub_100916A1
    mov mov eax, dword ptr [esi + 8]
    mov mov dword ptr [ebp - 12], eax
    lea lea eax, [eax + ebx*4]
    mov mov edx, ecx
    mov mov dword ptr [ebp - 16], eax
    mov mov dword ptr [ebp - 28], ebx
    mov mov eax, dword ptr [ebp - 12]
    mov mov eax, dword ptr [eax]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [eax + 72]
    cmp cmp eax, dword ptr [ebp - 20]
    jae sub_10091694
    mov mov dword ptr [ebp - 20], eax
    mov mov eax, dword ptr [ebp - 16]
    mov mov eax, dword ptr [eax]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [eax + 72]
    cmp cmp eax, dword ptr [ebp - 4]
    jae sub_100916BA
    mov mov dword ptr [ebp - 4], eax
    add add dword ptr [ebp - 12], 4
    add add dword ptr [ebp - 16], 4
    dec dec dword ptr [ebp - 28]
    jne sub_100916A4
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp eax, dword ptr [ebp - 4]
    jb sub_10091787
L3:
    jne sub_1009174C
    mov mov eax, dword ptr [ebp - 24]
    mov mov eax, dword ptr [eax + 4]
    mov mov edx, dword ptr [ebp - 32]
    mov mov edx, dword ptr [edx + 4]
    shl shl edx, 2
    mov mov ecx, eax
    mov mov eax, dword ptr [edi + 16]
    mov mov dword ptr [ebp - 28], edx
    mov mov edx, dword ptr [edx + eax]
    mov mov edx, dword ptr [edx + 4]
    shl shl ecx, 2
    mov mov eax, dword ptr [eax + ecx]
    cmp cmp edx, dword ptr [eax + 4]
    jb sub_100917B1
    mov mov eax, dword ptr [edi + 16]
    mov mov edx, dword ptr [ebp - 28]
    mov mov edx, dword ptr [eax + edx]
    mov mov eax, dword ptr [eax + ecx]
    mov mov ecx, dword ptr [edx + 4]
    cmp cmp ecx, dword ptr [eax + 4]
    jne sub_10091788
    mov mov eax, dword ptr [ebp - 24]
    mov mov edx, dword ptr [ebp - 32]
    mov mov eax, dword ptr [eax + 4]
    mov mov ecx, dword ptr [edx + 4]
    cmp cmp ecx, eax
    jb sub_100917D5
    jne sub_1009179A
    mov mov eax, dword ptr [edx + 12]
    mov mov ecx, dword ptr [ebp - 24]
    cmp cmp eax, dword ptr [ecx + 12]
    jb sub_100917E2
    and and dword ptr [ebp - 4], 0
    test test ebx, ebx
    jbe sub_100917EA
    mov mov eax, ebx
    shl shl eax, 2
    mov mov dword ptr [ebp - 32], eax
    mov mov eax, dword ptr [esi + 8]
    mov mov ecx, dword ptr [ebp - 4]
    inc inc dword ptr [ebp - 4]
    lea lea ecx, [eax + ecx*4]
    mov mov edx, dword ptr [ecx]
    mov mov dword ptr [ebp - 28], edx
    mov mov edx, dword ptr [ebp - 32]
    mov mov eax, dword ptr [edx + eax]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [esi + 8]
    mov mov ecx, dword ptr [ebp - 28]
    mov mov dword ptr [edx + eax], ecx
    add add edx, 4
    cmp cmp dword ptr [ebp - 4], ebx
    mov mov dword ptr [ebp - 32], edx
    jb sub_100917F2
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [edi + 12]
    jb sub_1009164C
    pop pop esi
    pop pop ebx
    xor xor eax, eax
    pop pop edi
    leave leave
    ret ret
FUN_1009141b ENDP
END
