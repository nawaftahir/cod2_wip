.686
.MODEL FLAT, C
EXTRN sub_1010837F:PROC
EXTRN sub_101083C0:PROC
EXTRN sub_101083D3:PROC
EXTRN sub_101083D7:PROC
EXTRN sub_101083F6:PROC
EXTRN sub_101083F9:PROC
EXTRN sub_10108424:PROC
EXTRN sub_1010842E:PROC
EXTRN sub_10108437:PROC
EXTRN sub_10108438:PROC
EXTRN sub_1010843F:PROC
EXTRN sub_10108448:PROC
EXTRN EXTRN fp_1010C050:DWORD:DWORD
EXTRN EXTRN fp_101AE23C:DWORD:DWORD
EXTRN EXTRN fp_101AE24C:DWORD:DWORD
EXTRN EXTRN g_1010C04C:DWORD:DWORD
EXTRN EXTRN g_101AE00C:DWORD:DWORD
EXTRN EXTRN g_101AE018:DWORD:DWORD
EXTRN EXTRN g_101AE23C:DWORD:DWORD
EXTRN EXTRN g_101AE240:DWORD:DWORD
EXTRN EXTRN g_101AE244:DWORD:DWORD
EXTRN EXTRN g_101AE248:DWORD:DWORD
EXTRN EXTRN g_101AE24C:DWORD:DWORD
.CODE
___crtMessageBoxA PROC
    push push ebp
    mov mov ebp, esp
    sub sub esp, 16
    push push ebx
    xor xor ebx, ebx
    cmp cmp dword ptr [g_101AE23C], ebx
    push push esi
    push push edi
    jne L0
    push push 010182330h
    call dword ptr [fp_1010C050]
    mov mov edi, eax
    cmp cmp edi, ebx
    je L2
    mov mov esi, dword ptr [g_1010C04C]
    push push 010182324h
    push push edi
    call call esi
    test test eax, eax
    mov mov dword ptr [g_101AE23C], eax
    je sub_1010837F
    push push 010182314h
    push push edi
    call call esi
    push push 010182300h
    push push edi
    mov mov dword ptr [g_101AE240], eax
    call call esi
    cmp cmp dword ptr [g_101AE00C], 2
    mov mov dword ptr [g_101AE244], eax
    jne L1
    push push 0101822E4h
    push push edi
    call call esi
    test test eax, eax
    mov mov dword ptr [g_101AE24C], eax
    je L3
    push push 0101822CCh
    push push edi
    call call esi
    mov mov dword ptr [g_101AE248], eax
    mov mov eax, dword ptr [g_101AE248]
    test test eax, eax
    je sub_101083D3
    call call eax
    test test eax, eax
    je sub_101083C0
    lea lea ecx, [ebp - 4]
    push push ecx
L0:
    push push 12
    lea lea ecx, [ebp - 16]
    push push ecx
    push push 1
    push push eax
    call dword ptr [fp_101AE24C]
    test test eax, eax
    je sub_101083D7
    test test byte ptr [ebp - 8], 1
    jne sub_101083F6
    cmp cmp dword ptr [g_101AE018], 4
    jb sub_101083F9
    or or byte ptr [ebp + 18], 32
    jmp sub_10108424
    xor xor eax, eax
    jmp sub_10108438
    or or byte ptr [ebp + 18], 4
    jmp sub_1010842E
    mov mov eax, dword ptr [g_101AE240]
    test test eax, eax
    je sub_10108437
    call call eax
    mov mov ebx, eax
    test test ebx, ebx
    je sub_1010843F
    mov mov eax, dword ptr [g_101AE244]
    test test eax, eax
    je sub_10108448
    push push ebx
    call call eax
L1:
    mov mov ebx, eax
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    push push ebx
    call dword ptr [fp_101AE23C]
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
___crtMessageBoxA ENDP
END
