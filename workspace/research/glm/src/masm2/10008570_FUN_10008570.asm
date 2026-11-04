.686
.MODEL FLAT, C
EXTRN sub_10008622:PROC
EXTRN sub_1005C888:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN g_101CE580:DWORD:DWORD
.CODE
FUN_10008570 PROC
    mov mov ecx, dword ptr [g_101CE580]
    cmp cmp ecx, 01000h
    push push esi
    mov mov esi, dword ptr [esp + 8]
    push push edi
    mov mov edi, eax
    jne L0
    push push ecx
    push push 0101925A8h
    push push 1
    call dword ptr [fp_101D49C8]
    add add esp, 12
    pop pop edi
    pop pop esi
    ret ret
    mov mov eax, dword ptr [esi + 56]
    test test eax, eax
    je L1
    cmp cmp dword ptr [eax], ebx
    je sub_10008622
    mov mov eax, dword ptr [eax + 28]
    test test eax, eax
    jne L1
    mov mov eax, ecx
    shl shl eax, 5
    add add eax, 0101AE580h
    inc inc ecx
    mov mov dword ptr [g_101CE580], ecx
    mov mov dword ptr [eax], ebx
    mov mov ecx, dword ptr [edx]
    mov mov dword ptr [eax + 4], ecx
    mov mov ecx, dword ptr [edx + 4]
    mov mov dword ptr [eax + 8], ecx
    mov mov edx, dword ptr [edx + 8]
    mov mov dword ptr [eax + 12], edx
    mov mov ecx, dword ptr [edi]
    mov mov dword ptr [eax + 16], ecx
    mov mov edx, dword ptr [edi + 4]
    mov mov dword ptr [eax + 20], edx
    mov mov ecx, dword ptr [edi + 8]
    mov mov dword ptr [eax + 24], ecx
    mov mov edx, dword ptr [esi + 56]
    mov mov dword ptr [eax + 28], edx
    pop pop edi
    mov mov dword ptr [esi + 56], eax
    pop pop esi
    ret ret
    lea lea esi, [eax + 16]
    lea lea ecx, [eax + 4]
    call sub_1005C888
    pop pop edi
    pop pop esi
    ret ret
FUN_10008570 ENDP
END
