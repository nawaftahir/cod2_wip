.686
.MODEL FLAT, C
EXTRN sub_10001959:PROC
EXTRN sub_10003DD8:PROC
EXTRN sub_10003F93:PROC
EXTRN sub_10003F9A:PROC
EXTRN sub_10003F9B:PROC
EXTRN sub_10003FA2:PROC
EXTRN sub_10003FDA:PROC
EXTRN sub_10003FF7:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN g_101AE4A0:DWORD:DWORD
EXTRN EXTRN g_101AE4A4:DWORD:DWORD
.CODE
FUN_10003ee0 PROC
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    push push esi
    push push edi
    mov mov ebx, 12
    mov mov edx, 22
    mov mov eax, ebp
    call sub_10001959
    mov mov esi, eax
    mov mov eax, dword ptr [ebp]
    mov mov edi, dword ptr [eax + 0BCh]
    mov mov eax, dword ptr [ebp + 4]
    lea lea ecx, [esi + esi*2]
    shl shl ecx, 4
    push push ecx
    add add edi, eax
    call dword ptr [fp_101D49D4]
    add add esp, 4
    test test esi, esi
    mov mov dword ptr [g_101AE4A0], eax
    mov mov dword ptr [g_101AE4A4], esi
    jle sub_10003F9A
    lea lea ecx, [edi + 8]
    add add eax, 24
    mov mov ebx, esi
    mov mov edi, dword ptr [ecx - 4]
    test test edi, edi
    je sub_10003F93
    mov mov edx, dword ptr [ecx - 8]
    jmp sub_10003F9B
    or or edx, -1
    mov mov dword ptr [eax + 4], edx
    mov mov dword ptr [eax], edi
    mov mov edx, dword ptr [ecx]
    mov mov dword ptr [eax + 16], edx
    add add ecx, 12
    add add eax, 48
    dec dec ebx
    jne sub_10003FA2
    xor xor eax, eax
    test test esi, esi
    jle sub_10003FF7
    jmp sub_10003FDA
    lea lea ebx, [ebx]
    mov mov ebx, dword ptr [g_101AE4A0]
    lea lea edx, [eax + eax*2]
    lea lea ecx, [eax + 1]
    shl shl edx, 4
    push push ecx
    add add edx, ebx
    push push edx
    call sub_10003DD8
    add add esp, 8
    cmp cmp eax, esi
FUN_10003ee0 ENDP
END
