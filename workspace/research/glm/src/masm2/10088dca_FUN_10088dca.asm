.686
.MODEL FLAT, C
EXTRN sub_100853E3:PROC
EXTRN sub_1008545E:PROC
EXTRN sub_10085E45:PROC
EXTRN sub_10086222:PROC
EXTRN sub_10086225:PROC
EXTRN sub_100862A7:PROC
EXTRN sub_1008842B:PROC
EXTRN sub_100886AD:PROC
EXTRN sub_10088F8E:PROC
EXTRN sub_10088FDB:PROC
EXTRN sub_10089004:PROC
EXTRN sub_10089011:PROC
EXTRN sub_10089014:PROC
EXTRN sub_10089103:PROC
.CODE
FUN_10088dca PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 12
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    push push esi
    mov mov ebx, ecx
    call sub_100862A7
    cmp cmp eax, -1
    jne L0
    mov mov eax, 08007000Eh
    jmp sub_10088F8E
    mov mov ecx, dword ptr [ebx + 24]
    push push edi
    mov mov edi, dword ptr [ecx + eax*4]
    push push esi
    mov mov ecx, edi
    call sub_100853E3
    mov mov esi, dword ptr [esi + 12]
    and and dword ptr [ebp - 4], 0
    test test esi, esi
    jbe L1
L0:
    mov mov eax, dword ptr [ebp + 8]
    mov mov eax, dword ptr [eax + 16]
    mov mov ecx, dword ptr [eax]
    mov mov dword ptr [ebp - 12], ecx
    mov mov dword ptr [ebp - 8], eax
    mov mov eax, dword ptr [ebp - 8]
    push push dword ptr [eax]
    mov mov ecx, ebx
    push push dword ptr [ebp - 12]
    call sub_1008842B
    test test eax, eax
    je L3
    inc inc dword ptr [ebp - 4]
    add add dword ptr [ebp - 8], 4
    cmp cmp dword ptr [ebp - 4], esi
    jb L2
    cmp cmp dword ptr [ebp - 4], esi
    je sub_10088FDB
    push push -1
    and and esi, 0FFFFFh
    push push -1
    or or esi, 010000000h
    push push esi
    mov mov ecx, ebx
    call sub_10086225
    cmp cmp eax, -1
    jne L4
    mov mov eax, 08007000Eh
    jmp sub_10089004
    mov mov ecx, dword ptr [ebx + 24]
    mov mov esi, dword ptr [ecx + eax*4]
    push push dword ptr [ebp + 8]
    mov mov ecx, esi
    mov mov dword ptr [ebp - 8], esi
L1:
    call sub_1008545E
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [edi + 12], 0
    jbe sub_10089014
    mov mov ecx, dword ptr [ebp - 8]
    fldz fldz
    mov mov ecx, dword ptr [ecx + 16]
    mov mov esi, dword ptr [ebp - 4]
    mov mov eax, dword ptr [edi + 16]
L3:
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    shl shl esi, 2
    mov mov eax, dword ptr [esi + eax]
    push push -1
    mov mov dword ptr [esi + ecx], eax
    push push -1
    push push dword ptr [ebx + 088h]
    mov mov ecx, ebx
    call sub_10086222
    mov mov ecx, dword ptr [ebp - 8]
    mov mov edx, dword ptr [ecx + 8]
    mov mov dword ptr [esi + edx], eax
    mov mov eax, dword ptr [ecx + 8]
    mov mov eax, dword ptr [esi + eax]
    mov mov ecx, dword ptr [edi + 16]
    mov mov dword ptr [esi + ecx], eax
    mov mov eax, dword ptr [edi + 16]
    cmp cmp dword ptr [esi + eax], -1
    je L5
    mov mov ecx, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov ecx, dword ptr [esi + ecx]
    mov mov eax, dword ptr [ebx + 20]
    push push dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [edi + 16]
    mov mov ecx, dword ptr [esi + ecx]
    mov mov ecx, dword ptr [eax + ecx*4]
    call sub_10085E45
    mov mov eax, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov ecx, dword ptr [esi + ecx]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ecx + 20]
    mov mov edx, dword ptr [edi + 16]
    mov mov edx, dword ptr [esi + edx]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov dword ptr [eax + 20], ecx
    mov mov ecx, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov ecx, dword ptr [esi + ecx]
    mov mov eax, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [edi + 16]
    mov mov edx, dword ptr [esi + edx]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov ecx, dword ptr [ecx + 24]
    inc inc dword ptr [ebp - 4]
    mov mov dword ptr [eax + 24], ecx
    mov mov ecx, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov eax, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [esi + ecx]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [edi + 16]
    mov mov edx, dword ptr [esi + edx]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov ecx, dword ptr [ecx]
    mov mov dword ptr [eax], ecx
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [edi + 12]
    jb sub_10089011
    mov mov esi, dword ptr [ebp - 8]
    push push esi
    mov mov ecx, ebx
    call sub_100886AD
    test test eax, eax
L5:
    jl sub_10089103
    and and dword ptr [esi], 0
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 4
FUN_10088dca ENDP
END
