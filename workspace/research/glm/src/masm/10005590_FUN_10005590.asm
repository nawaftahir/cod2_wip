.686
.MODEL FLAT, C
EXTRN fp_101D49DC:DWORD
.CODE
FUN_10005590 PROC
    sub esp, 96
    push ebx
    push ebp
    push edi
    mov edi, eax
    xor eax, eax
    lea ecx, [esp + 16]
    mov edi, edi
L0:
    test al, 1
    je L1
    fld dword ptr [edx]
    jmp L2
L1:
    fld dword ptr [edi]
L2:
    test al, 2
    fstp dword ptr [ecx - 4]
    je L3
    fld dword ptr [edx + 4]
    jmp L4
L3:
    fld dword ptr [edi + 4]
L4:
    test al, 4
    fstp dword ptr [ecx]
    je L5
    fld dword ptr [edx + 8]
    jmp L6
L5:
    fld dword ptr [edi + 8]
L6:
    fstp dword ptr [ecx + 4]
    inc eax
    add ecx, 12
    cmp eax, 8
    jl L0
    xor ebp, ebp
    jmp L7
    lea esp, [esp]
    mov edi, edi
L7:
    mov eax, dword ptr [ebp + 0101924CCh]
    mov ecx, dword ptr [esi + 52]
    lea edi, [eax + eax*2]
    mov eax, dword ptr [ebp + 0101924C8h]
    lea ebx, [eax + eax*2]
    mov eax, dword ptr [esi + 56]
    inc ecx
    cmp ecx, eax
    lea edi, [esp + edi*4 + 12]
    lea ebx, [esp + ebx*4 + 12]
    jg L9
    mov ecx, dword ptr [esi + 48]
    test ecx, ecx
    jne L8
    imul eax, eax, 44
    push eax
    call dword ptr [fp_101D49DC]
    add esp, 4
    mov dword ptr [esi + 48], eax
L8:
    mov eax, dword ptr [esi + 52]
    mov ecx, dword ptr [esi + 48]
    imul eax, eax, 44
    mov edx, dword ptr [ebx]
    add eax, ecx
    mov ecx, dword ptr [ebx + 4]
    mov dword ptr [eax], edx
    mov edx, dword ptr [ebx + 8]
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [edi]
    mov dword ptr [eax + 8], edx
    mov edx, dword ptr [edi + 4]
    mov dword ptr [eax + 12], ecx
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [eax + 20], ecx
    mov ecx, dword ptr [esp + 112]
    mov dword ptr [eax + 16], edx
    mov edx, dword ptr [ecx]
    mov dword ptr [eax + 24], edx
    mov edx, dword ptr [ecx + 4]
    mov dword ptr [eax + 28], edx
    mov edx, dword ptr [ecx + 8]
    mov dword ptr [eax + 32], edx
    mov ecx, dword ptr [ecx + 12]
    mov dword ptr [eax + 36], ecx
    mov dword ptr [eax + 40], 0
    inc dword ptr [esi + 52]
L9:
    add ebp, 8
    cmp ebp, 96
FUN_10005590 ENDP
END
