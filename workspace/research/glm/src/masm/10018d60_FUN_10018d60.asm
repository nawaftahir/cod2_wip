.686
.MODEL FLAT, C
EXTRN sub_10018CBC:PROC
EXTRN sub_1005F13E:PROC
EXTRN sub_1005F3A0:PROC
EXTRN sub_10060C2E:PROC
EXTRN sub_10061DBA:PROC
EXTRN fp_101D49D4:DWORD
EXTRN fp_101D4AFC:DWORD
EXTRN fp_101D4B00:DWORD
EXTRN g_101AAC70:DWORD
.CODE
FUN_10018d60 PROC
    sub esp, 72
    push ebp
    mov ebp, dword ptr [esp + 80]
    push esi
    push edi
    push ebp
    push 010195728h
    mov esi, 64
    lea edi, [esp + 28]
    call sub_10060C2E
    lea eax, [esp + 20]
    push eax
    mov ecx, edi
    push ecx
    call dword ptr [fp_101D4AFC]
    add esp, 16
    test eax, eax
    jge L0
    mov edx, edi
    push edx
    push 010195708h
    call sub_1005F3A0
    add esp, 8
    pop edi
    pop esi
    xor eax, eax
    pop ebp
    add esp, 72
    ret
L0:
    mov eax, dword ptr [esp + 12]
    lea ecx, [esp + 20]
    push ecx
    mov dword ptr [esp + 20], eax
    call sub_1005F13E
    mov edx, dword ptr [g_101AAC70]
    imul edx, edx, 00000045Ch
    mov dword ptr [edx + 0101A6AC0h], 0101956FCh
    mov eax, dword ptr [g_101AAC70]
    add esp, 4
    imul eax, eax, 00000045Ch
    mov byte ptr [eax + 0101A6AB5h], 0
    mov eax, ebp
    lea edx, [eax + 1]
    mov edi, edi
L1:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L1
    sub eax, edx
    lea esi, [eax + 1]
    lea ecx, [esi + 48]
    push ebx
    push ecx
    call dword ptr [fp_101D49D4]
    mov ebx, eax
    mov ecx, esi
    mov edx, ecx
    shr ecx, 2
    lea edi, [ebx + 48]
    mov dword ptr [ebx], edi
    mov esi, ebp
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    lea eax, [esp + 24]
    and ecx, 3
    push eax
    mov eax, ebx
    rep movsb byte ptr es:[edi], byte ptr [esi]
    call sub_10018CBC
    add esp, 8
    test al, al
    jne L2
    xor ebx, ebx
L2:
    mov eax, dword ptr [g_101AAC70]
    test eax, eax
    jne L3
    push 01019B958h
    push 0
    call sub_10061DBA
    add esp, 8
L3:
    mov esi, dword ptr [g_101AAC70]
    mov ecx, dword ptr [esp + 16]
    dec esi
    push ecx
    mov dword ptr [g_101AAC70], esi
    call dword ptr [fp_101D4B00]
    add esp, 4
    mov eax, ebx
    pop ebx
    pop edi
    pop esi
    pop ebp
    add esp, 72
    ret
FUN_10018d60 ENDP
END
