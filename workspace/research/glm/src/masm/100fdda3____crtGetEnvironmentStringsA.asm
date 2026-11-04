.686
.MODEL FLAT, C
EXTRN sub_100F8587:PROC
EXTRN sub_100FC4F8:PROC
EXTRN sub_100FC560:PROC
EXTRN sub_100FCEFF:PROC
EXTRN fp_1010C054:DWORD
EXTRN fp_1010C164:DWORD
EXTRN fp_1010C168:DWORD
EXTRN fp_1010C16C:DWORD
EXTRN g_1010C044:DWORD
EXTRN g_1010C170:DWORD
EXTRN g_101AE158:DWORD
.CODE
___crtGetEnvironmentStringsA PROC
    push ecx
    push ecx
    mov eax, dword ptr [g_101AE158]
    push ebx
    push ebp
    push esi
    push edi
    mov edi, dword ptr [g_1010C170]
    xor ebx, ebx
    xor esi, esi
    cmp eax, ebx
    push 2
    pop ebp
    jne L2
    call edi
    mov esi, eax
    cmp esi, ebx
    je L0
    mov dword ptr [g_101AE158], 1
    jmp L3
L0:
    call dword ptr [fp_1010C054]
    cmp eax, 120
    jne L1
    mov eax, ebp
    mov dword ptr [g_101AE158], eax
    jmp L2
L1:
    mov eax, dword ptr [g_101AE158]
L2:
    cmp eax, 1
    jne L9
L3:
    cmp esi, ebx
    jne L4
    call edi
    mov esi, eax
    cmp esi, ebx
    je L10
L4:
    cmp word ptr [esi], bx
    mov eax, esi
    je L6
L5:
    add eax, ebp
    cmp word ptr [eax], bx
    jne L5
    add eax, ebp
    cmp word ptr [eax], bx
    jne L5
L6:
    mov edi, dword ptr [g_1010C044]
    push ebx
    push ebx
    push ebx
    sub eax, esi
    push ebx
    sar eax, 1
    inc eax
    push eax
    push esi
    push ebx
    push ebx
    mov dword ptr [esp + 52], eax
    call edi
    mov ebp, eax
    cmp ebp, ebx
    je L8
    push ebp
    call sub_100FC4F8
    cmp eax, ebx
    pop ecx
    mov dword ptr [esp + 16], eax
    je L8
    push ebx
    push ebx
    push ebp
    push eax
    push dword ptr [esp + 36]
    push esi
    push ebx
    push ebx
    call edi
    test eax, eax
    jne L7
    push dword ptr [esp + 16]
    call sub_100F8587
    pop ecx
    mov dword ptr [esp + 16], ebx
L7:
    mov ebx, dword ptr [esp + 16]
L8:
    push esi
    call dword ptr [fp_1010C16C]
    mov eax, ebx
    jmp L16
L9:
    cmp eax, ebp
    je L11
    cmp eax, ebx
    je L11
L10:
    xor eax, eax
    jmp L16
L11:
    call dword ptr [fp_1010C168]
    mov esi, eax
    cmp esi, ebx
    je L10
    cmp byte ptr [esi], bl
    je L13
L12:
    inc eax
    cmp byte ptr [eax], bl
    jne L12
    inc eax
    cmp byte ptr [eax], bl
    jne L12
L13:
    sub eax, esi
    inc eax
    mov ebp, eax
    push ebp
    call sub_100FC560
    mov edi, eax
    cmp edi, ebx
    pop ecx
    jne L14
    xor edi, edi
    jmp L15
L14:
    push ebp
    push esi
    push edi
    call sub_100FCEFF
    add esp, 12
L15:
    push esi
    call dword ptr [fp_1010C164]
    mov eax, edi
L16:
    pop edi
    pop esi
    pop ebp
    pop ebx
    pop ecx
    pop ecx
    ret
___crtGetEnvironmentStringsA ENDP
END
