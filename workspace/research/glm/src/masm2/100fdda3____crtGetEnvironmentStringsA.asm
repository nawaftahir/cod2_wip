.686
.MODEL FLAT, C
EXTRN sub_100F8587:PROC
EXTRN sub_100FC4F8:PROC
EXTRN sub_100FC560:PROC
EXTRN sub_100FCEFF:PROC
EXTRN sub_100FDED0:PROC
EXTRN sub_100FDEF1:PROC
EXTRN sub_100FDF00:PROC
EXTRN sub_100FDF0D:PROC
EXTRN sub_100FDF49:PROC
EXTRN sub_100FDF4D:PROC
EXTRN sub_100FDF59:PROC
EXTRN sub_100FDF76:PROC
EXTRN sub_100FDF7B:PROC
EXTRN sub_100FDF89:PROC
EXTRN sub_100FDF95:PROC
EXTRN sub_100FDFAD:PROC
EXTRN sub_100FDFBC:PROC
EXTRN EXTRN fp_1010C054:DWORD:DWORD
EXTRN EXTRN fp_1010C164:DWORD:DWORD
EXTRN EXTRN fp_1010C168:DWORD:DWORD
EXTRN EXTRN fp_1010C16C:DWORD:DWORD
EXTRN EXTRN g_1010C044:DWORD:DWORD
EXTRN EXTRN g_1010C170:DWORD:DWORD
EXTRN EXTRN g_101AE158:DWORD:DWORD
.CODE
___crtGetEnvironmentStringsA PROC
    push push ecx
    push push ecx
    mov mov eax, dword ptr [g_101AE158]
    push push ebx
    push push ebp
    push push esi
    push push edi
    mov mov edi, dword ptr [g_1010C170]
    xor xor ebx, ebx
    xor xor esi, esi
    cmp cmp eax, ebx
    push push 2
    pop pop ebp
    jne L1
    call call edi
    mov mov esi, eax
    cmp cmp esi, ebx
    je L0
    mov mov dword ptr [g_101AE158], 1
    jmp L2
    call dword ptr [fp_1010C054]
    cmp cmp eax, 120
    jne L3
    mov mov eax, ebp
    mov mov dword ptr [g_101AE158], eax
    jmp L4
    mov mov eax, dword ptr [g_101AE158]
    cmp cmp eax, 1
    jne L8
    cmp cmp esi, ebx
    jne L5
    call call edi
L0:
    mov mov esi, eax
    cmp cmp esi, ebx
    je sub_100FDED0
    cmp cmp word ptr [esi], bx
    mov mov eax, esi
    je L7
    add add eax, ebp
    cmp cmp word ptr [eax], bx
    jne L6
    add add eax, ebp
    cmp cmp word ptr [eax], bx
    jne L7
    mov mov edi, dword ptr [g_1010C044]
    push push ebx
    push push ebx
    push push ebx
    sub sub eax, esi
    push push ebx
    sar sar eax, 1
    inc inc eax
L2:
    push push eax
L3:
    push push esi
    push push ebx
    push push ebx
    mov mov dword ptr [esp + 52], eax
    call call edi
    mov mov ebp, eax
    cmp cmp ebp, ebx
    je sub_100FDEF1
    push push ebp
    call sub_100FC4F8
    cmp cmp eax, ebx
    pop pop ecx
    mov mov dword ptr [esp + 16], eax
    je sub_100FDF00
    push push ebx
    push push ebx
    push push ebp
    push push eax
    push push dword ptr [esp + 36]
    push push esi
    push push ebx
    push push ebx
    call call edi
    test test eax, eax
L5:
    jne sub_100FDF0D
    push push dword ptr [esp + 16]
    call sub_100F8587
    pop pop ecx
    mov mov dword ptr [esp + 16], ebx
    mov mov ebx, dword ptr [esp + 16]
    push push esi
    call dword ptr [fp_1010C16C]
    mov mov eax, ebx
L6:
    jmp sub_100FDF89
    cmp cmp eax, ebp
    je sub_100FDF49
    cmp cmp eax, ebx
    je sub_100FDF4D
    xor xor eax, eax
    jmp sub_100FDF95
    call dword ptr [fp_1010C168]
    mov mov esi, eax
    cmp cmp esi, ebx
    je sub_100FDF59
    cmp cmp byte ptr [esi], bl
    je sub_100FDF7B
    inc inc eax
    cmp cmp byte ptr [eax], bl
    jne sub_100FDF76
    inc inc eax
    cmp cmp byte ptr [eax], bl
    jne sub_100FDF7B
    sub sub eax, esi
    inc inc eax
    mov mov ebp, eax
    push push ebp
    call sub_100FC560
    mov mov edi, eax
    cmp cmp edi, ebx
    pop pop ecx
    jne sub_100FDFAD
    xor xor edi, edi
    jmp sub_100FDFBC
    push push ebp
    push push esi
    push push edi
    call sub_100FCEFF
    add add esp, 12
    push push esi
    call dword ptr [fp_1010C164]
L8:
    mov mov eax, edi
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    pop pop ecx
    pop pop ecx
    ret ret
___crtGetEnvironmentStringsA ENDP
END
