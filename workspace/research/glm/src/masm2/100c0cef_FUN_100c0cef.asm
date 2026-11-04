.686
.MODEL FLAT, C
EXTRN sub_1006C6D1:PROC
EXTRN sub_10085486:PROC
EXTRN sub_100854F8:PROC
EXTRN sub_10085916:PROC
EXTRN sub_1008598F:PROC
EXTRN sub_10085D60:PROC
EXTRN sub_10086325:PROC
EXTRN sub_1008633F:PROC
EXTRN sub_100B9A11:PROC
EXTRN sub_100B9A3F:PROC
EXTRN sub_100C1008:PROC
EXTRN sub_100C1042:PROC
EXTRN sub_100C1055:PROC
EXTRN sub_100C106E:PROC
EXTRN sub_100C1084:PROC
EXTRN sub_100C1090:PROC
EXTRN sub_100C10C2:PROC
EXTRN sub_100C10D4:PROC
EXTRN sub_100C10EC:PROC
EXTRN sub_100C10F7:PROC
EXTRN sub_100C11AA:PROC
EXTRN sub_100C11B4:PROC
EXTRN sub_100C1216:PROC
EXTRN sub_100C1230:PROC
EXTRN sub_100C1240:PROC
EXTRN sub_100C125A:PROC
.CODE
FUN_100c0cef PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0104h
    push push ebx
    push push esi
    push push edi
    mov mov ebx, ecx
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov esi, dword ptr [eax]
    xor xor ecx, ecx
    mov mov dword ptr [ebp - 8], ecx
    mov mov dword ptr [ebp - 36], ecx
    xor xor edi, edi
    mov mov dword ptr [ebp - 12], ecx
    inc inc edi
    push push edi
    and and esi, 0FFFFFh
    push push esi
    lea lea ecx, [ebp - 36]
    push push ecx
    lea lea ecx, [ebp - 0C4h]
    push push ecx
    lea lea ecx, [ebp - 8]
    push push ecx
    lea lea ecx, [ebp - 0104h]
    push push ecx
    push push 010119C58h
    push push eax
    mov mov ecx, ebx
    mov mov dword ptr [ebp - 32], edi
    mov mov dword ptr [ebp - 28], 2
    mov mov dword ptr [ebp - 24], 3
    call sub_100B9A11
    test test eax, eax
    je L0
    push push edi
    push push esi
    lea lea eax, [ebp - 36]
    push push eax
    lea lea eax, [ebp - 0C4h]
    push push eax
    lea lea eax, [ebp - 8]
    push push eax
    lea lea eax, [ebp - 0104h]
    push push eax
    push push 010119CB8h
    push push dword ptr [ebx + 0100h]
    mov mov ecx, ebx
    call sub_100B9A3F
    test test eax, eax
    jne sub_100C1042
    mov mov dword ptr [ebp - 12], edi
    mov mov eax, dword ptr [ebp - 0104h]
    cmp cmp dword ptr [eax], 050000002h
    jne sub_100C1055
    cmp cmp esi, edi
    mov mov dword ptr [ebp - 4], edi
    jbe L2
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov eax, dword ptr [eax + 8]
    mov mov ecx, dword ptr [eax]
    mov mov dword ptr [ebp - 16], ecx
    lea lea ecx, [esi*4 + 4]
    lea lea edx, [eax + 4]
    jmp L1
    xor xor edi, edi
    inc inc edi
    mov mov eax, dword ptr [ebp - 16]
    cmp cmp dword ptr [edx], eax
    jne sub_100C1084
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov eax, dword ptr [eax + 8]
    mov mov edi, dword ptr [ecx + eax]
    cmp cmp edi, dword ptr [eax + esi*4]
    jne L4
    inc inc dword ptr [ebp - 4]
    add add edx, 4
    add add ecx, 4
    cmp cmp dword ptr [ebp - 4], esi
    jb L3
    push push 116
    call sub_10085916
    test test eax, eax
    je L5
    mov mov ecx, eax
    call sub_10085486
    mov mov dword ptr [ebp - 4], eax
    jmp L6
    xor xor edi, edi
    inc inc edi
    jmp sub_100C10C2
    and and dword ptr [ebp - 4], 0
    mov mov ecx, dword ptr [ebp - 4]
    push push 0
    push push esi
    push push 6
    push push 070800002h
    call sub_1008598F
    mov mov edi, eax
    test test edi, edi
    jl sub_100C10D4
    push push dword ptr [ebx + 0100h]
    mov mov ecx, dword ptr [ebp - 4]
    call sub_100854F8
    mov mov edi, eax
    test test edi, edi
    jl sub_100C10EC
    cmp cmp dword ptr [ebp - 12], 0
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov ecx, esi
    mov mov esi, dword ptr [eax + 16]
    mov mov eax, dword ptr [ebp - 4]
    mov mov edi, dword ptr [eax + 16]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, dword ptr [ebp - 0C4h]
    mov mov edi, eax
    mov mov eax, dword ptr [edi + 8]
    mov mov dword ptr [eax], ecx
    mov mov ecx, dword ptr [ebp - 0C0h]
    mov mov dword ptr [eax + 4], ecx
    jne sub_100C1008
    mov mov ecx, dword ptr [ebp - 0B4h]
    mov mov eax, dword ptr [edi + 8]
    mov mov dword ptr [eax + 8], ecx
    mov mov ecx, dword ptr [ebp - 0B0h]
    jmp sub_100C10F7
    mov mov eax, dword ptr [ebp - 0B4h]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov edx, dword ptr [ebp - 0B0h]
    mov mov esi, dword ptr [ecx + edx*4]
    mov mov dword ptr [ebp - 20], eax
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [eax + 56]
    cmp cmp ecx, -1
    mov mov dword ptr [ebp - 12], edx
    je sub_100C106E
    mov mov eax, dword ptr [ebx + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov dword ptr [ebp - 20], ecx
    mov mov ecx, dword ptr [esi + 56]
    cmp cmp ecx, -1
    je sub_100C1090
    mov mov edx, dword ptr [ebx + 20]
    mov mov esi, dword ptr [edx + ecx*4]
    mov mov dword ptr [ebp - 12], ecx
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push dword ptr [eax + 16]
    mov mov ecx, ebx
    push push dword ptr [eax + 12]
    push push dword ptr [eax + 4]
    call sub_10086325
    fldz fldz
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push dword ptr [esi + 16]
    mov mov ecx, ebx
    push push dword ptr [esi + 12]
    mov mov dword ptr [ebp - 16], eax
    push push dword ptr [esi + 4]
    call sub_1008633F
    mov mov dword ptr [ebp - 8], eax
    mov mov eax, dword ptr [ebp - 16]
    cmp cmp eax, -1
    je sub_100C11AA
    cmp cmp dword ptr [ebp - 8], -1
    je sub_100C11B4
    mov mov esi, dword ptr [ebx + 20]
    mov mov edx, dword ptr [ebp - 20]
    shl shl eax, 2
    mov mov esi, dword ptr [eax + esi]
    mov mov ecx, 080000h
L6:
    xor xor edx, ecx
    mov mov dword ptr [esi + 60], edx
    mov mov edx, dword ptr [ebp - 8]
    mov mov esi, dword ptr [ebp - 12]
    shl shl edx, 2
    xor xor esi, ecx
    mov mov ecx, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [edx + ecx]
    mov mov dword ptr [ecx + 60], esi
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [eax + ecx]
    mov mov ecx, dword ptr [ebp - 20]
    mov mov dword ptr [eax + 56], ecx
    mov mov eax, dword ptr [ebx + 20]
    mov mov eax, dword ptr [edx + eax]
    mov mov ecx, dword ptr [ebp - 12]
    mov mov dword ptr [eax + 56], ecx
    mov mov eax, dword ptr [edi + 8]
    mov mov ecx, dword ptr [ebp - 16]
    mov mov dword ptr [eax + 8], ecx
    mov mov eax, dword ptr [edi + 8]
    mov mov ecx, dword ptr [ebp - 8]
    mov mov dword ptr [eax + 12], ecx
    mov mov ecx, dword ptr [edi + 8]
    mov mov eax, dword ptr [ebp - 0A4h]
    mov mov dword ptr [ecx + 16], eax
    mov mov ecx, dword ptr [edi + 8]
    mov mov dword ptr [ecx + 20], eax
    mov mov eax, dword ptr [ebx]
    push push edi
    mov mov ecx, ebx
    call call dword ptr [eax + 48]
    test test eax, eax
    je sub_100C1216
    xor xor edi, edi
    inc inc edi
    jmp sub_100C1230
    mov mov ecx, dword ptr [ebx + 0100h]
    push push edi
    call sub_10085D60
    mov mov edi, eax
    jmp sub_100C1240
    mov mov edi, 08007000Eh
    mov mov ecx, dword ptr [ebp - 4]
    test test ecx, ecx
    je sub_100C125A
    push push 1
    call sub_1006C6D1
    mov mov eax, edi
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100c0cef ENDP
END
