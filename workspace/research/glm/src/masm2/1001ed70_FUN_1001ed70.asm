.686
.MODEL FLAT, C
EXTRN sub_1001E2BF:PROC
EXTRN sub_1001EE1C:PROC
EXTRN sub_1001EE28:PROC
.CODE
FUN_1001ed70 PROC
    push push ebp
    mov mov ebp, esp
    and and esp, -16
    sub sub esp, 84
    push push ebx
    mov mov ebx, dword ptr [eax + 12]
    movsx movsx eax, word ptr [eax + 2]
    mov mov dword ptr [esp + 12], ecx
    mov mov ecx, dword ptr [ebp + 8]
    add add ecx, edx
    test test eax, eax
    push push esi
    push push edi
    mov mov dword ptr [esp + 28], ecx
    jle sub_1001EE1C
    mov mov dword ptr [esp + 24], eax
    jmp L0
    lea lea ebx, [ebx]
    mov mov edx, dword ptr [ebx + 12]
    mov mov eax, dword ptr [ebx + 28]
    mov mov ecx, dword ptr [ebx + 44]
    mov mov dword ptr [esp + 60], edx
    mov mov dword ptr [esp + 64], eax
    lea lea edx, [ebx + 32]
    push push edx
    lea lea eax, [ebx + 48]
    mov mov dword ptr [esp + 72], ecx
    push push eax
    mov mov eax, dword ptr [esp + 36]
    lea lea esi, [ebx + 16]
    lea lea ecx, [esp + 40]
    mov mov edi, ebx
L0:
    call sub_1001E2BF
    mov mov eax, dword ptr [esp + 28]
    mov mov edi, eax
    add add eax, 64
    mov mov dword ptr [esp + 28], eax
    mov mov eax, dword ptr [esp + 32]
    add add esp, 8
    add add ebx, 64
    mov mov ecx, 16
    lea lea esi, [esp + 32]
    dec dec eax
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov dword ptr [esp + 24], eax
    jne sub_1001EE28
    pop pop edi
FUN_1001ed70 ENDP
END
