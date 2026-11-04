.686
.MODEL FLAT, C
EXTRN sub_100F877D:PROC
EXTRN sub_100F878C:PROC
EXTRN sub_100F8807:PROC
EXTRN sub_100F89CA:PROC
EXTRN sub_100F8A64:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FC638:PROC
EXTRN sub_100FC6CB:PROC
EXTRN sub_1010618D:PROC
EXTRN sub_10106227:PROC
EXTRN sub_10108271:PROC
EXTRN sub_101082D6:PROC
EXTRN sub_101082F1:PROC
EXTRN sub_1010A2E9:PROC
EXTRN sub_1010A2F1:PROC
EXTRN sub_1010A304:PROC
EXTRN sub_1010A326:PROC
EXTRN sub_1010A346:PROC
EXTRN sub_1010A380:PROC
EXTRN sub_1010A3D7:PROC
EXTRN sub_1010A3DD:PROC
EXTRN sub_1010A3EC:PROC
EXTRN sub_1010A413:PROC
EXTRN sub_1010A434:PROC
EXTRN sub_1010A43D:PROC
EXTRN sub_1010A443:PROC
EXTRN sub_1010A44A:PROC
EXTRN sub_1010A455:PROC
EXTRN sub_1010A465:PROC
EXTRN sub_1010A46A:PROC
EXTRN sub_1010A46B:PROC
EXTRN sub_1010A472:PROC
EXTRN sub_1010A4B4:PROC
EXTRN sub_1010A4C5:PROC
EXTRN sub_1010A4ED:PROC
EXTRN sub_1010A509:PROC
EXTRN sub_1010A53A:PROC
EXTRN sub_1010A556:PROC
EXTRN sub_1010A580:PROC
EXTRN sub_1010A59F:PROC
EXTRN sub_1010A5C4:PROC
EXTRN sub_1010A5D0:PROC
EXTRN sub_1010A5D5:PROC
EXTRN sub_1010A601:PROC
EXTRN sub_1010A603:PROC
EXTRN EXTRN fp_1010C054:DWORD:DWORD
EXTRN EXTRN fp_1010C0EC:DWORD:DWORD
EXTRN EXTRN fp_1010C13C:DWORD:DWORD
EXTRN EXTRN fp_1010C188:DWORD:DWORD
EXTRN EXTRN g_101A50D0:DWORD:DWORD
EXTRN EXTRN g_101AE198:DWORD:DWORD
EXTRN EXTRN g_101AE1A8:DWORD:DWORD
EXTRN EXTRN g_101AE268:DWORD:DWORD
.CODE
___crtCompareStringA PROC
    push push 64
    push push 010182590h
    call sub_100FB61C
    mov mov eax, dword ptr [g_101A50D0]
    mov mov dword ptr [ebp - 28], eax
    xor xor edi, edi
    xor xor esi, esi
    inc inc esi
    cmp cmp dword ptr [g_101AE268], edi
    jne L2
    push push esi
    mov mov eax, 01017C96Ch
    push push eax
    push push esi
    push push eax
    push push edi
    push push edi
    call dword ptr [fp_1010C0EC]
    test test eax, eax
    je L2
    mov mov dword ptr [g_101AE268], esi
    jmp L3
    call dword ptr [fp_1010C054]
    cmp cmp eax, 120
L0:
    jne L4
    mov mov dword ptr [g_101AE268], 2
    cmp cmp dword ptr [ebp + 20], edi
    jle L5
    push push dword ptr [ebp + 20]
L1:
    mov mov eax, dword ptr [ebp + 16]
    call L0
    pop pop ecx
    mov mov dword ptr [ebp + 20], eax
    mov mov eax, dword ptr [ebp + 28]
    cmp cmp eax, edi
    jle L6
    push push eax
    mov mov eax, dword ptr [ebp + 24]
    call L1
    pop pop ecx
    mov mov dword ptr [ebp + 28], eax
    mov mov ecx, dword ptr [g_101AE268]
    push push 2
    pop pop ebx
    cmp cmp ecx, ebx
    je sub_1010A2E9
    cmp cmp ecx, edi
    je sub_1010A2F1
    cmp cmp ecx, esi
    jne sub_1010A326
L4:
    mov mov dword ptr [ebp - 60], edi
    mov mov dword ptr [ebp - 68], edi
    mov mov dword ptr [ebp - 64], edi
    cmp cmp dword ptr [ebp + 32], edi
    jne L7
    mov mov ecx, dword ptr [g_101AE1A8]
    mov mov dword ptr [ebp + 32], ecx
    cmp cmp dword ptr [ebp + 20], edi
    je L8
    cmp cmp eax, edi
    jne L17
    cmp cmp dword ptr [ebp + 20], eax
    jne L9
    mov mov eax, ebx
    jmp sub_1010A3D7
    cmp cmp eax, esi
    jg sub_1010A3DD
    cmp cmp dword ptr [ebp + 20], esi
    jle L10
    push push 3
    pop pop eax
    jmp sub_1010A3EC
    lea lea eax, [ebp - 48]
    push push eax
    push push dword ptr [ebp + 32]
    call dword ptr [fp_1010C188]
    test test eax, eax
    je sub_1010A380
    cmp cmp dword ptr [ebp + 20], edi
    jle L15
    cmp cmp dword ptr [ebp - 48], ebx
    jb L11
    lea lea eax, [ebp - 42]
    cmp cmp byte ptr [ebp - 42], 0
    je L12
    mov mov dl, byte ptr [eax + 1]
    test test dl, dl
    je L13
    mov mov ecx, dword ptr [ebp + 16]
    mov mov cl, byte ptr [ecx]
    cmp cmp cl, byte ptr [eax]
    jb L19
    cmp cmp cl, dl
    jbe L12
    add add eax, ebx
    cmp cmp byte ptr [eax], 0
    jne L18
    jmp L14
    cmp cmp dword ptr [ebp + 28], edi
    jle L20
    cmp cmp dword ptr [ebp - 48], ebx
    jb sub_1010A43D
    lea lea eax, [ebp - 42]
    cmp cmp byte ptr [ebp - 42], 0
    je sub_1010A44A
    mov mov dl, byte ptr [eax + 1]
    test test dl, dl
    je sub_1010A455
    mov mov ecx, dword ptr [ebp + 24]
    mov mov cl, byte ptr [ecx]
    cmp cmp cl, byte ptr [eax]
    jb L22
    cmp cmp cl, dl
    jbe L16
L7:
    add add eax, ebx
    cmp cmp byte ptr [eax], 0
    jne L21
    jmp sub_1010A472
    push push edi
    push push edi
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp + 16]
    push push 9
    push push dword ptr [ebp + 32]
    call dword ptr [fp_1010C13C]
    mov mov ebx, eax
    mov mov dword ptr [ebp - 72], ebx
    cmp cmp ebx, edi
    je sub_1010A413
    mov mov dword ptr [ebp - 4], edi
    lea lea eax, [ebx + ebx]
    add add eax, 3
    and and eax, -4
    call sub_100F89CA
    mov mov dword ptr [ebp - 24], esp
    mov mov eax, esp
    mov mov dword ptr [ebp - 52], eax
    or or dword ptr [ebp - 4], -1
    jmp sub_1010A304
    xor xor eax, eax
    inc inc eax
    ret ret
    mov mov esp, dword ptr [ebp - 24]
    call sub_1010618D
    and and dword ptr [ebp - 52], 0
    or or dword ptr [ebp - 4], -1
    mov mov ebx, dword ptr [ebp - 72]
    xor xor esi, esi
    inc inc esi
    xor xor edi, edi
    mov mov eax, dword ptr [ebp - 52]
    cmp cmp eax, edi
    jne sub_1010A346
    lea lea eax, [ebx + ebx]
    push push eax
    call sub_100FC638
    pop pop ecx
    mov mov dword ptr [ebp - 52], eax
    cmp cmp eax, edi
    je sub_1010A46A
    mov mov dword ptr [ebp - 60], esi
    push push ebx
    push push eax
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp + 16]
    push push esi
    push push dword ptr [ebp + 32]
    call dword ptr [fp_1010C13C]
    test test eax, eax
    je sub_1010A443
    push push 0
L14:
    push push 0
    push push dword ptr [ebp + 28]
    push push dword ptr [ebp + 24]
    push push 9
    push push dword ptr [ebp + 32]
    call dword ptr [fp_1010C13C]
    mov mov esi, eax
    mov mov dword ptr [ebp - 76], esi
    test test esi, esi
    je sub_1010A465
    mov mov dword ptr [ebp - 4], 1
    lea lea eax, [esi + esi]
L17:
    add add eax, 3
    and and eax, -4
    call sub_100F8A64
    mov mov dword ptr [ebp - 24], esp
    mov mov edi, esp
    mov mov dword ptr [ebp - 80], edi
    or or dword ptr [ebp - 4], -1
    jmp sub_1010A434
    xor xor eax, eax
    inc inc eax
    ret ret
    mov mov esp, dword ptr [ebp - 24]
    call sub_10106227
    xor xor edi, edi
    or or dword ptr [ebp - 4], -1
    mov mov ebx, dword ptr [ebp - 72]
    mov mov esi, dword ptr [ebp - 76]
    test test edi, edi
    jne sub_1010A46B
    lea lea eax, [esi + esi]
    push push eax
    call sub_100FC6CB
    pop pop ecx
    mov mov edi, eax
    test test edi, edi
    je sub_1010A4B4
    mov mov dword ptr [ebp - 68], 1
    push push esi
    push push edi
    push push dword ptr [ebp + 28]
    push push dword ptr [ebp + 24]
    push push 1
    push push dword ptr [ebp + 32]
    call dword ptr [fp_1010C13C]
    test test eax, eax
    je sub_1010A4C5
    push push esi
    push push edi
    push push ebx
    push push dword ptr [ebp - 52]
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    call dword ptr [fp_1010C0EC]
    mov mov dword ptr [ebp - 64], eax
    cmp cmp dword ptr [ebp - 68], 0
L21:
    je sub_1010A4ED
    push push edi
    call sub_100F877D
    pop pop ecx
    cmp cmp dword ptr [ebp - 60], 0
L22:
    je sub_1010A509
    push push dword ptr [ebp - 52]
    call sub_100F878C
    pop pop ecx
    mov mov eax, dword ptr [ebp - 64]
    jmp sub_1010A5D0
    mov mov dword ptr [ebp - 56], edi
    cmp cmp dword ptr [ebp + 8], edi
    jne sub_1010A53A
    mov mov eax, dword ptr [g_101AE198]
    mov mov dword ptr [ebp + 8], eax
    mov mov ebx, dword ptr [ebp + 32]
    cmp cmp ebx, edi
    jne sub_1010A556
    mov mov ebx, dword ptr [g_101AE1A8]
    push push dword ptr [ebp + 8]
    call sub_10108271
    pop pop ecx
    mov mov esi, eax
    cmp cmp esi, -1
    jne sub_1010A580
    xor xor eax, eax
    jmp sub_1010A601
    cmp cmp esi, ebx
    je sub_1010A5D5
    push push 0
    push push 0
    lea lea eax, [ebp + 20]
    push push eax
    push push dword ptr [ebp + 16]
    push push esi
    push push ebx
    call sub_101082D6
    add add esp, 24
    mov mov edi, eax
    test test edi, edi
    je sub_1010A59F
    push push 0
    push push 0
    lea lea eax, [ebp + 28]
    push push eax
    push push dword ptr [ebp + 24]
    push push esi
    push push ebx
    call sub_101082F1
    add add esp, 24
    mov mov dword ptr [ebp - 56], eax
    test test eax, eax
    jne sub_1010A603
    push push edi
    call sub_100F8807
    pop pop ecx
    jmp sub_1010A5C4
    mov mov dword ptr [ebp + 16], edi
    mov mov eax, dword ptr [ebp - 56]
    mov mov dword ptr [ebp + 24], eax
    push push dword ptr [ebp + 28]
    push push dword ptr [ebp + 24]
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp + 16]
___crtCompareStringA ENDP
END
