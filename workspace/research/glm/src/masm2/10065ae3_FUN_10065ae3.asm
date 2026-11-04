.686
.MODEL FLAT, C
EXTRN sub_10065194:PROC
EXTRN sub_10065C2E:PROC
EXTRN sub_10065C47:PROC
EXTRN sub_10065C57:PROC
EXTRN sub_1006745E:PROC
EXTRN sub_10082659:PROC
EXTRN sub_100840DE:PROC
EXTRN sub_100F6236:PROC
EXTRN sub_100F6248:PROC
EXTRN sub_100F6253:PROC
EXTRN sub_100F7A2B:PROC
EXTRN sub_100F83FC:PROC
EXTRN sub_100F842B:PROC
.CODE
FUN_10065ae3 PROC
    mov mov edi, edi
    push push ebx
    push push esi
    push push edi
    push push 010000h
    push push 0100000h
    mov mov ebx, ecx
    call sub_10082659
    lea lea ecx, [ebx + 24]
    call sub_1006745E
    xor xor esi, esi
    mov mov ecx, ebx
    mov mov dword ptr [ebx + 02A4h], esi
    call sub_10065194
    push push 127
    pop pop ecx
    xor xor edx, edx
    inc inc edx
    xor xor eax, eax
    mov mov dword ptr [ebx + 56], esi
    mov mov dword ptr [ebx + 60], esi
    mov mov dword ptr [ebx + 64], edx
    mov mov dword ptr [ebx + 68], esi
    mov mov dword ptr [ebx + 72], esi
    mov mov dword ptr [ebx + 76], edx
    mov mov dword ptr [ebx + 80], edx
    mov mov dword ptr [ebx + 84], edx
    mov mov dword ptr [ebx + 88], esi
    mov mov dword ptr [ebx + 92], esi
    mov mov dword ptr [ebx + 96], esi
    mov mov dword ptr [ebx + 100], esi
    mov mov dword ptr [ebx + 104], esi
    mov mov dword ptr [ebx + 0268h], esi
    mov mov dword ptr [ebx + 026Ch], esi
    push push 8
    lea lea edi, [ebx + 108]
    rep stosd rep stosd dword ptr es:[edi], eax
    pop pop ecx
    lea lea edi, [ebx + 0278h]
    push push esi
    rep stosd rep stosd dword ptr es:[edi], eax
    push push 4
    mov mov dword ptr [ebx + 0298h], edx
    call sub_100F83FC
    push push eax
    call sub_100F7A2B
    add add esp, 12
    cmp cmp eax, esi
    mov mov dword ptr [ebx + 029Ch], eax
    mov mov edx, 01010C878h
    je sub_10065C2E
    mov mov esi, eax
    push push 2
    mov mov edi, edx
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_10065C47
    xor xor esi, esi
    push push edx
    push push 4
    call sub_100F842B
    pop pop ecx
    pop pop ecx
    jmp sub_10065C57
    xor xor esi, esi
    push push esi
    push push esi
    call sub_100F6236
    push push 08001Fh
    push push -1
    mov mov dword ptr [ebx + 02A0h], eax
    call sub_100F6248
    push push 030000h
    push push esi
    call sub_100F6253
    add add esp, 24
    call sub_100840DE
    pop pop edi
    pop pop esi
    mov mov eax, ebx
    pop pop ebx
    ret ret
FUN_10065ae3 ENDP
END
