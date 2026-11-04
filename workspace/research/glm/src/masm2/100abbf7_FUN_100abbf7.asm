.686
.MODEL FLAT, C
EXTRN sub_10085F33:PROC
EXTRN sub_10085FE1:PROC
EXTRN sub_100863AE:PROC
EXTRN sub_10086452:PROC
EXTRN sub_100A7047:PROC
EXTRN sub_100A7056:PROC
EXTRN sub_100A70F8:PROC
EXTRN sub_100ABB34:PROC
EXTRN sub_100ABB55:PROC
EXTRN sub_100ABB77:PROC
EXTRN sub_100ABB99:PROC
EXTRN sub_100ABBBB:PROC
EXTRN sub_100ABBDD:PROC
EXTRN sub_100ABFE8:PROC
EXTRN sub_100ABFF9:PROC
EXTRN sub_100AC00C:PROC
EXTRN sub_100AC011:PROC
EXTRN sub_100AC03D:PROC
EXTRN sub_100AC054:PROC
EXTRN sub_100AC06C:PROC
EXTRN sub_100AC071:PROC
EXTRN sub_100AC090:PROC
EXTRN sub_100AC09A:PROC
EXTRN sub_100AC0E8:PROC
EXTRN sub_100AC109:PROC
EXTRN sub_100AC120:PROC
EXTRN sub_100AC12B:PROC
EXTRN sub_100AC144:PROC
EXTRN sub_100AC14D:PROC
EXTRN sub_100AC16F:PROC
EXTRN sub_100AC177:PROC
EXTRN sub_100AC184:PROC
EXTRN sub_100AC186:PROC
EXTRN sub_100AC191:PROC
EXTRN sub_100AC1C9:PROC
EXTRN sub_100AC21D:PROC
EXTRN sub_100AC24E:PROC
EXTRN sub_100AC263:PROC
EXTRN sub_100AC28F:PROC
EXTRN sub_100AC2E6:PROC
EXTRN sub_100AC2F2:PROC
EXTRN sub_100AC349:PROC
EXTRN sub_100AC357:PROC
EXTRN sub_100AC358:PROC
EXTRN sub_100AC365:PROC
EXTRN sub_100AC3A5:PROC
.CODE
FUN_100abbf7 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 88
    mov mov eax, dword ptr [ebp + 8]
    push push ebx
    push push esi
    mov mov esi, ecx
    xor xor ebx, ebx
    push push edi
    xor xor ecx, ecx
    cmp cmp eax, ebx
    je L1
    lea lea edx, [eax - 1]
    inc inc ecx
    and and eax, edx
    cmp cmp ecx, 7
    jb L0
    cmp cmp ecx, 6
    ja sub_100ABFF9
    mov mov eax, dword ptr [esi + 0480h]
    mov mov edx, eax
    sub sub edx, ecx
    cmp cmp edx, 6
    ja sub_100AC00C
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], ebx
    mov mov dword ptr [ebp - 8], ebx
    mov mov dword ptr [ebp - 12], ebx
    jbe L3
    lea lea eax, [esi + 0450h]
    mov mov dword ptr [ebp - 16], eax
    mov mov eax, dword ptr [ebp - 16]
    mov mov ecx, dword ptr [eax]
    mov mov eax, dword ptr [esi + 24]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ebp - 12]
    mov mov edx, dword ptr [eax]
    xor xor ebx, ebx
    inc inc ebx
    shl shl ebx, cl
    mov mov ecx, dword ptr [ebp + 8]
    mov mov edi, edx
    and and edi, 0FFF00000h
    test test ecx, ebx
    je L2
    cmp cmp dword ptr [eax + 36], 1
    je sub_100AC054
    mov mov ecx, dword ptr [ebp - 8]
    inc inc dword ptr [ebp - 8]
    mov mov dword ptr [ebp + ecx*4 - 88], eax
    jmp L5
    cmp cmp edi, 011000000h
    je sub_100AC06C
    cmp cmp edi, 072100000h
    je L6
    mov mov ecx, dword ptr [eax + 8]
    and and edx, 0FFFFFh
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [edx + ecx*4]
    cmp cmp byte ptr [ecx + 108], 3
    jne sub_100AC090
    cmp cmp dword ptr [ecx + 60], 0
    jne sub_100AC09A
    mov mov ecx, dword ptr [ebp - 4]
    inc inc dword ptr [ebp - 4]
    mov mov dword ptr [ebp + ecx*4 - 64], eax
    inc inc dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 12]
    add add dword ptr [ebp - 16], 4
    cmp cmp eax, dword ptr [esi + 0480h]
    jb L4
    xor xor ebx, ebx
    push push 6
    pop pop ecx
    push push ebx
    push push dword ptr [ebp - 4]
    or or eax, -1
    lea lea edi, [ebp - 40]
    rep stosd rep stosd dword ptr es:[edi], eax
    lea lea eax, [ebp - 64]
    push push eax
    lea lea eax, [ebp - 40]
    push push eax
    push push dword ptr [esi + 022Ch]
    mov mov ecx, esi
    call sub_100ABB34
    test test eax, eax
    je sub_100AC0E8
    push push ebx
    push push dword ptr [ebp - 8]
    lea lea eax, [ebp - 88]
    push push eax
    lea lea eax, [ebp - 40]
    push push eax
    push push dword ptr [esi + 0230h]
    mov mov ecx, esi
    call sub_100ABB55
    test test eax, eax
    je sub_100AC109
    push push 1
    push push dword ptr [ebp - 4]
    lea lea eax, [ebp - 64]
    push push eax
    lea lea eax, [ebp - 40]
    push push eax
    push push dword ptr [esi + 022Ch]
    mov mov ecx, esi
    call sub_100ABB77
    test test eax, eax
    je sub_100AC12B
    push push 1
    push push dword ptr [ebp - 8]
    lea lea eax, [ebp - 88]
    push push eax
    lea lea eax, [ebp - 40]
L5:
    push push eax
    push push dword ptr [esi + 0230h]
    mov mov ecx, esi
    call sub_100ABB99
    test test eax, eax
    je sub_100AC14D
    push push 2
    push push dword ptr [ebp - 4]
    lea lea eax, [ebp - 64]
    push push eax
    lea lea eax, [ebp - 40]
    push push eax
    push push dword ptr [esi + 022Ch]
    mov mov ecx, esi
    call sub_100ABBBB
    test test eax, eax
    je sub_100AC16F
    push push 2
    push push dword ptr [ebp - 8]
    lea lea eax, [ebp - 88]
    push push eax
    lea lea eax, [ebp - 40]
    push push eax
    push push dword ptr [esi + 0230h]
    mov mov ecx, esi
    call sub_100ABBDD
    test test eax, eax
    je sub_100AC191
    cmp cmp dword ptr [ebp + 12], ebx
    jne sub_100AC186
    push push 6
    pop pop ecx
    xor xor eax, eax
    lea lea edi, [ebp - 88]
    rep stosd rep stosd dword ptr es:[edi], eax
    push push 6
    pop pop ecx
    lea lea edi, [ebp - 64]
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov dword ptr [ebp + 12], ebx
    xor xor edi, edi
    mov mov eax, dword ptr [esi + 022Ch]
    mov mov edx, dword ptr [edi + eax]
    cmp cmp edx, ebx
    jne sub_100ABFE8
    mov mov eax, dword ptr [esi + 0230h]
    cmp cmp dword ptr [edi + eax], ebx
    je sub_100AC184
    xor xor ecx, ecx
    cmp cmp edx, ebx
    mov mov dword ptr [ebp - 16], ebx
    je sub_100AC011
    mov mov ecx, dword ptr [edx]
    and and ecx, 0FFF00000h
    mov mov eax, dword ptr [esi + 0230h]
    mov mov eax, dword ptr [edi + eax]
    cmp cmp eax, ebx
    je sub_100AC03D
    mov mov eax, dword ptr [eax]
    and and eax, 0FFF00000h
    mov mov dword ptr [ebp - 16], eax
    push push ecx
    call sub_100A7047
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 12], eax
    jne sub_100AC071
    push push dword ptr [ebp - 16]
    call sub_100A7056
    test test eax, eax
    je sub_100AC1C9
    or or dword ptr [ebp + 8], -1
    cmp cmp dword ptr [ebp - 12], ebx
    je sub_100AC120
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [edx + 8]
    mov mov eax, dword ptr [eax]
    mov mov ebx, dword ptr [ecx + eax*4]
    fld fld qword ptr [ebx + 32]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push dword ptr [ebx + 16]
    mov mov ecx, esi
    push push dword ptr [ebx + 12]
    push push dword ptr [ebx + 4]
    call sub_100863AE
    cmp cmp eax, -1
    mov mov dword ptr [ebp + 8], eax
    je sub_100AC24E
    mov mov edx, dword ptr [esi + 022Ch]
    mov mov edx, dword ptr [edi + edx]
    xor xor ecx, ecx
    test test dword ptr [edx], 0FFFFFh
    jbe sub_100AC144
    mov mov edx, dword ptr [esi + 022Ch]
    mov mov edx, dword ptr [edi + edx]
    mov mov edx, dword ptr [edx + 8]
    mov mov dword ptr [edx + ecx*4], eax
    mov mov edx, dword ptr [esi + 022Ch]
    mov mov edx, dword ptr [edi + edx]
    mov mov edx, dword ptr [edx]
    inc inc ecx
    and and edx, 0FFFFFh
    cmp cmp ecx, edx
    jb sub_100AC144
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    push push ebx
    mov mov ecx, eax
    mov mov dword ptr [ebp + edi - 88], ebx
    mov mov dword ptr [ebp - 8], eax
    call sub_10085F33
    mov mov eax, dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ebp - 8]
    mov mov dword ptr [ecx + 12], eax
    push push dword ptr [ebp - 16]
    call sub_100A70F8
    test test eax, eax
    je sub_100AC263
    cmp cmp dword ptr [ebp + 8], -1
    mov mov eax, dword ptr [esi + 0230h]
    mov mov eax, dword ptr [edi + eax]
    mov mov eax, dword ptr [eax + 8]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [esi + 20]
    mov mov ebx, dword ptr [ecx + eax*4]
    jne sub_100AC21D
    fld fld qword ptr [ebx + 32]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push dword ptr [ebx + 16]
    mov mov ecx, esi
    push push dword ptr [ebx + 12]
    push push dword ptr [ebx + 4]
    call sub_10086452
    cmp cmp eax, -1
    mov mov dword ptr [ebp + 8], eax
    je sub_100AC2F2
    mov mov ecx, dword ptr [esi + 0230h]
    mov mov ecx, dword ptr [edi + ecx]
    xor xor eax, eax
    test test dword ptr [ecx], 0FFFFFh
    jbe sub_100AC28F
    mov mov ecx, dword ptr [esi + 0230h]
    mov mov ecx, dword ptr [edi + ecx]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov edx, dword ptr [ebp + 8]
    mov mov dword ptr [ecx + eax*4], edx
    mov mov ecx, dword ptr [esi + 0230h]
    mov mov ecx, dword ptr [edi + ecx]
    mov mov ecx, dword ptr [ecx]
    inc inc eax
    and and ecx, 0FFFFFh
    cmp cmp eax, ecx
    jb sub_100AC28F
    cmp cmp dword ptr [ebp - 12], 0
    mov mov dword ptr [ebp + edi - 64], ebx
    jne sub_100AC2E6
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [eax + ecx*4]
    push push ebx
    mov mov dword ptr [ebp - 16], ecx
    call sub_10085FE1
    mov mov eax, dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ebp - 16]
    mov mov dword ptr [ecx + 12], eax
    cmp cmp dword ptr [ebp + 8], -1
    je sub_100AC358
    xor xor ebx, ebx
    inc inc dword ptr [ebp + 12]
    add add edi, 4
    cmp cmp edi, 24
    jb sub_100AC177
    xor xor eax, eax
    mov mov ecx, dword ptr [ebp + eax - 88]
    cmp cmp ecx, ebx
    je sub_100AC349
    mov mov edx, dword ptr [esi + 116]
    mov mov dword ptr [ecx + 4], edx
    mov mov ecx, dword ptr [ebp + eax - 64]
    cmp cmp ecx, ebx
    je sub_100AC365
    mov mov edx, dword ptr [esi + 116]
    mov mov dword ptr [ecx + 4], edx
    add add eax, 4
    cmp cmp eax, 24
    jb sub_100AC357
    push push 6
    pop pop eax
    mov mov dword ptr [esi + 0220h], eax
    mov mov dword ptr [esi + 0224h], eax
    xor xor eax, eax
    inc inc eax
    jmp sub_100AC3A5
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
FUN_100abbf7 ENDP
END
