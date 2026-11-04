.686
.MODEL FLAT, C
EXTRN sub_100F7AF5:PROC
EXTRN sub_100F7BD1:PROC
EXTRN sub_100F81D8:PROC
EXTRN sub_100F8211:PROC
EXTRN sub_100F84E1:PROC
EXTRN sub_100F84EA:PROC
EXTRN sub_100F850B:PROC
EXTRN sub_100F851B:PROC
EXTRN sub_100F8520:PROC
EXTRN sub_100F85A8:PROC
EXTRN sub_100F85AF:PROC
EXTRN sub_100F85E1:PROC
EXTRN sub_100F85E5:PROC
EXTRN sub_100F8603:PROC
EXTRN sub_100F860A:PROC
EXTRN sub_100F8613:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FC0A6:PROC
EXTRN sub_100FC100:PROC
EXTRN sub_100FC4BC:PROC
EXTRN sub_101010EA:PROC
EXTRN EXTRN g_101A4684:DWORD:DWORD
EXTRN EXTRN g_101A4FD0:DWORD:DWORD
EXTRN EXTRN g_101A5090:DWORD:DWORD
EXTRN EXTRN g_101A50CC:DWORD:DWORD
EXTRN EXTRN g_101A50D4:DWORD:DWORD
EXTRN EXTRN g_101A50E0:DWORD:DWORD
EXTRN EXTRN g_101AE164:DWORD:DWORD
EXTRN EXTRN g_101AE168:DWORD:DWORD
EXTRN EXTRN g_101AE1A8:DWORD:DWORD
EXTRN EXTRN g_101AE1AC:DWORD:DWORD
EXTRN EXTRN g_1076AC80:DWORD:DWORD
EXTRN EXTRN g_1076AC84:DWORD:DWORD
EXTRN EXTRN g_1076AC88:DWORD:DWORD
EXTRN EXTRN g_1076AC8C:DWORD:DWORD
EXTRN EXTRN g_1076AC90:DWORD:DWORD
.CODE
_setlocale PROC
    push push 20
    push push 01017C690h
    call sub_100FB61C
    mov mov edi, dword ptr [ebp + 8]
    xor xor ebx, ebx
    cmp cmp edi, ebx
    jl sub_100F84E1
    cmp cmp edi, 5
    jg sub_100F84EA
    push push 12
    call sub_100FC0A6
    pop pop ecx
    mov mov dword ptr [ebp - 4], ebx
    cmp cmp dword ptr [ebp + 12], ebx
    jne L0
    xor xor ecx, ecx
    mov mov edx, edi
    call sub_100F81D8
    mov mov esi, eax
    push push -1
    lea lea eax, [ebp - 16]
    push push eax
    call sub_101010EA
    pop pop ecx
    pop pop ecx
    mov mov eax, esi
    jmp sub_100F851B
    push push 84
    call sub_100FC4BC
    pop pop ecx
    mov mov esi, eax
    mov mov dword ptr [ebp - 36], esi
    cmp cmp esi, ebx
    jne L1
    mov mov dword ptr [ebp - 28], ebx
    jmp sub_100F850B
    mov mov ecx, dword ptr [ebp + 12]
    mov mov edx, edi
    call sub_100F8211
    mov mov dword ptr [ebp - 28], eax
    cmp cmp eax, ebx
    je sub_100F8520
    mov mov dword ptr [esi], ebx
    mov mov eax, dword ptr [g_101AE1A8]
    mov mov dword ptr [esi + 4], eax
    mov mov eax, dword ptr [g_101AE1AC]
    mov mov dword ptr [esi + 8], eax
    xor xor eax, eax
    mov mov dword ptr [ebp - 32], eax
    cmp cmp eax, 5
    jg L3
    mov mov ecx, dword ptr [eax*4 + 0101AE190h]
    mov mov dword ptr [esi + eax*4 + 12], ecx
    inc inc eax
    jmp L2
    mov mov eax, dword ptr [g_101A50D4]
    mov mov dword ptr [esi + 36], eax
    mov mov eax, dword ptr [g_101A50E0]
    mov mov dword ptr [esi + 40], eax
    mov mov eax, dword ptr [g_1076AC8C]
    mov mov dword ptr [esi + 44], eax
    mov mov eax, dword ptr [g_1076AC90]
    mov mov dword ptr [esi + 48], eax
    mov mov eax, dword ptr [g_1076AC88]
    mov mov dword ptr [esi + 52], eax
    mov mov eax, dword ptr [g_101A50CC]
    mov mov dword ptr [esi + 56], eax
    mov mov eax, dword ptr [g_101AE168]
    mov mov dword ptr [esi + 60], eax
    mov mov eax, dword ptr [g_1076AC84]
    mov mov dword ptr [esi + 64], eax
    mov mov eax, dword ptr [g_1076AC80]
    mov mov dword ptr [esi + 68], eax
    mov mov eax, dword ptr [g_101A5090]
    mov mov dword ptr [esi + 72], eax
    mov mov eax, dword ptr [g_101A4FD0]
    mov mov dword ptr [esi + 76], eax
    mov mov eax, dword ptr [g_101AE164]
    mov mov dword ptr [esi + 80], eax
    mov mov eax, dword ptr [g_101A4684]
    cmp cmp dword ptr [eax], ebx
    jne sub_100F85A8
    cmp cmp eax, 0101A4630h
    je sub_100F85AF
    push push eax
    call sub_100F7AF5
    pop pop ecx
    mov mov dword ptr [g_101A4684], esi
    call sub_100F7BD1
    cmp cmp dword ptr [ebp - 28], ebx
    jne sub_100F85E1
    cmp cmp esi, ebx
    je sub_100F85E5
    push push esi
    call sub_100F860A
    pop pop ecx
    or or dword ptr [ebp - 4], -1
    call sub_100F8603
L3:
    mov mov eax, dword ptr [ebp - 28]
    jmp sub_100F8613
    push push 12
    call sub_100FC100
    pop pop ecx
_setlocale ENDP
END
