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
EXTRN sub_10109FDF:PROC
EXTRN sub_10109FF3:PROC
EXTRN sub_1010A3D7:PROC
EXTRN sub_1010A3DD:PROC
EXTRN sub_1010A3EC:PROC
EXTRN sub_1010A43D:PROC
EXTRN sub_1010A44A:PROC
EXTRN sub_1010A455:PROC
EXTRN sub_1010A472:PROC
EXTRN sub_1010A5D0:PROC
EXTRN sub_1010A601:PROC
EXTRN fp_1010C054:DWORD
EXTRN fp_1010C0EC:DWORD
EXTRN fp_1010C13C:DWORD
EXTRN fp_1010C188:DWORD
EXTRN g_101A50D0:DWORD
EXTRN g_101AE198:DWORD
EXTRN g_101AE1A8:DWORD
EXTRN g_101AE268:DWORD
.CODE
___crtCompareStringA PROC
    push 64
    push 010182590h
    call sub_100FB61C
    mov eax, dword ptr [g_101A50D0]
    mov dword ptr [ebp - 28], eax
    xor edi, edi
    xor esi, esi
    inc esi
    cmp dword ptr [g_101AE268], edi
    jne L1
    push esi
    mov eax, 01017C96Ch
    push eax
    push esi
    push eax
    push edi
    push edi
    call dword ptr [fp_1010C0EC]
    test eax, eax
    je L0
    mov dword ptr [g_101AE268], esi
    jmp L1
L0:
    call dword ptr [fp_1010C054]
    cmp eax, 120
    jne L1
    mov dword ptr [g_101AE268], 2
L1:
    cmp dword ptr [ebp + 20], edi
    jle L2
    push dword ptr [ebp + 20]
    mov eax, dword ptr [ebp + 16]
    call sub_10109FDF
    pop ecx
    mov dword ptr [ebp + 20], eax
L2:
    mov eax, dword ptr [ebp + 28]
    cmp eax, edi
    jle L3
    push eax
    mov eax, dword ptr [ebp + 24]
    call sub_10109FF3
    pop ecx
    mov dword ptr [ebp + 28], eax
L3:
    mov ecx, dword ptr [g_101AE268]
    push 2
    pop ebx
    cmp ecx, ebx
    je L23
    cmp ecx, edi
    je L23
    cmp ecx, esi
    jne L26
    mov dword ptr [ebp - 60], edi
    mov dword ptr [ebp - 68], edi
    mov dword ptr [ebp - 64], edi
    cmp dword ptr [ebp + 32], edi
    jne L4
    mov ecx, dword ptr [g_101AE1A8]
    mov dword ptr [ebp + 32], ecx
L4:
    cmp dword ptr [ebp + 20], edi
    je L5
    cmp eax, edi
    jne L15
L5:
    cmp dword ptr [ebp + 20], eax
    jne L7
L6:
    mov eax, ebx
    jmp sub_1010A3D7
L7:
    cmp eax, esi
    jg sub_1010A3DD
    cmp dword ptr [ebp + 20], esi
    jle L9
L8:
    push 3
    pop eax
    jmp sub_1010A3EC
L9:
    lea eax, [ebp - 48]
    push eax
    push dword ptr [ebp + 32]
    call dword ptr [fp_1010C188]
    test eax, eax
    je L26
    cmp dword ptr [ebp + 20], edi
    jle L12
    cmp dword ptr [ebp - 48], ebx
    jb L8
    lea eax, [ebp - 42]
    cmp byte ptr [ebp - 42], 0
    je L8
L10:
    mov dl, byte ptr [eax + 1]
    test dl, dl
    je L8
    mov ecx, dword ptr [ebp + 16]
    mov cl, byte ptr [ecx]
    cmp cl, byte ptr [eax]
    jb L11
    cmp cl, dl
    jbe L6
L11:
    add eax, ebx
    cmp byte ptr [eax], 0
    jne L10
    jmp L8
L12:
    cmp dword ptr [ebp + 28], edi
    jle L15
    cmp dword ptr [ebp - 48], ebx
    jb sub_1010A43D
    lea eax, [ebp - 42]
    cmp byte ptr [ebp - 42], 0
    je sub_1010A44A
L13:
    mov dl, byte ptr [eax + 1]
    test dl, dl
    je sub_1010A455
    mov ecx, dword ptr [ebp + 24]
    mov cl, byte ptr [ecx]
    cmp cl, byte ptr [eax]
    jb L14
    cmp cl, dl
    jbe L6
L14:
    add eax, ebx
    cmp byte ptr [eax], 0
    jne L13
    jmp sub_1010A472
L15:
    push edi
    push edi
    push dword ptr [ebp + 20]
    push dword ptr [ebp + 16]
    push 9
    push dword ptr [ebp + 32]
    call dword ptr [fp_1010C13C]
    mov ebx, eax
    mov dword ptr [ebp - 72], ebx
    cmp ebx, edi
    je L26
    mov dword ptr [ebp - 4], edi
    lea eax, [ebx + ebx]
    add eax, 3
    and eax, 0FFFFFFFCh
    call sub_100F89CA
    mov dword ptr [ebp - 24], esp
    mov eax, esp
    mov dword ptr [ebp - 52], eax
    or dword ptr [ebp - 4], 0FFFFFFFFh
    jmp L16
    xor eax, eax
    inc eax
    ret
    mov esp, dword ptr [ebp - 24]
    call sub_1010618D
    and dword ptr [ebp - 52], 0
    or dword ptr [ebp - 4], 0FFFFFFFFh
    mov ebx, dword ptr [ebp - 72]
    xor esi, esi
    inc esi
    xor edi, edi
L16:
    mov eax, dword ptr [ebp - 52]
    cmp eax, edi
    jne L17
    lea eax, [ebx + ebx]
    push eax
    call sub_100FC638
    pop ecx
    mov dword ptr [ebp - 52], eax
    cmp eax, edi
    je L26
    mov dword ptr [ebp - 60], esi
L17:
    push ebx
    push eax
    push dword ptr [ebp + 20]
    push dword ptr [ebp + 16]
    push esi
    push dword ptr [ebp + 32]
    call dword ptr [fp_1010C13C]
    test eax, eax
    je L21
    push 0
    push 0
    push dword ptr [ebp + 28]
    push dword ptr [ebp + 24]
    push 9
    push dword ptr [ebp + 32]
    call dword ptr [fp_1010C13C]
    mov esi, eax
    mov dword ptr [ebp - 76], esi
    test esi, esi
    je L21
    mov dword ptr [ebp - 4], 1
    lea eax, [esi + esi]
    add eax, 3
    and eax, 0FFFFFFFCh
    call sub_100F8A64
    mov dword ptr [ebp - 24], esp
    mov edi, esp
    mov dword ptr [ebp - 80], edi
    or dword ptr [ebp - 4], 0FFFFFFFFh
    jmp L18
    xor eax, eax
    inc eax
    ret
    mov esp, dword ptr [ebp - 24]
    call sub_10106227
    xor edi, edi
    or dword ptr [ebp - 4], 0FFFFFFFFh
    mov ebx, dword ptr [ebp - 72]
    mov esi, dword ptr [ebp - 76]
L18:
    test edi, edi
    jne L19
    lea eax, [esi + esi]
    push eax
    call sub_100FC6CB
    pop ecx
    mov edi, eax
    test edi, edi
    je L21
    mov dword ptr [ebp - 68], 1
L19:
    push esi
    push edi
    push dword ptr [ebp + 28]
    push dword ptr [ebp + 24]
    push 1
    push dword ptr [ebp + 32]
    call dword ptr [fp_1010C13C]
    test eax, eax
    je L20
    push esi
    push edi
    push ebx
    push dword ptr [ebp - 52]
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call dword ptr [fp_1010C0EC]
    mov dword ptr [ebp - 64], eax
L20:
    cmp dword ptr [ebp - 68], 0
    je L21
    push edi
    call sub_100F877D
    pop ecx
L21:
    cmp dword ptr [ebp - 60], 0
    je L22
    push dword ptr [ebp - 52]
    call sub_100F878C
    pop ecx
L22:
    mov eax, dword ptr [ebp - 64]
    jmp sub_1010A5D0
L23:
    mov dword ptr [ebp - 56], edi
    cmp dword ptr [ebp + 8], edi
    jne L24
    mov eax, dword ptr [g_101AE198]
    mov dword ptr [ebp + 8], eax
L24:
    mov ebx, dword ptr [ebp + 32]
    cmp ebx, edi
    jne L25
    mov ebx, dword ptr [g_101AE1A8]
L25:
    push dword ptr [ebp + 8]
    call sub_10108271
    pop ecx
    mov esi, eax
    cmp esi, -1
    jne L27
L26:
    xor eax, eax
    jmp sub_1010A601
L27:
    cmp esi, ebx
    je L29
    push 0
    push 0
    lea eax, [ebp + 20]
    push eax
    push dword ptr [ebp + 16]
    push esi
    push ebx
    call sub_101082D6
    add esp, 24
    mov edi, eax
    test edi, edi
    je L26
    push 0
    push 0
    lea eax, [ebp + 28]
    push eax
    push dword ptr [ebp + 24]
    push esi
    push ebx
    call sub_101082F1
    add esp, 24
    mov dword ptr [ebp - 56], eax
    test eax, eax
    jne L28
    push edi
    call sub_100F8807
    pop ecx
    jmp L26
L28:
    mov dword ptr [ebp + 16], edi
    mov eax, dword ptr [ebp - 56]
    mov dword ptr [ebp + 24], eax
L29:
    push dword ptr [ebp + 28]
    push dword ptr [ebp + 24]
    push dword ptr [ebp + 20]
    push dword ptr [ebp + 16]
___crtCompareStringA ENDP
END
