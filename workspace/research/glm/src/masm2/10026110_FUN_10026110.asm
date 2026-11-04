.686
.MODEL FLAT, C
EXTRN sub_10025D9B:PROC
EXTRN sub_10025ED7:PROC
EXTRN sub_100261DE:PROC
EXTRN EXTRN fp_101D49DC:DWORD:DWORD
EXTRN EXTRN fp_101D49E0:DWORD:DWORD
EXTRN EXTRN g_101D4C6C:DWORD:DWORD
EXTRN EXTRN g_101D4C70:DWORD:DWORD
.CODE
FUN_10026110 PROC
    push push ecx
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 20]
    push push esi
    mov mov esi, eax
    mov mov eax, dword ptr [g_101D4C6C]
    push push edi
    mov mov edi, ecx
    sub sub ecx, eax
    mov mov ecx, edi
    jns L0
    mov mov ecx, eax
    mov mov edx, dword ptr [esp + 24]
    mov mov eax, dword ptr [g_101D4C70]
    mov mov ebx, edx
    sub sub ebx, eax
    js L1
    mov mov eax, edx
    imul imul eax, ecx
    imul imul eax, esi
    add add eax, ebp
    push push eax
    call dword ptr [fp_101D49DC]
    mov mov edx, dword ptr [g_101D4C70]
    add add esp, 4
    mov mov ebx, eax
    mov mov eax, dword ptr [g_101D4C6C]
    push push ebx
    push push esi
    push push edx
    push push eax
    xor xor ecx, ecx
    xor xor eax, eax
    call sub_10025ED7
    add add esp, 16
    test test al, al
    jne sub_100261DE
    push push ebx
    call dword ptr [fp_101D49E0]
    add add esp, 4
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    pop pop ecx
    ret ret
    mov mov edx, dword ptr [esp + 24]
    mov mov eax, dword ptr [g_101D4C70]
    lea lea ecx, [ebx + ebp]
    push push ecx
    mov mov ecx, dword ptr [g_101D4C6C]
    push push edx
    push push eax
    push push ecx
    call sub_10025D9B
    add add esp, 16
    pop pop edi
    pop pop esi
    pop pop ebp
    mov mov eax, ebx
    pop pop ebx
    pop pop ecx
    ret ret
FUN_10026110 ENDP
END
