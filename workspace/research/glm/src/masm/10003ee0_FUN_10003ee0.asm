.686
.MODEL FLAT, C
EXTRN sub_10001959:PROC
EXTRN sub_10003DD8:PROC
EXTRN sub_10003FF7:PROC
EXTRN fp_101D49D4:DWORD
EXTRN g_101AE4A0:DWORD
EXTRN g_101AE4A4:DWORD
.CODE
FUN_10003ee0 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 12]
    push esi
    push edi
    mov ebx, 12
    mov edx, 22
    mov eax, ebp
    call sub_10001959
    mov esi, eax
    mov eax, dword ptr [ebp]
    mov edi, dword ptr [eax + 0000000BCh]
    mov eax, dword ptr [ebp + 4]
    lea ecx, [esi + esi*2]
    shl ecx, 4
    push ecx
    add edi, eax
    call dword ptr [fp_101D49D4]
    add esp, 4
    test esi, esi
    mov dword ptr [g_101AE4A0], eax
    mov dword ptr [g_101AE4A4], esi
    jle L3
    lea ecx, [edi + 8]
    add eax, 24
    mov ebx, esi
L0:
    mov edi, dword ptr [ecx - 4]
    test edi, edi
    je L1
    mov edx, dword ptr [ecx - 8]
    jmp L2
L1:
    or edx, 0FFFFFFFFh
L2:
    mov dword ptr [eax + 4], edx
    mov dword ptr [eax], edi
    mov edx, dword ptr [ecx]
    mov dword ptr [eax + 16], edx
    add ecx, 12
    add eax, 48
    dec ebx
    jne L0
L3:
    xor eax, eax
    test esi, esi
    jle sub_10003FF7
    jmp L4
    lea ebx, [ebx]
L4:
    mov ebx, dword ptr [g_101AE4A0]
    lea edx, [eax + eax*2]
    lea ecx, [eax + 1]
    shl edx, 4
    push ecx
    add edx, ebx
    push edx
    call sub_10003DD8
    add esp, 8
    cmp eax, esi
FUN_10003ee0 ENDP
END
