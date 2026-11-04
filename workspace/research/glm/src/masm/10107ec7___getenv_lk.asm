.686
.MODEL FLAT, C
EXTRN sub_100FA243:PROC
EXTRN sub_100FA24E:PROC
EXTRN sub_10109552:PROC
EXTRN sub_10109564:PROC
EXTRN g_101AE02C:DWORD
EXTRN g_101AE034:DWORD
EXTRN g_1076ADA0:DWORD
.CODE
__getenv_lk PROC
    cmp dword ptr [g_1076ADA0], 0
    push esi
    mov esi, dword ptr [g_101AE02C]
    jne L0
    xor eax, eax
    pop esi
    ret
L0:
    test esi, esi
    push ebx
    push edi
    jne L1
    cmp dword ptr [g_101AE034], esi
    je L5
    call sub_10109564
    test eax, eax
    jne L5
    mov esi, dword ptr [g_101AE02C]
    test esi, esi
    je L5
L1:
    mov ebx, dword ptr [esp + 16]
    test ebx, ebx
    je L5
    push ebx
    call sub_100FA243
    pop ecx
    mov edi, eax
    jmp L4
L2:
    push eax
    call sub_100FA24E
    cmp eax, edi
    pop ecx
    jbe L3
    mov eax, dword ptr [esi]
    cmp byte ptr [eax + edi], 61
    jne L3
    push edi
    push ebx
    push eax
    call sub_10109552
    add esp, 12
    test eax, eax
    je L7
L3:
    add esi, 4
L4:
    mov eax, dword ptr [esi]
    test eax, eax
    jne L2
L5:
    xor eax, eax
L6:
    pop edi
    pop ebx
    pop esi
    ret
L7:
    mov eax, dword ptr [esi]
    lea eax, [eax + edi + 1]
    jmp L6
__getenv_lk ENDP
END
