.686
.MODEL FLAT, C
EXTRN sub_10025D9B:PROC
EXTRN sub_10025ED7:PROC
EXTRN fp_101D49DC:DWORD
EXTRN fp_101D49E0:DWORD
EXTRN g_101D4C6C:DWORD
EXTRN g_101D4C70:DWORD
.CODE
FUN_10026110 PROC
    push ecx
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 20]
    push esi
    mov esi, eax
    mov eax, dword ptr [g_101D4C6C]
    push edi
    mov edi, ecx
    sub ecx, eax
    mov ecx, edi
    jns L0
    mov ecx, eax
L0:
    mov edx, dword ptr [esp + 24]
    mov eax, dword ptr [g_101D4C70]
    mov ebx, edx
    sub ebx, eax
    js L1
    mov eax, edx
L1:
    imul eax, ecx
    imul eax, esi
    add eax, ebp
    push eax
    call dword ptr [fp_101D49DC]
    mov edx, dword ptr [g_101D4C70]
    add esp, 4
    mov ebx, eax
    mov eax, dword ptr [g_101D4C6C]
    push ebx
    push esi
    push edx
    push eax
    xor ecx, ecx
    xor eax, eax
    call sub_10025ED7
    add esp, 16
    test al, al
    jne L2
    push ebx
    call dword ptr [fp_101D49E0]
    add esp, 4
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    pop ebx
    pop ecx
    ret
L2:
    mov edx, dword ptr [esp + 24]
    mov eax, dword ptr [g_101D4C70]
    lea ecx, [ebx + ebp]
    push ecx
    mov ecx, dword ptr [g_101D4C6C]
    push edx
    push eax
    push ecx
    call sub_10025D9B
    add esp, 16
    pop edi
    pop esi
    pop ebp
    mov eax, ebx
    pop ebx
    pop ecx
    ret
FUN_10026110 ENDP
END
