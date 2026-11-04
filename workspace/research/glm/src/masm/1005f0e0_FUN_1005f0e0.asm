.686
.MODEL FLAT, C
EXTRN sub_10061C9D:PROC
EXTRN sub_10061CBD:PROC
EXTRN sub_10061D2D:PROC
EXTRN sub_100F5EBB:PROC
EXTRN g_101AAC70:DWORD
.CODE
FUN_1005f0e0 PROC
    mov eax, dword ptr [g_101AAC70]
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 12]
    xor ebx, ebx
    cmp eax, 15
    push esi
    jne L2
    push 01019B9C8h
    call sub_10061C9D
    mov eax, dword ptr [g_101AAC70]
    add esp, 4
    xor esi, esi
    cmp eax, ebx
    jle L1
    push edi
    mov edi, 0101A6ACCh
L0:
    push edi
    push esi
    push 01019B9C0h
    call sub_10061CBD
    mov eax, dword ptr [g_101AAC70]
    add esp, 12
    inc esi
    add edi, 00000045Ch
    cmp esi, eax
    jl L0
    pop edi
L1:
    push ebp
    push 01019B980h
    push ebx
    call sub_10061D2D
    mov eax, dword ptr [g_101AAC70]
    add esp, 12
L2:
    inc eax
    mov dword ptr [g_101AAC70], eax
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov ecx, 1
    push 63
    mov dword ptr [eax + 000000400h], ecx
    mov byte ptr [eax + 000000405h], cl
    mov ecx, 01019166Eh
    lea esi, [eax + 00000041Ch]
    push ebp
    push esi
    mov byte ptr [eax + 000000404h], bl
    mov byte ptr [eax + 000000406h], bl
    mov byte ptr [eax + 000000407h], bl
    mov byte ptr [eax + 000000408h], bl
    mov dword ptr [eax + 00000040Ch], ecx
    mov dword ptr [eax + 000000410h], ecx
    mov dword ptr [eax + 000000414h], ebx
    mov dword ptr [eax + 000000418h], ebx
    call sub_100F5EBB
    add esp, 12
    mov byte ptr [esi + 63], bl
    pop esi
    pop ebp
    pop ebx
    ret
FUN_1005f0e0 ENDP
END
