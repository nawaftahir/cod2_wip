.686
.MODEL FLAT, C
EXTRN sub_100FA243:PROC
EXTRN sub_100FA24E:PROC
EXTRN sub_10107F5C:PROC
EXTRN sub_10107F65:PROC
EXTRN sub_10107F6F:PROC
EXTRN sub_10107F77:PROC
EXTRN sub_10107F7C:PROC
EXTRN sub_10107F82:PROC
EXTRN sub_10107F84:PROC
EXTRN sub_10107F8C:PROC
EXTRN sub_10107FAA:PROC
EXTRN sub_10107FBD:PROC
EXTRN sub_10109552:PROC
EXTRN sub_10109564:PROC
EXTRN EXTRN g_101AE02C:DWORD:DWORD
EXTRN EXTRN g_101AE034:DWORD:DWORD
EXTRN EXTRN g_1076ADA0:DWORD:DWORD
.CODE
__getenv_lk PROC
    cmp cmp dword ptr [g_1076ADA0], 0
    push push esi
    mov mov esi, dword ptr [g_101AE02C]
    jne L0
    xor xor eax, eax
    pop pop esi
    ret ret
    test test esi, esi
    push push ebx
    push push edi
    jne L1
    cmp cmp dword ptr [g_101AE034], esi
    je sub_10107F5C
    call sub_10109564
    test test eax, eax
    jne sub_10107F65
    mov mov esi, dword ptr [g_101AE02C]
    test test esi, esi
    je sub_10107F6F
    mov mov ebx, dword ptr [esp + 16]
    test test ebx, ebx
    je sub_10107F77
    push push ebx
    call sub_100FA243
    pop pop ecx
    mov mov edi, eax
    jmp sub_10107F7C
    push push eax
    call sub_100FA24E
    cmp cmp eax, edi
    pop pop ecx
    jbe sub_10107F84
    mov mov eax, dword ptr [esi]
    cmp cmp byte ptr [eax + edi], 61
    jne sub_10107F8C
    push push edi
    push push ebx
    push push eax
    call sub_10109552
    add add esp, 12
    test test eax, eax
    je sub_10107FAA
    add add esi, 4
    mov mov eax, dword ptr [esi]
    test test eax, eax
    jne sub_10107F82
    xor xor eax, eax
    pop pop edi
    pop pop ebx
    pop pop esi
    ret ret
    mov mov eax, dword ptr [esi]
    lea lea eax, [eax + edi + 1]
    jmp sub_10107FBD
__getenv_lk ENDP
END
