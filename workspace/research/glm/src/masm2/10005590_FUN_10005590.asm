.686
.MODEL FLAT, C
EXTRN sub_10005698:PROC
EXTRN sub_100056E2:PROC
EXTRN EXTRN fp_101D49DC:DWORD:DWORD
.CODE
FUN_10005590 PROC
    sub sub esp, 96
    push push ebx
    push push ebp
    push push edi
    mov mov edi, eax
    xor xor eax, eax
    lea lea ecx, [esp + 16]
    mov mov edi, edi
    test test al, 1
    je L0
    fld fld dword ptr [edx]
    jmp L1
    fld fld dword ptr [edi]
    test test al, 2
    fstp fstp dword ptr [ecx - 4]
    je L2
    fld fld dword ptr [edx + 4]
    jmp L3
    fld fld dword ptr [edi + 4]
    test test al, 4
    fstp fstp dword ptr [ecx]
    je L5
    fld fld dword ptr [edx + 8]
L1:
    jmp L6
    fld fld dword ptr [edi + 8]
    fstp fstp dword ptr [ecx + 4]
    inc inc eax
    add add ecx, 12
    cmp cmp eax, 8
    jl L4
    xor xor ebp, ebp
    jmp L7
L2:
    lea lea esp, [esp]
    mov mov edi, edi
    mov mov eax, dword ptr [ebp + 0101924CCh]
    mov mov ecx, dword ptr [esi + 52]
    lea lea edi, [eax + eax*2]
    mov mov eax, dword ptr [ebp + 0101924C8h]
    lea lea ebx, [eax + eax*2]
    mov mov eax, dword ptr [esi + 56]
    inc inc ecx
    cmp cmp ecx, eax
L6:
    lea lea edi, [esp + edi*4 + 12]
    lea lea ebx, [esp + ebx*4 + 12]
    jg sub_100056E2
    mov mov ecx, dword ptr [esi + 48]
    test test ecx, ecx
    jne sub_10005698
    imul imul eax, eax, 44
    push push eax
    call dword ptr [fp_101D49DC]
    add add esp, 4
    mov mov dword ptr [esi + 48], eax
    mov mov eax, dword ptr [esi + 52]
    mov mov ecx, dword ptr [esi + 48]
    imul imul eax, eax, 44
    mov mov edx, dword ptr [ebx]
L7:
    add add eax, ecx
    mov mov ecx, dword ptr [ebx + 4]
    mov mov dword ptr [eax], edx
    mov mov edx, dword ptr [ebx + 8]
    mov mov dword ptr [eax + 4], ecx
    mov mov ecx, dword ptr [edi]
    mov mov dword ptr [eax + 8], edx
    mov mov edx, dword ptr [edi + 4]
    mov mov dword ptr [eax + 12], ecx
    mov mov ecx, dword ptr [edi + 8]
    mov mov dword ptr [eax + 20], ecx
    mov mov ecx, dword ptr [esp + 112]
    mov mov dword ptr [eax + 16], edx
    mov mov edx, dword ptr [ecx]
    mov mov dword ptr [eax + 24], edx
    mov mov edx, dword ptr [ecx + 4]
    mov mov dword ptr [eax + 28], edx
    mov mov edx, dword ptr [ecx + 8]
    mov mov dword ptr [eax + 32], edx
    mov mov ecx, dword ptr [ecx + 12]
    mov mov dword ptr [eax + 36], ecx
    mov mov dword ptr [eax + 40], 0
    inc inc dword ptr [esi + 52]
    add add ebp, 8
    cmp cmp ebp, 96
FUN_10005590 ENDP
END
