.686
.MODEL FLAT, C
EXTRN sub_10061C9D:PROC
EXTRN sub_10061CBD:PROC
EXTRN sub_10061D2D:PROC
EXTRN sub_100F5EBB:PROC
EXTRN EXTRN g_101AAC70:DWORD:DWORD
.CODE
FUN_1005f0e0 PROC
    mov mov eax, dword ptr [g_101AAC70]
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    xor xor ebx, ebx
    cmp cmp eax, 15
    push push esi
    jne L0
    push push 01019B9C8h
    call sub_10061C9D
    mov mov eax, dword ptr [g_101AAC70]
    add add esp, 4
    xor xor esi, esi
    cmp cmp eax, ebx
    jle L1
    push push edi
    mov mov edi, 0101A6ACCh
    push push edi
    push push esi
    push push 01019B9C0h
    call sub_10061CBD
    mov mov eax, dword ptr [g_101AAC70]
    add add esp, 12
    inc inc esi
    add add edi, 045Ch
    cmp cmp esi, eax
    jl L2
    pop pop edi
    push push ebp
    push push 01019B980h
    push push ebx
    call sub_10061D2D
    mov mov eax, dword ptr [g_101AAC70]
    add add esp, 12
    inc inc eax
    mov mov dword ptr [g_101AAC70], eax
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov ecx, 1
    push push 63
    mov mov dword ptr [eax + 0400h], ecx
    mov mov byte ptr [eax + 0405h], cl
    mov mov ecx, 01019166Eh
    lea lea esi, [eax + 041Ch]
    push push ebp
    push push esi
    mov mov byte ptr [eax + 0404h], bl
    mov mov byte ptr [eax + 0406h], bl
    mov mov byte ptr [eax + 0407h], bl
    mov mov byte ptr [eax + 0408h], bl
    mov mov dword ptr [eax + 040Ch], ecx
    mov mov dword ptr [eax + 0410h], ecx
    mov mov dword ptr [eax + 0414h], ebx
    mov mov dword ptr [eax + 0418h], ebx
    call sub_100F5EBB
    add add esp, 12
    mov mov byte ptr [esi + 63], bl
    pop pop esi
    pop pop ebp
    pop pop ebx
    ret ret
FUN_1005f0e0 ENDP
END
