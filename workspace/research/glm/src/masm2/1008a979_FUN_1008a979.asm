.686
.MODEL FLAT, C
EXTRN sub_1008A965:PROC
EXTRN sub_1008AC5D:PROC
EXTRN sub_1008AC97:PROC
EXTRN sub_1008ACD9:PROC
EXTRN sub_1008ACDB:PROC
EXTRN sub_1008ACE7:PROC
EXTRN sub_1008AD29:PROC
EXTRN sub_1008AD2C:PROC
EXTRN sub_1008AD35:PROC
EXTRN sub_1008AD3F:PROC
EXTRN sub_1008AD62:PROC
EXTRN sub_1008AD67:PROC
EXTRN sub_1008AD6D:PROC
EXTRN sub_1008ADEA:PROC
EXTRN sub_1008ADF0:PROC
EXTRN sub_1008AE06:PROC
EXTRN sub_1008AE65:PROC
EXTRN sub_1008AE78:PROC
EXTRN sub_1008AE7D:PROC
EXTRN sub_1008AE7E:PROC
EXTRN sub_1008AE84:PROC
EXTRN sub_1008AEA9:PROC
EXTRN sub_1008AEC0:PROC
EXTRN sub_1008AEC5:PROC
EXTRN sub_1008AEEC:PROC
EXTRN sub_100F7940:PROC
EXTRN sub_100F7B2A:PROC
.CODE
FUN_1008a979 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 12
    push push ebx
    push push esi
    mov mov esi, ecx
    xor xor ebx, ebx
    xor xor ecx, ecx
    cmp cmp dword ptr [esi + 4], ebx
    push push edi
    jbe L0
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + ecx*4]
    or or dword ptr [eax + 40], -1
    inc inc ecx
    mov mov dword ptr [eax + 44], ebx
    mov mov dword ptr [eax + 48], ebx
    mov mov dword ptr [eax + 32], ebx
    cmp cmp ecx, dword ptr [esi + 4]
    jb L0
    xor xor ecx, ecx
    cmp cmp dword ptr [esi + 8], ebx
    jbe L2
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    or or edx, -1
    mov mov dword ptr [eax + 52], ecx
    inc inc ecx
    mov mov dword ptr [eax + 84], edx
    mov mov dword ptr [eax + 88], ebx
    mov mov dword ptr [eax + 92], ebx
    mov mov dword ptr [eax + 72], edx
    mov mov dword ptr [eax + 76], edx
    mov mov dword ptr [eax + 80], edx
    cmp cmp ecx, dword ptr [esi + 8]
    jb L2
    cmp cmp dword ptr [esi + 0DCh], ebx
    mov mov dword ptr [ebp - 12], ebx
    je L10
    xor xor eax, eax
    cmp cmp dword ptr [esi + 4], ebx
    jbe L3
    mov mov ecx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ecx + eax*4]
    inc inc eax
    mov mov dword ptr [ecx + 16], ebx
    cmp cmp eax, dword ptr [esi + 4]
    jb L3
    xor xor edi, edi
    cmp cmp dword ptr [esi + 8], ebx
    jbe L4
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [eax + edi*4]
    mov mov edx, dword ptr [esi + 16]
    mov mov eax, dword ptr [ecx + 4]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov edx, dword ptr [eax + 4]
    test test dl, 64
    jne L5
    test test dl, 2
    je L6
    mov mov ecx, dword ptr [ecx + 12]
    inc inc ecx
    cmp cmp dword ptr [eax + 16], ecx
    jae L7
    mov mov dword ptr [eax + 16], ecx
    inc inc edi
    cmp cmp edi, dword ptr [esi + 8]
    jb L4
    mov mov edx, dword ptr [esi + 4]
    xor xor eax, eax
    cmp cmp edx, ebx
    jbe L8
    mov mov ecx, dword ptr [esi + 16]
    mov mov edi, dword ptr [ecx]
    add add eax, dword ptr [edi + 16]
    add add ecx, 4
    dec dec edx
    jne L9
    shl shl eax, 4
    mov mov edi, eax
    push push edi
    call sub_100F7940
    cmp cmp eax, ebx
    pop pop ecx
    mov mov dword ptr [ebp - 12], eax
    jne L11
    mov mov eax, 08007000Eh
    jmp sub_1008AD29
    mov mov ecx, edi
    mov mov edi, dword ptr [ebp - 12]
    mov mov edx, ecx
L3:
    shr shr ecx, 2
    or or eax, -1
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    xor xor ecx, ecx
    xor xor edx, edx
    cmp cmp dword ptr [esi + 4], ebx
    jbe L13
    mov mov eax, dword ptr [esi + 16]
    mov mov edi, dword ptr [esi + 16]
    mov mov edi, dword ptr [edi + edx*4]
    mov mov edi, dword ptr [edi + 16]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov ebx, ecx
    shl shl ebx, 4
    add add ebx, dword ptr [ebp - 12]
    neg neg edi
    sbb sbb edi, edi
    and and edi, ebx
    mov mov dword ptr [eax + 32], edi
    mov mov eax, dword ptr [esi + 16]
    mov mov edi, dword ptr [eax + edx*4]
    add add ecx, dword ptr [edi + 16]
    inc inc edx
    cmp cmp edx, dword ptr [esi + 4]
    jb L14
    xor xor ebx, ebx
    cmp cmp dword ptr [esi + 12], ebx
    mov mov dword ptr [ebp - 4], ebx
    jbe sub_1008ACD9
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov edi, dword ptr [eax + ecx*4]
    cmp cmp edi, ebx
    je sub_1008ACDB
    test test word ptr [edi + 2], 0FFF0h
    je sub_1008ACE7
    cmp cmp dword ptr [edi + 4], 0
    jbe sub_1008AC5D
    push push dword ptr [ebp - 4]
    mov mov eax, dword ptr [edi + 8]
    push push dword ptr [eax + ebx*4]
    mov mov ecx, esi
    call sub_1008A965
    inc inc ebx
    cmp cmp ebx, dword ptr [edi + 4]
    jb sub_1008AC5D
    xor xor ebx, ebx
    cmp cmp dword ptr [edi + 12], ebx
    jbe sub_1008AC97
    push push dword ptr [ebp - 4]
    mov mov eax, dword ptr [edi + 16]
    push push dword ptr [eax + ebx*4]
    mov mov ecx, esi
    call L1
    inc inc ebx
    cmp cmp ebx, dword ptr [edi + 12]
    jb sub_1008AC97
    mov mov eax, dword ptr [edi]
    and and eax, 0FFF00000h
L10:
    cmp cmp eax, 010000000h
    jne sub_1008AD2C
    test test byte ptr [esi + 0CCh], 4
    jne sub_1008AD35
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [edi + 12], 0
    jbe sub_1008AD3F
    mov mov edx, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [edi + 16]
    mov mov ebx, dword ptr [edi + 8]
    mov mov eax, dword ptr [esi + 20]
    shl shl edx, 2
    mov mov ecx, dword ptr [edx + ecx]
    mov mov edx, dword ptr [edx + ebx]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [ecx + 4]
    mov mov ebx, dword ptr [esi + 16]
    mov mov edx, dword ptr [ebx + edx*4]
    mov mov edx, dword ptr [edx + 4]
    test test dx, 01020h
    jne sub_1008AD62
    test test dl, 1
    je sub_1008AD67
    cmp cmp dword ptr [eax + 60], 0
L12:
    jne sub_1008AD6D
    mov mov ebx, dword ptr [eax + 52]
    mov mov edx, dword ptr [ecx + 52]
    mov mov dword ptr [ecx + 52], ebx
    mov mov dword ptr [eax + 52], edx
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [edi + 12]
    jb sub_1008AD3F
    xor xor ebx, ebx
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [esi + 12]
    jb sub_1008ACD9
    xor xor edi, edi
    cmp cmp dword ptr [esi + 8], ebx
    jbe sub_1008ADEA
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + edi*4]
    mov mov edx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [eax + 4]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov edx, dword ptr [ecx + 40]
    cmp cmp dword ptr [eax + 84], edx
    jbe sub_1008ADF0
    mov mov dword ptr [eax + 84], edx
    mov mov ecx, dword ptr [ecx + 44]
L14:
    cmp cmp dword ptr [eax + 88], ecx
    jae sub_1008AE06
    mov mov dword ptr [eax + 88], ecx
    inc inc edi
    cmp cmp edi, dword ptr [esi + 8]
    jb sub_1008ADEA
    cmp cmp dword ptr [esi + 0DCh], ebx
    je sub_1008AE7D
    xor xor edi, edi
    cmp cmp dword ptr [esi + 8], ebx
    jbe sub_1008AE84
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ecx + edi*4]
    mov mov edx, dword ptr [eax + 76]
    cmp cmp edx, -1
    je sub_1008AE65
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [ecx + 88]
    mov mov dword ptr [eax + 76], edx
    mov mov ecx, dword ptr [ecx + 72]
    cmp cmp edx, ecx
    ja sub_1008AE78
    inc inc ecx
    mov mov dword ptr [eax + 76], ecx
    jmp sub_1008AE7E
    mov mov dword ptr [eax + 76], ebx
    mov mov ecx, dword ptr [eax + 80]
    cmp cmp ecx, -1
    je sub_1008AEA9
    mov mov edx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov edx, dword ptr [ecx + 84]
    mov mov dword ptr [eax + 80], edx
    mov mov ecx, dword ptr [ecx + 72]
    cmp cmp edx, ecx
    jbe sub_1008AEC0
    mov mov dword ptr [eax + 80], ecx
    jmp sub_1008AEC5
    or or dword ptr [eax + 80], -1
    inc inc edi
    cmp cmp edi, dword ptr [esi + 8]
    jb sub_1008AE84
    cmp cmp dword ptr [esi + 0D8h], ebx
    je sub_1008AEEC
    mov mov ecx, esi
    call L12
    push push dword ptr [ebp - 12]
    call sub_100F7B2A
    pop pop ecx
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_1008a979 ENDP
END
