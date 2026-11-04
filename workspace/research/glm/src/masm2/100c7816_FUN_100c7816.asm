.686
.MODEL FLAT, C
EXTRN sub_10085E29:PROC
EXTRN sub_10085EF7:PROC
EXTRN sub_100862D7:PROC
EXTRN sub_100863DA:PROC
EXTRN sub_1008D837:PROC
EXTRN sub_100C1ECD:PROC
EXTRN sub_100C224E:PROC
EXTRN sub_100C22EE:PROC
EXTRN sub_100C2FCA:PROC
EXTRN sub_100C7B5E:PROC
EXTRN sub_100C7BEA:PROC
EXTRN sub_100C7BEC:PROC
EXTRN sub_100C7BF6:PROC
EXTRN sub_100C7C02:PROC
EXTRN sub_100C7C06:PROC
EXTRN sub_100C7C08:PROC
EXTRN sub_100C7C0E:PROC
EXTRN sub_100C7C18:PROC
EXTRN sub_100C7C28:PROC
EXTRN sub_100C7C7C:PROC
EXTRN sub_100C7C85:PROC
EXTRN sub_100C7C9B:PROC
EXTRN sub_100C7CDE:PROC
EXTRN sub_100C7CFA:PROC
EXTRN sub_100C7D0B:PROC
EXTRN sub_100C7D0C:PROC
EXTRN sub_100C7D1F:PROC
EXTRN sub_100C7D20:PROC
EXTRN sub_100C7D2A:PROC
EXTRN sub_100C7D3E:PROC
EXTRN sub_100C7D3F:PROC
EXTRN sub_100C7D4C:PROC
EXTRN sub_100C7D83:PROC
EXTRN sub_100C7D84:PROC
EXTRN sub_100C7DC7:PROC
EXTRN sub_100C7DE3:PROC
EXTRN sub_100C7DEC:PROC
EXTRN sub_100C7E20:PROC
EXTRN sub_100C7E44:PROC
EXTRN sub_100C7E52:PROC
EXTRN EXTRN g_1019BE20:DWORD:DWORD
.CODE
FUN_100c7816 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 010Ch
    push push ebx
    push push esi
    xor xor ebx, ebx
    mov mov esi, ecx
    xor xor eax, eax
    cmp cmp dword ptr [esi + 8], ebx
    push push edi
    mov mov dword ptr [ebp - 12], ebx
    jbe L0
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    or or dword ptr [ecx + 48], -1
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    or or dword ptr [ecx + 52], -1
    inc inc eax
    cmp cmp eax, dword ptr [esi + 8]
    jb L0
    mov mov eax, dword ptr [esi + 12]
    push push ebx
    push push ebx
    push push ebx
    push push 1
    push push eax
    push push ebx
    push push ebx
    push push ebx
    mov mov dword ptr [ebp - 8], eax
    lea lea eax, [ebp - 12]
    push push eax
    push push 1
    push push -1
    mov mov ecx, esi
    call sub_100C2FCA
    cmp cmp dword ptr [esi + 8], ebx
    jbe L4
    mov mov edx, dword ptr [esi + 20]
    mov mov ecx, ebx
    shl shl ecx, 2
    add add edx, ecx
    mov mov edi, dword ptr [edx]
    cmp cmp dword ptr [edi + 48], -1
    jne L1
    cmp cmp dword ptr [edi + 52], -1
    je L2
    mov mov edx, dword ptr [edx]
    mov mov edi, dword ptr [edx + 48]
    mov mov dword ptr [edx + 20], edi
    mov mov edx, dword ptr [esi + 20]
    mov mov edx, dword ptr [ecx + edx]
    mov mov edi, dword ptr [edx + 52]
    mov mov dword ptr [edx + 24], edi
    mov mov edx, dword ptr [esi + 20]
    mov mov edx, dword ptr [ecx + edx]
    or or dword ptr [edx + 48], -1
    mov mov edx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + edx]
    or or dword ptr [ecx + 52], -1
    inc inc ebx
    cmp cmp ebx, dword ptr [esi + 8]
    jb L3
    xor xor ebx, ebx
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp - 8], ebx
    jbe L5
    mov mov edx, dword ptr [esi + 24]
    mov mov edx, dword ptr [edx + ecx*4]
    inc inc ecx
    cmp cmp ecx, dword ptr [ebp - 8]
    mov mov dword ptr [edx], ebx
    jb L5
    cmp cmp eax, ebx
    jl sub_100C7BEC
    push push ebx
    push push ebx
    lea lea eax, [ebp - 08Ch]
    push push eax
    lea lea eax, [ebp - 010Ch]
    push push eax
    mov mov ecx, esi
    mov mov dword ptr [esi + 0FCh], ebx
    call sub_100C1ECD
    cmp cmp dword ptr [esi + 12], ebx
    mov mov dword ptr [ebp - 8], ebx
    jbe sub_100C7C08
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ebp - 8]
    mov mov edi, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [edi]
    mov mov ecx, eax
    and and eax, 0FFFFFh
    and and ecx, 0FFF00000h
    cmp cmp eax, 1
    jne sub_100C7C18
    or or ebx, -1
    cmp cmp ecx, 073000000h
    mov mov dword ptr [ebp - 12], ebx
    mov mov dword ptr [ebp - 4], ebx
    je sub_100C7BEA
    cmp cmp ecx, 073200000h
    je sub_100C7BF6
    cmp cmp ecx, 073100000h
    je sub_100C7C02
    cmp cmp ecx, 073300000h
    je sub_100C7C0E
    cmp cmp ecx, 073B00000h
    jne sub_100C7B5E
    mov mov eax, dword ptr [edi + 8]
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + 4]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [eax + 4]
    mov mov edx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [edx + ecx*4]
    test test byte ptr [ecx + 5], 1
    je sub_100C7C7C
    cmp cmp dword ptr [eax + 8], ebx
    jne sub_100C7C85
    fld fld qword ptr [g_1019BE20]
    fld fld qword ptr [eax + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_100C7C9B
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    xor xor eax, eax
    push push eax
    push push eax
    push push eax
    mov mov ecx, esi
    call sub_100862D7
    mov mov ecx, eax
    cmp cmp ecx, ebx
    mov mov dword ptr [ebp - 4], ecx
    je sub_100C7CDE
    mov mov edx, dword ptr [edi + 8]
    mov mov eax, dword ptr [esi + 20]
    mov mov edx, dword ptr [edx]
    mov mov edx, dword ptr [eax + edx*4]
    mov mov ebx, dword ptr [eax + ecx*4]
    push push edx
    mov mov ecx, ebx
    mov mov dword ptr [ebp - 12], edx
    call sub_10085E29
    test test eax, eax
    jl sub_100C7CFA
    push push dword ptr [ebp - 12]
    mov mov ecx, ebx
    call sub_10085EF7
    test test eax, eax
    jl sub_100C7D0C
    xor xor dword ptr [ebx + 60], 080000h
    mov mov eax, dword ptr [edi + 8]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov dword ptr [ebx + 56], eax
    mov mov eax, dword ptr [edi + 8]
    mov mov dword ptr [eax + 4], ecx
    jmp sub_100C7D0B
    cmp cmp ecx, 074200000h
    je sub_100C7C28
    cmp cmp ecx, 074100000h
    jne sub_100C7D1F
    mov mov eax, dword ptr [edi + 8]
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [eax + 4]
    mov mov edx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov ecx, dword ptr [ecx + 4]
    test test ch, 2
    je sub_100C7D3F
    mov mov edx, 040000h
    test test edx, ecx
    jne sub_100C7D4C
    lea lea ecx, [ebp - 4]
    push push ecx
    push push eax
    push push edx
    push push 01010E8ECh
    mov mov ecx, esi
    call sub_100C224E
    test test eax, eax
    jl sub_100C7D84
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [edi + 8]
    mov mov dword ptr [ecx], eax
    mov mov ecx, dword ptr [esi + 20]
    mov mov ebx, dword ptr [ecx + eax*4]
    xor xor eax, eax
    inc inc eax
    cmp cmp dword ptr [edi + 4], eax
    mov mov dword ptr [ebp - 4], eax
    jbe sub_100C7D83
    mov mov eax, dword ptr [edi + 8]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + ecx*4]
    cmp cmp eax, -1
    je sub_100C7D20
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [edx + eax*4]
    jmp sub_100C7D2A
    mov mov eax, ebx
    fld fld qword ptr [eax + 32]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ecx
    push push dword ptr [ebx + 12]
    mov mov ecx, esi
    push push dword ptr [ebx + 4]
    call sub_100863DA
    mov mov edx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [edi + 8]
    inc inc dword ptr [ebp - 4]
    mov mov dword ptr [ecx + edx*4], eax
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [edi + 4]
    jb sub_100C7D3E
    jmp sub_100C7DC7
    mov mov eax, dword ptr [edi + 8]
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [eax + 4]
    mov mov edx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov ecx, dword ptr [ecx + 4]
    test test ch, 2
    je sub_100C7DE3
    mov mov edx, 02000h
    test test edx, ecx
    jne sub_100C7DEC
    lea lea ecx, [ebp - 12]
    push push ecx
    push push eax
    push push edx
    push push 01010E8D8h
    mov mov ecx, esi
    call sub_100C22EE
    test test eax, eax
    jl sub_100C7E20
    mov mov eax, dword ptr [edi + 8]
    mov mov ecx, dword ptr [ebp - 12]
    mov mov dword ptr [eax], ecx
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [esi + 12]
    jb sub_100C7C06
    xor xor ebx, ebx
    mov mov ecx, esi
    call sub_1008D837
    cmp cmp eax, ebx
    jl sub_100C7E44
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
    mov mov eax, 08007000Eh
    jmp sub_100C7E52
FUN_100c7816 ENDP
END
