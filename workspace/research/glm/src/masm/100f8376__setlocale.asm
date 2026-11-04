.686
.MODEL FLAT, C
EXTRN sub_100F7AF5:PROC
EXTRN sub_100F7BD1:PROC
EXTRN sub_100F81D8:PROC
EXTRN sub_100F8211:PROC
EXTRN sub_100F84E1:PROC
EXTRN sub_100F84EA:PROC
EXTRN sub_100F851B:PROC
EXTRN sub_100F860A:PROC
EXTRN sub_100F8613:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FC0A6:PROC
EXTRN sub_100FC100:PROC
EXTRN sub_100FC4BC:PROC
EXTRN sub_101010EA:PROC
EXTRN g_101A4684:DWORD
EXTRN g_101A4FD0:DWORD
EXTRN g_101A5090:DWORD
EXTRN g_101A50CC:DWORD
EXTRN g_101A50D4:DWORD
EXTRN g_101A50E0:DWORD
EXTRN g_101AE164:DWORD
EXTRN g_101AE168:DWORD
EXTRN g_101AE1A8:DWORD
EXTRN g_101AE1AC:DWORD
EXTRN g_1076AC80:DWORD
EXTRN g_1076AC84:DWORD
EXTRN g_1076AC88:DWORD
EXTRN g_1076AC8C:DWORD
EXTRN g_1076AC90:DWORD
.CODE
_setlocale PROC
    push 20
    push 01017C690h
    call sub_100FB61C
    mov edi, dword ptr [ebp + 8]
    xor ebx, ebx
    cmp edi, ebx
    jl sub_100F84E1
    cmp edi, 5
    jg sub_100F84EA
    push 12
    call sub_100FC0A6
    pop ecx
    mov dword ptr [ebp - 4], ebx
    cmp dword ptr [ebp + 12], ebx
    jne L0
    xor ecx, ecx
    mov edx, edi
    call sub_100F81D8
    mov esi, eax
    push -1
    lea eax, [ebp - 16]
    push eax
    call sub_101010EA
    pop ecx
    pop ecx
    mov eax, esi
    jmp sub_100F851B
L0:
    push 84
    call sub_100FC4BC
    pop ecx
    mov esi, eax
    mov dword ptr [ebp - 36], esi
    cmp esi, ebx
    jne L1
    mov dword ptr [ebp - 28], ebx
    jmp L5
L1:
    mov ecx, dword ptr [ebp + 12]
    mov edx, edi
    call sub_100F8211
    mov dword ptr [ebp - 28], eax
    cmp eax, ebx
    je L5
    mov dword ptr [esi], ebx
    mov eax, dword ptr [g_101AE1A8]
    mov dword ptr [esi + 4], eax
    mov eax, dword ptr [g_101AE1AC]
    mov dword ptr [esi + 8], eax
    xor eax, eax
L2:
    mov dword ptr [ebp - 32], eax
    cmp eax, 5
    jg L3
    mov ecx, dword ptr [eax*4 + 0101AE190h]
    mov dword ptr [esi + eax*4 + 12], ecx
    inc eax
    jmp L2
L3:
    mov eax, dword ptr [g_101A50D4]
    mov dword ptr [esi + 36], eax
    mov eax, dword ptr [g_101A50E0]
    mov dword ptr [esi + 40], eax
    mov eax, dword ptr [g_1076AC8C]
    mov dword ptr [esi + 44], eax
    mov eax, dword ptr [g_1076AC90]
    mov dword ptr [esi + 48], eax
    mov eax, dword ptr [g_1076AC88]
    mov dword ptr [esi + 52], eax
    mov eax, dword ptr [g_101A50CC]
    mov dword ptr [esi + 56], eax
    mov eax, dword ptr [g_101AE168]
    mov dword ptr [esi + 60], eax
    mov eax, dword ptr [g_1076AC84]
    mov dword ptr [esi + 64], eax
    mov eax, dword ptr [g_1076AC80]
    mov dword ptr [esi + 68], eax
    mov eax, dword ptr [g_101A5090]
    mov dword ptr [esi + 72], eax
    mov eax, dword ptr [g_101A4FD0]
    mov dword ptr [esi + 76], eax
    mov eax, dword ptr [g_101AE164]
    mov dword ptr [esi + 80], eax
    mov eax, dword ptr [g_101A4684]
    cmp dword ptr [eax], ebx
    jne L4
    cmp eax, 0101A4630h
    je L4
    push eax
    call sub_100F7AF5
    pop ecx
L4:
    mov dword ptr [g_101A4684], esi
    call sub_100F7BD1
L5:
    cmp dword ptr [ebp - 28], ebx
    jne L6
    cmp esi, ebx
    je L6
    push esi
    call sub_100F860A
    pop ecx
L6:
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call L7
    mov eax, dword ptr [ebp - 28]
    jmp sub_100F8613
L7:
    push 12
    call sub_100FC100
    pop ecx
_setlocale ENDP
END
