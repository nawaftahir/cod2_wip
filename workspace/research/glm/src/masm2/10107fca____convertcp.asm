.686
.MODEL FLAT, C
EXTRN sub_100F8663:PROC
EXTRN sub_100F88E6:PROC
EXTRN sub_100FA27A:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FD8BE:PROC
EXTRN sub_100FD937:PROC
EXTRN sub_10100409:PROC
EXTRN sub_101060B7:PROC
EXTRN sub_10108185:PROC
EXTRN sub_101081A3:PROC
EXTRN sub_101081C2:PROC
EXTRN sub_101081CB:PROC
EXTRN sub_10108240:PROC
EXTRN sub_10108280:PROC
EXTRN sub_10108286:PROC
EXTRN sub_10108299:PROC
EXTRN sub_101082B6:PROC
EXTRN sub_101082BE:PROC
EXTRN sub_101082D9:PROC
EXTRN sub_101082EA:PROC
EXTRN sub_101082EE:PROC
EXTRN sub_1010830C:PROC
EXTRN sub_10108312:PROC
EXTRN sub_10108319:PROC
EXTRN sub_1010832D:PROC
EXTRN EXTRN fp_1010C044:DWORD:DWORD
EXTRN EXTRN fp_1010C13C:DWORD:DWORD
EXTRN EXTRN g_1010C188:DWORD:DWORD
EXTRN EXTRN g_101A50D0:DWORD:DWORD
.CODE
___convertcp PROC
    push push 56
    push push 0101822B0h
    call sub_100FB61C
    mov mov eax, dword ptr [g_101A50D0]
    mov mov dword ptr [ebp - 28], eax
    xor xor edi, edi
    mov mov dword ptr [ebp - 52], edi
    mov mov dword ptr [ebp - 68], edi
    mov mov eax, dword ptr [ebp + 20]
    mov mov ebx, dword ptr [eax]
    mov mov dword ptr [ebp - 64], ebx
    mov mov dword ptr [ebp - 60], edi
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp eax, dword ptr [ebp + 12]
    je sub_101081A3
    lea lea ecx, [ebp - 48]
    push push ecx
    push push eax
    mov mov esi, dword ptr [g_1010C188]
    call call esi
    test test eax, eax
    je L0
    cmp cmp dword ptr [ebp - 48], 1
    jne L1
    lea lea eax, [ebp - 48]
    push push eax
    push push dword ptr [ebp + 12]
    call call esi
    test test eax, eax
    je L2
    cmp cmp dword ptr [ebp - 48], 1
    jne L3
    mov mov dword ptr [ebp - 60], 1
    cmp cmp dword ptr [ebp - 60], edi
    je L5
    cmp cmp ebx, -1
    je L4
    mov mov esi, ebx
    jmp L6
    push push dword ptr [ebp + 16]
    call sub_100FA27A
    pop pop ecx
    mov mov esi, eax
    inc inc esi
    mov mov dword ptr [ebp - 56], esi
    jmp L7
    mov mov esi, dword ptr [ebp - 56]
    cmp cmp dword ptr [ebp - 60], edi
    jne L8
    push push edi
    push push edi
    push push ebx
    push push dword ptr [ebp + 16]
    push push 1
    push push dword ptr [ebp + 8]
    call dword ptr [fp_1010C13C]
    mov mov esi, eax
    mov mov dword ptr [ebp - 56], esi
    cmp cmp esi, edi
    je L9
    mov mov dword ptr [ebp - 4], edi
L0:
    lea lea eax, [esi + esi]
    add add eax, 3
L1:
    and and eax, -4
    call sub_100F88E6
    mov mov dword ptr [ebp - 24], esp
    mov mov ebx, esp
L2:
    mov mov dword ptr [ebp - 72], ebx
    lea lea eax, [esi + esi]
L3:
    push push eax
    push push edi
    push push ebx
    call sub_10100409
    add add esp, 12
    or or dword ptr [ebp - 4], -1
    jmp sub_10108185
    xor xor eax, eax
    inc inc eax
    ret ret
    mov mov esp, dword ptr [ebp - 24]
    call sub_101060B7
    xor xor edi, edi
L4:
    xor xor ebx, ebx
    or or dword ptr [ebp - 4], -1
    mov mov esi, dword ptr [ebp - 56]
    cmp cmp ebx, edi
    jne sub_101081C2
    push push esi
    push push 2
L6:
    call sub_100FD8BE
    pop pop ecx
    pop pop ecx
    mov mov ebx, eax
    cmp cmp ebx, edi
    jne sub_101081CB
    xor xor eax, eax
    jmp sub_10108286
    mov mov dword ptr [ebp - 68], 1
    push push esi
    push push ebx
    push push dword ptr [ebp - 64]
    push push dword ptr [ebp + 16]
    push push 1
    push push dword ptr [ebp + 8]
    call dword ptr [fp_1010C13C]
    test test eax, eax
    je sub_10108299
    cmp cmp dword ptr [ebp + 24], edi
    je sub_10108240
    push push edi
    push push edi
    push push dword ptr [ebp + 28]
L8:
    push push dword ptr [ebp + 24]
    push push esi
    push push ebx
    push push edi
    push push dword ptr [ebp + 12]
    call dword ptr [fp_1010C044]
    test test eax, eax
    je sub_101082B6
    mov mov eax, dword ptr [ebp + 24]
    mov mov dword ptr [ebp - 52], eax
    jmp sub_101082BE
    cmp cmp dword ptr [ebp - 60], edi
    jne sub_10108280
    push push edi
    push push edi
    push push edi
    push push edi
    push push esi
    push push ebx
    push push edi
    push push dword ptr [ebp + 12]
    call dword ptr [fp_1010C044]
    mov mov esi, eax
    cmp cmp esi, edi
    je sub_101082D9
    push push esi
    push push 1
    call sub_100FD937
    pop pop ecx
    pop pop ecx
    mov mov dword ptr [ebp - 52], eax
    cmp cmp eax, edi
    je sub_101082EA
    push push edi
    push push edi
    push push esi
    push push eax
    push push esi
    push push ebx
    push push edi
    push push dword ptr [ebp + 12]
    call dword ptr [fp_1010C044]
    cmp cmp eax, edi
    jne sub_101082EE
    push push dword ptr [ebp - 52]
    call sub_100F8663
    pop pop ecx
    mov mov dword ptr [ebp - 52], edi
    jmp sub_1010830C
    cmp cmp dword ptr [ebp - 64], -1
    je sub_10108312
    mov mov ecx, dword ptr [ebp + 20]
L9:
    mov mov dword ptr [ecx], eax
    jmp sub_10108319
    mov mov ebx, dword ptr [ebp - 72]
    cmp cmp dword ptr [ebp - 68], edi
    je sub_1010832D
    push push ebx
___convertcp ENDP
END
