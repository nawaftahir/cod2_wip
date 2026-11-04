.686
.MODEL FLAT, C
.CODE
FUN_10028930 PROC
    sub esp, 8
    push ebp
    mov ebp, dword ptr [esp + 16]
    push esi
    push edi
    mov edi, eax
    sub edi, ebp
    mov ecx, ebx
    sub ecx, ebp
    sar edi, 3
    sar ecx, 3
    test edi, edi
    mov eax, ecx
    mov esi, edi
    je L1
L0:
    cdq
    idiv esi
    mov eax, esi
    test edx, edx
    mov esi, edx
    jne L0
L1:
    cmp eax, ecx
    jge L8
    test eax, eax
    jle L8
    lea esi, [ebp + eax*8]
    mov dword ptr [esp + 24], eax
    jmp L2
    lea ecx, [ecx]
L2:
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [esi + 4]
    mov dword ptr [esp + 12], eax
    lea eax, [esi + edi*8]
    cmp eax, ebx
    mov edx, esi
    mov dword ptr [esp + 16], ecx
    jne L3
    mov eax, ebp
L3:
    cmp eax, esi
    je L7
    lea esp, [esp]
L4:
    mov ecx, dword ptr [eax]
    mov dword ptr [edx], ecx
    mov ecx, dword ptr [eax + 4]
    mov dword ptr [edx + 4], ecx
    mov ecx, ebx
    sub ecx, eax
    sar ecx, 3
    cmp edi, ecx
    mov edx, eax
    jge L5
    lea ecx, [edi*8]
    add eax, ecx
    jmp L6
L5:
    mov eax, edi
    sub eax, ecx
    lea eax, [ebp + eax*8]
L6:
    cmp eax, esi
    jne L4
L7:
    mov eax, dword ptr [esp + 16]
    mov ecx, dword ptr [esp + 12]
    mov dword ptr [edx + 4], eax
    mov eax, dword ptr [esp + 24]
    sub esi, 8
    dec eax
    mov dword ptr [edx], ecx
    mov dword ptr [esp + 24], eax
    jne L2
L8:
    pop edi
    pop esi
    pop ebp
FUN_10028930 ENDP
END
