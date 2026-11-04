.686
.MODEL FLAT, C
EXTRN g_101D1C04:DWORD
.CODE
FUN_10012b00 PROC
    push ebp
    mov ebp, dword ptr [esp + 12]
    push esi
    mov esi, dword ptr [g_101D1C04]
    push edi
    xor edi, edi
    dec esi
    js L4
L0:
    lea eax, [esi + edi]
    cdq
    sub eax, edx
    sar eax, 1
    mov edx, eax
    shl edx, 4
    mov ecx, dword ptr [edx + 0101D1C08h]
    sub ecx, ebx
    jne L1
    mov ecx, dword ptr [edx + 0101D1C0Ch]
    sub ecx, dword ptr [esp + 16]
    jne L1
    mov ecx, dword ptr [edx + 0101D1C10h]
    sub ecx, ebp
    je L5
L1:
    test ecx, ecx
    jge L2
    lea edi, [eax + 1]
    jmp L3
L2:
    lea esi, [eax - 1]
L3:
    cmp edi, esi
    jle L0
L4:
    shl esi, 4
    cmp dword ptr [esi + 0101D1C08h], ebx
    jne L6
    mov eax, dword ptr [esi + 0101D1C0Ch]
    cmp eax, dword ptr [esp + 16]
    jne L6
    mov eax, dword ptr [esi + 0101D1C10h]
    pop edi
    pop esi
    pop ebp
    ret
L5:
    pop edi
    pop esi
    mov eax, ebp
    pop ebp
    ret
L6:
    shl edi, 4
    mov eax, dword ptr [edi + 0101D1C10h]
    pop edi
    pop esi
    pop ebp
    ret
FUN_10012b00 ENDP
END
