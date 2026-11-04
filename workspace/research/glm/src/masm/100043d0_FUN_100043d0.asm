.686
.MODEL FLAT, C
EXTRN sub_10001959:PROC
EXTRN fp_101D49D4:DWORD
EXTRN g_101AE494:DWORD
.CODE
FUN_100043d0 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 12]
    push esi
    push edi
    mov ebx, 4
    mov edx, 11
    mov eax, ebp
    call sub_10001959
    mov esi, eax
    mov eax, dword ptr [ebp]
    mov edi, dword ptr [eax + 100]
    mov eax, dword ptr [ebp + 4]
    lea ecx, [esi*4]
    push ecx
    add edi, eax
    call dword ptr [fp_101D49D4]
    add esp, 4
    test esi, esi
    mov dword ptr [g_101AE494], eax
    jle L1
    sub edi, eax
L0:
    mov edx, dword ptr [edi + eax]
    mov dword ptr [eax], edx
    add eax, 4
    dec esi
    jne L0
L1:
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_100043d0 ENDP
END
