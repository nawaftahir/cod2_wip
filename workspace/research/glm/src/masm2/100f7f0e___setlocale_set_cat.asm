.686
.MODEL FLAT, C
EXTRN sub_100F7DE0:PROC
EXTRN sub_100F81A2:PROC
EXTRN sub_100F81AE:PROC
EXTRN sub_100F81C9:PROC
EXTRN sub_100F81EF:PROC
EXTRN sub_100F820F:PROC
EXTRN sub_100F8219:PROC
EXTRN sub_100F822B:PROC
EXTRN sub_100F82B4:PROC
EXTRN sub_100F82BD:PROC
EXTRN sub_100F82D2:PROC
EXTRN sub_100F8304:PROC
EXTRN sub_100F8331:PROC
EXTRN sub_100F8355:PROC
EXTRN sub_100F83A3:PROC
EXTRN sub_100F83F0:PROC
EXTRN sub_100F83F6:PROC
EXTRN sub_100F871A:PROC
EXTRN sub_100F8749:PROC
EXTRN sub_100FA269:PROC
EXTRN sub_100FC4D4:PROC
EXTRN sub_100FCEAB:PROC
EXTRN sub_100FCEE8:PROC
EXTRN sub_100FE965:PROC
EXTRN sub_101003EF:PROC
EXTRN sub_10100F50:PROC
EXTRN sub_10100FD7:PROC
EXTRN sub_10100FDB:PROC
EXTRN EXTRN g_101A4688:DWORD:DWORD
EXTRN EXTRN g_101A468C:DWORD:DWORD
EXTRN EXTRN g_101A46A8:DWORD:DWORD
EXTRN EXTRN g_101A46AC:DWORD:DWORD
EXTRN EXTRN g_101A50D0:DWORD:DWORD
EXTRN EXTRN g_101A50D4:DWORD:DWORD
EXTRN EXTRN g_101AE198:DWORD:DWORD
EXTRN EXTRN g_101AE1A8:DWORD:DWORD
EXTRN EXTRN g_101AE1AC:DWORD:DWORD
.CODE
__setlocale_set_cat PROC
    push push ebp
    lea lea ebp, [esp - 116]
    sub sub esp, 01C0h
    mov mov eax, dword ptr [g_101A50D0]
    mov mov dword ptr [ebp + 112], eax
    push push esi
    lea lea eax, [ebp - 011Ch]
    push push eax
    lea lea eax, [ebp - 0138h]
    push push eax
    lea lea eax, [ebp - 20]
    push push eax
    push push dword ptr [ebp + 124]
    call sub_100F7DE0
    add add esp, 20
    test test eax, eax
    je sub_100F81C9
    push push ebx
    lea lea ebx, [esi + esi*2]
    shl shl ebx, 2
    push push dword ptr [ebx + 0101A47C4h]
    lea lea eax, [ebp - 20]
    push push eax
    call sub_101003EF
    test test eax, eax
    pop pop ecx
    pop pop ecx
    jne L0
    mov mov eax, dword ptr [ebx + 0101A47C4h]
    jmp sub_100F81EF
    lea lea eax, [ebp - 20]
    push push eax
    call sub_100FA269
    inc inc eax
    push push eax
    call sub_100FC4D4
    test test eax, eax
    pop pop ecx
    pop pop ecx
    mov mov dword ptr [ebp - 0124h], eax
    je sub_100F820F
    mov mov eax, dword ptr [ebx + 0101A47C4h]
    push push edi
    mov mov dword ptr [ebp - 0120h], eax
    lea lea edi, [esi*4 + 0101AE190h]
    mov mov eax, dword ptr [edi]
    mov mov dword ptr [ebp - 013Ch], eax
    lea lea eax, [esi + esi*2]
    lea lea eax, [eax*2 + 0101AE1B4h]
    push push 6
    push push eax
    mov mov dword ptr [ebp - 0118h], eax
    lea lea eax, [ebp - 014Ch]
L0:
    push push eax
    call sub_100FCEAB
    mov mov eax, dword ptr [g_101AE1A8]
    mov mov dword ptr [ebp - 0128h], eax
    lea lea eax, [ebp - 20]
    push push eax
    push push dword ptr [ebp - 0124h]
    call sub_100FE965
    mov mov dword ptr [ebx + 0101A47C4h], eax
    movzx movzx eax, word ptr [ebp - 0138h]
    mov mov dword ptr [edi], eax
    push push 6
    lea lea eax, [ebp - 0138h]
    push push eax
    push push dword ptr [ebp - 0118h]
    call sub_100FCEE8
    add add esp, 32
    cmp cmp esi, 2
    jne sub_100F822B
    mov mov eax, dword ptr [ebp - 011Ch]
    mov mov ecx, dword ptr [g_101A46A8]
    and and dword ptr [ebp - 0118h], 0
    mov mov dword ptr [g_101AE1A8], eax
    mov mov eax, dword ptr [g_101A46AC]
    mov mov dword ptr [ebp - 012Ch], eax
    mov mov eax, 0101A4688h
    mov mov edx, dword ptr [ebp - 011Ch]
    cmp cmp edx, dword ptr [eax]
    je sub_100F81AE
    mov mov edx, dword ptr [eax]
    inc inc dword ptr [ebp - 0118h]
    mov mov dword ptr [eax], ecx
    mov mov ecx, dword ptr [ebp - 012Ch]
    mov mov dword ptr [ebp - 0144h], edx
    mov mov edx, dword ptr [eax + 4]
    mov mov dword ptr [eax + 4], ecx
    mov mov ecx, dword ptr [ebp - 0144h]
    add add eax, 8
    cmp cmp eax, 0101A46B0h
    mov mov dword ptr [ebp - 012Ch], edx
    jl sub_100F81A2
    jmp sub_100F820F
    mov mov eax, dword ptr [ebp - 0118h]
    test test eax, eax
    je sub_100F8219
    lea lea eax, [eax*8 + 0101A4688h]
    mov mov edx, dword ptr [eax]
    mov mov dword ptr [g_101A4688], edx
    mov mov edx, dword ptr [eax + 4]
    mov mov dword ptr [g_101A468C], edx
    mov mov dword ptr [eax], ecx
    mov mov ecx, dword ptr [ebp - 012Ch]
    mov mov dword ptr [eax + 4], ecx
    cmp cmp dword ptr [ebp - 0118h], 5
    jne sub_100F82BD
    push push 1
    push push dword ptr [g_101AE198]
    lea lea eax, [ebp - 0114h]
    push push dword ptr [ebp - 011Ch]
    push push eax
    push push 127
    push push 01017C5B8h
    push push 1
    call sub_10100FDB
    add add esp, 28
    test test eax, eax
    je sub_100F82D2
    xor xor eax, eax
    and and byte ptr [ebp + eax*2 - 0113h], 1
    inc inc eax
    cmp cmp eax, 127
    jb sub_100F82B4
    push push 0FEh
    lea lea eax, [ebp - 0114h]
    push push 01017C4B8h
    push push eax
    call sub_10100F50
    add add esp, 12
    neg neg eax
    sbb sbb eax, eax
    inc inc eax
    jmp sub_100F8304
    xor xor eax, eax
    mov mov ecx, dword ptr [g_101AE1A8]
    mov mov dword ptr [g_101A468C], eax
    mov mov dword ptr [g_101A4688], ecx
    jmp sub_100F8331
    mov mov eax, dword ptr [g_101A468C]
    mov mov dword ptr [g_101A50D4], eax
    cmp cmp esi, 1
    jne sub_100F8355
    mov mov eax, dword ptr [ebp - 011Ch]
    mov mov dword ptr [g_101AE1AC], eax
    call call dword ptr [ebx + 0101A47C8h]
    test test eax, eax
    je sub_100F83A3
    mov mov eax, dword ptr [ebp - 0120h]
    push push dword ptr [ebp - 0124h]
    mov mov dword ptr [ebx + 0101A47C4h], eax
    call sub_100F871A
    mov mov eax, dword ptr [ebp - 013Ch]
    mov mov dword ptr [edi], eax
    mov mov eax, dword ptr [ebp - 0128h]
    mov mov dword ptr [g_101AE1A8], eax
    pop pop ecx
    xor xor eax, eax
    jmp sub_100F83F0
    cmp cmp dword ptr [ebp - 0120h], 0101A4628h
    je sub_100F83F6
    push push dword ptr [ebp - 0120h]
    call sub_100F8749
    pop pop ecx
    mov mov eax, dword ptr [ebx + 0101A47C4h]
    pop pop edi
    pop pop ebx
    mov mov ecx, dword ptr [ebp + 112]
    call sub_10100FD7
    add add ebp, 116
    leave leave
    ret ret
__setlocale_set_cat ENDP
END
