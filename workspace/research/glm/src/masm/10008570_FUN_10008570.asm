.686
.MODEL FLAT, C
EXTRN sub_1005C888:PROC
EXTRN fp_101D49C8:DWORD
EXTRN g_101CE580:DWORD
.CODE
FUN_10008570 PROC
    mov ecx, dword ptr [g_101CE580]
    cmp ecx, 000001000h
    push esi
    mov esi, dword ptr [esp + 8]
    push edi
    mov edi, eax
    jne L0
    push ecx
    push 0101925A8h
    push 1
    call dword ptr [fp_101D49C8]
    add esp, 12
    pop edi
    pop esi
    ret
L0:
    mov eax, dword ptr [esi + 56]
    test eax, eax
    je L2
L1:
    cmp dword ptr [eax], ebx
    je L3
    mov eax, dword ptr [eax + 28]
    test eax, eax
    jne L1
L2:
    mov eax, ecx
    shl eax, 5
    add eax, 0101AE580h
    inc ecx
    mov dword ptr [g_101CE580], ecx
    mov dword ptr [eax], ebx
    mov ecx, dword ptr [edx]
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [edx + 4]
    mov dword ptr [eax + 8], ecx
    mov edx, dword ptr [edx + 8]
    mov dword ptr [eax + 12], edx
    mov ecx, dword ptr [edi]
    mov dword ptr [eax + 16], ecx
    mov edx, dword ptr [edi + 4]
    mov dword ptr [eax + 20], edx
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [eax + 24], ecx
    mov edx, dword ptr [esi + 56]
    mov dword ptr [eax + 28], edx
    pop edi
    mov dword ptr [esi + 56], eax
    pop esi
    ret
L3:
    lea esi, [eax + 16]
    lea ecx, [eax + 4]
    call sub_1005C888
    pop edi
    pop esi
    ret
FUN_10008570 ENDP
END
