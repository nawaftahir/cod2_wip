.686
.MODEL FLAT, C
EXTRN sub_10018CBC:PROC
EXTRN sub_10018E87:PROC
EXTRN sub_10018F08:PROC
EXTRN sub_10018F2B:PROC
EXTRN sub_1005F13E:PROC
EXTRN sub_1005F3A0:PROC
EXTRN sub_10060C2E:PROC
EXTRN sub_10061DBA:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN fp_101D4AFC:DWORD:DWORD
EXTRN EXTRN fp_101D4B00:DWORD:DWORD
EXTRN EXTRN g_101AAC70:DWORD:DWORD
.CODE
FUN_10018d60 PROC
    sub sub esp, 72
    push push ebp
    mov mov ebp, dword ptr [esp + 80]
    push push esi
    push push edi
    push push ebp
    push push 010195728h
    mov mov esi, 64
    lea lea edi, [esp + 28]
    call sub_10060C2E
    lea lea eax, [esp + 20]
    push push eax
    mov mov ecx, edi
    push push ecx
    call dword ptr [fp_101D4AFC]
    add add esp, 16
    test test eax, eax
    jge L0
    mov mov edx, edi
    push push edx
    push push 010195708h
    call sub_1005F3A0
    add add esp, 8
    pop pop edi
    pop pop esi
    xor xor eax, eax
    pop pop ebp
    add add esp, 72
    ret ret
    mov mov eax, dword ptr [esp + 12]
    lea lea ecx, [esp + 20]
    push push ecx
    mov mov dword ptr [esp + 20], eax
    call sub_1005F13E
    mov mov edx, dword ptr [g_101AAC70]
    imul imul edx, edx, 045Ch
    mov mov dword ptr [edx + 0101A6AC0h], 0101956FCh
    mov mov eax, dword ptr [g_101AAC70]
    add add esp, 4
    imul imul eax, eax, 045Ch
    mov mov byte ptr [eax + 0101A6AB5h], 0
    mov mov eax, ebp
    lea lea edx, [eax + 1]
    mov mov edi, edi
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne sub_10018E87
    sub sub eax, edx
    lea lea esi, [eax + 1]
    lea lea ecx, [esi + 48]
    push push ebx
    push push ecx
    call dword ptr [fp_101D49D4]
    mov mov ebx, eax
    mov mov ecx, esi
    mov mov edx, ecx
    shr shr ecx, 2
    lea lea edi, [ebx + 48]
    mov mov dword ptr [ebx], edi
    mov mov esi, ebp
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    lea lea eax, [esp + 24]
    and and ecx, 3
    push push eax
    mov mov eax, ebx
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    call sub_10018CBC
    add add esp, 8
    test test al, al
    jne sub_10018F08
    xor xor ebx, ebx
    mov mov eax, dword ptr [g_101AAC70]
    test test eax, eax
    jne sub_10018F2B
    push push 01019B958h
    push push 0
    call sub_10061DBA
    add add esp, 8
    mov mov esi, dword ptr [g_101AAC70]
    mov mov ecx, dword ptr [esp + 16]
    dec dec esi
    push push ecx
    mov mov dword ptr [g_101AAC70], esi
    call dword ptr [fp_101D4B00]
    add add esp, 4
    mov mov eax, ebx
    pop pop ebx
    pop pop edi
    pop pop esi
    pop pop ebp
    add add esp, 72
    ret ret
FUN_10018d60 ENDP
END
