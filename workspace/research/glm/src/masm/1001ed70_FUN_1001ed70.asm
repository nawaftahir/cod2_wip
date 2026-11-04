.686
.MODEL FLAT, C
EXTRN sub_1001E2BF:PROC
.CODE
FUN_1001ed70 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF0h
    sub esp, 84
    push ebx
    mov ebx, dword ptr [eax + 12]
    movsx eax, word ptr [eax + 2]
    mov dword ptr [esp + 12], ecx
    mov ecx, dword ptr [ebp + 8]
    add ecx, edx
    test eax, eax
    push esi
    push edi
    mov dword ptr [esp + 28], ecx
    jle L1
    mov dword ptr [esp + 24], eax
    jmp L0
    lea ebx, [ebx]
L0:
    mov edx, dword ptr [ebx + 12]
    mov eax, dword ptr [ebx + 28]
    mov ecx, dword ptr [ebx + 44]
    mov dword ptr [esp + 60], edx
    mov dword ptr [esp + 64], eax
    lea edx, [ebx + 32]
    push edx
    lea eax, [ebx + 48]
    mov dword ptr [esp + 72], ecx
    push eax
    mov eax, dword ptr [esp + 36]
    lea esi, [ebx + 16]
    lea ecx, [esp + 40]
    mov edi, ebx
    call sub_1001E2BF
    mov eax, dword ptr [esp + 28]
    mov edi, eax
    add eax, 64
    mov dword ptr [esp + 28], eax
    mov eax, dword ptr [esp + 32]
    add esp, 8
    add ebx, 64
    mov ecx, 16
    lea esi, [esp + 32]
    dec eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov dword ptr [esp + 24], eax
    jne L0
L1:
    pop edi
FUN_1001ed70 ENDP
END
