.686
.MODEL FLAT, C
EXTRN sub_100F7DE0:PROC
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
EXTRN g_101A4688:DWORD
EXTRN g_101A468C:DWORD
EXTRN g_101A46A8:DWORD
EXTRN g_101A46AC:DWORD
EXTRN g_101A50D0:DWORD
EXTRN g_101A50D4:DWORD
EXTRN g_101AE198:DWORD
EXTRN g_101AE1A8:DWORD
EXTRN g_101AE1AC:DWORD
.CODE
__setlocale_set_cat PROC
    push ebp
    lea ebp, [esp - 116]
    sub esp, 0000001C0h
    mov eax, dword ptr [g_101A50D0]
    mov dword ptr [ebp + 112], eax
    push esi
    lea eax, [ebp - 00000011Ch]
    push eax
    lea eax, [ebp - 000000138h]
    push eax
    lea eax, [ebp - 20]
    push eax
    push dword ptr [ebp + 124]
    call sub_100F7DE0
    add esp, 20
    test eax, eax
    je L15
    push ebx
    lea ebx, [esi + esi*2]
    shl ebx, 2
    push dword ptr [ebx + 0101A47C4h]
    lea eax, [ebp - 20]
    push eax
    call sub_101003EF
    test eax, eax
    pop ecx
    pop ecx
    jne L0
    mov eax, dword ptr [ebx + 0101A47C4h]
    jmp L14
L0:
    lea eax, [ebp - 20]
    push eax
    call sub_100FA269
    inc eax
    push eax
    call sub_100FC4D4
    test eax, eax
    pop ecx
    pop ecx
    mov dword ptr [ebp - 000000124h], eax
    je L14
    mov eax, dword ptr [ebx + 0101A47C4h]
    push edi
    mov dword ptr [ebp - 000000120h], eax
    lea edi, [esi*4 + 0101AE190h]
    mov eax, dword ptr [edi]
    mov dword ptr [ebp - 00000013Ch], eax
    lea eax, [esi + esi*2]
    lea eax, [eax*2 + 0101AE1B4h]
    push 6
    push eax
    mov dword ptr [ebp - 000000118h], eax
    lea eax, [ebp - 00000014Ch]
    push eax
    call sub_100FCEAB
    mov eax, dword ptr [g_101AE1A8]
    mov dword ptr [ebp - 000000128h], eax
    lea eax, [ebp - 20]
    push eax
    push dword ptr [ebp - 000000124h]
    call sub_100FE965
    mov dword ptr [ebx + 0101A47C4h], eax
    movzx eax, word ptr [ebp - 000000138h]
    mov dword ptr [edi], eax
    push 6
    lea eax, [ebp - 000000138h]
    push eax
    push dword ptr [ebp - 000000118h]
    call sub_100FCEE8
    add esp, 32
    cmp esi, 2
    jne L9
    mov eax, dword ptr [ebp - 00000011Ch]
    mov ecx, dword ptr [g_101A46A8]
    and dword ptr [ebp - 000000118h], 0
    mov dword ptr [g_101AE1A8], eax
    mov eax, dword ptr [g_101A46AC]
    mov dword ptr [ebp - 00000012Ch], eax
    mov eax, 0101A4688h
L1:
    mov edx, dword ptr [ebp - 00000011Ch]
    cmp edx, dword ptr [eax]
    je L2
    mov edx, dword ptr [eax]
    inc dword ptr [ebp - 000000118h]
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [ebp - 00000012Ch]
    mov dword ptr [ebp - 000000144h], edx
    mov edx, dword ptr [eax + 4]
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [ebp - 000000144h]
    add eax, 8
    cmp eax, 0101A46B0h
    mov dword ptr [ebp - 00000012Ch], edx
    jl L1
    jmp L3
L2:
    mov eax, dword ptr [ebp - 000000118h]
    test eax, eax
    je L3
    lea eax, [eax*8 + 0101A4688h]
    mov edx, dword ptr [eax]
    mov dword ptr [g_101A4688], edx
    mov edx, dword ptr [eax + 4]
    mov dword ptr [g_101A468C], edx
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [ebp - 00000012Ch]
    mov dword ptr [eax + 4], ecx
L3:
    cmp dword ptr [ebp - 000000118h], 5
    jne L7
    push 1
    push dword ptr [g_101AE198]
    lea eax, [ebp - 000000114h]
    push dword ptr [ebp - 00000011Ch]
    push eax
    push 127
    push 01017C5B8h
    push 1
    call sub_10100FDB
    add esp, 28
    test eax, eax
    je L5
    xor eax, eax
L4:
    and byte ptr [ebp + eax*2 - 000000113h], 1
    inc eax
    cmp eax, 127
    jb L4
    push 0000000FEh
    lea eax, [ebp - 000000114h]
    push 01017C4B8h
    push eax
    call sub_10100F50
    add esp, 12
    neg eax
    sbb eax, eax
    inc eax
    jmp L6
L5:
    xor eax, eax
L6:
    mov ecx, dword ptr [g_101AE1A8]
    mov dword ptr [g_101A468C], eax
    mov dword ptr [g_101A4688], ecx
    jmp L8
L7:
    mov eax, dword ptr [g_101A468C]
L8:
    mov dword ptr [g_101A50D4], eax
L9:
    cmp esi, 1
    jne L10
    mov eax, dword ptr [ebp - 00000011Ch]
    mov dword ptr [g_101AE1AC], eax
L10:
    call dword ptr [ebx + 0x101a47c8]
    test eax, eax
    je L11
    mov eax, dword ptr [ebp - 000000120h]
    push dword ptr [ebp - 000000124h]
    mov dword ptr [ebx + 0101A47C4h], eax
    call sub_100F871A
    mov eax, dword ptr [ebp - 00000013Ch]
    mov dword ptr [edi], eax
    mov eax, dword ptr [ebp - 000000128h]
    mov dword ptr [g_101AE1A8], eax
    pop ecx
    xor eax, eax
    jmp L13
L11:
    cmp dword ptr [ebp - 000000120h], 0101A4628h
    je L12
    push dword ptr [ebp - 000000120h]
    call sub_100F8749
    pop ecx
L12:
    mov eax, dword ptr [ebx + 0101A47C4h]
L13:
    pop edi
L14:
    pop ebx
L15:
    mov ecx, dword ptr [ebp + 112]
    call sub_10100FD7
    add ebp, 116
    leave
    ret
__setlocale_set_cat ENDP
END
