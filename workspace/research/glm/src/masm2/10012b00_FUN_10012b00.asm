.686
.MODEL FLAT, C
EXTRN sub_10012B8B:PROC
EXTRN sub_10012B93:PROC
EXTRN sub_10012BAF:PROC
EXTRN sub_10012BD0:PROC
EXTRN sub_10012BDC:PROC
EXTRN EXTRN g_101D1C04:DWORD:DWORD
.CODE
FUN_10012b00 PROC
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    push push esi
    mov mov esi, dword ptr [g_101D1C04]
    push push edi
    xor xor edi, edi
    dec dec esi
    js L0
    lea lea eax, [esi + edi]
    cdq cdq
    sub sub eax, edx
    sar sar eax, 1
    mov mov edx, eax
    shl shl edx, 4
    mov mov ecx, dword ptr [edx + 0101D1C08h]
    sub sub ecx, ebx
    jne L1
    mov mov ecx, dword ptr [edx + 0101D1C0Ch]
    sub sub ecx, dword ptr [esp + 16]
    jne L2
    mov mov ecx, dword ptr [edx + 0101D1C10h]
    sub sub ecx, ebp
    je sub_10012BAF
    test test ecx, ecx
    jge sub_10012B8B
    lea lea edi, [eax + 1]
    jmp sub_10012B93
    lea lea esi, [eax - 1]
    cmp cmp edi, esi
    jle L0
    shl shl esi, 4
    cmp cmp dword ptr [esi + 0101D1C08h], ebx
    jne sub_10012BD0
    mov mov eax, dword ptr [esi + 0101D1C0Ch]
    cmp cmp eax, dword ptr [esp + 16]
    jne sub_10012BDC
    mov mov eax, dword ptr [esi + 0101D1C10h]
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
    pop pop edi
    pop pop esi
    mov mov eax, ebp
L2:
    pop pop ebp
    ret ret
    shl shl edi, 4
    mov mov eax, dword ptr [edi + 0101D1C10h]
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
FUN_10012b00 ENDP
END
