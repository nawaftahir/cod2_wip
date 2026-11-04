.686
.MODEL FLAT, C
EXTRN sub_10001959:PROC
EXTRN sub_1000445D:PROC
EXTRN sub_1000445F:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN g_101AE494:DWORD:DWORD
.CODE
FUN_100043d0 PROC
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    push push esi
    push push edi
    mov mov ebx, 4
    mov mov edx, 11
    mov mov eax, ebp
    call sub_10001959
    mov mov esi, eax
    mov mov eax, dword ptr [ebp]
    mov mov edi, dword ptr [eax + 100]
    mov mov eax, dword ptr [ebp + 4]
    lea lea ecx, [esi*4]
    push push ecx
    add add edi, eax
    call dword ptr [fp_101D49D4]
    add add esp, 4
    test test esi, esi
    mov mov dword ptr [g_101AE494], eax
    jle sub_1000445D
    sub sub edi, eax
    mov mov edx, dword ptr [edi + eax]
    mov mov dword ptr [eax], edx
    add add eax, 4
    dec dec esi
    jne sub_1000445F
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    ret ret
FUN_100043d0 ENDP
END
