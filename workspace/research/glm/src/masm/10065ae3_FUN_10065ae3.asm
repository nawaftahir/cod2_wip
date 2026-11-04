.686
.MODEL FLAT, C
EXTRN sub_10065194:PROC
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
    mov edi, edi
    push ebx
    push esi
    push edi
    push 000010000h
    push 000100000h
    mov ebx, ecx
    call sub_10082659
    lea ecx, [ebx + 24]
    call sub_1006745E
    xor esi, esi
    mov ecx, ebx
    mov dword ptr [ebx + 0000002A4h], esi
    call sub_10065194
    push 127
    pop ecx
    xor edx, edx
    inc edx
    xor eax, eax
    mov dword ptr [ebx + 56], esi
    mov dword ptr [ebx + 60], esi
    mov dword ptr [ebx + 64], edx
    mov dword ptr [ebx + 68], esi
    mov dword ptr [ebx + 72], esi
    mov dword ptr [ebx + 76], edx
    mov dword ptr [ebx + 80], edx
    mov dword ptr [ebx + 84], edx
    mov dword ptr [ebx + 88], esi
    mov dword ptr [ebx + 92], esi
    mov dword ptr [ebx + 96], esi
    mov dword ptr [ebx + 100], esi
    mov dword ptr [ebx + 104], esi
    mov dword ptr [ebx + 000000268h], esi
    mov dword ptr [ebx + 00000026Ch], esi
    push 8
    lea edi, [ebx + 108]
    rep stosd dword ptr es:[edi], eax
    pop ecx
    lea edi, [ebx + 000000278h]
    push esi
    rep stosd dword ptr es:[edi], eax
    push 4
    mov dword ptr [ebx + 000000298h], edx
    call sub_100F83FC
    push eax
    call sub_100F7A2B
    add esp, 12
    cmp eax, esi
    mov dword ptr [ebx + 00000029Ch], eax
    mov edx, 01010C878h
    je L0
    mov esi, eax
    push 2
    mov edi, edx
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L1
    xor esi, esi
L0:
    push edx
    push 4
    call sub_100F842B
    pop ecx
    pop ecx
    jmp L2
L1:
    xor esi, esi
L2:
    push esi
    push esi
    call sub_100F6236
    push 00008001Fh
    push -1
    mov dword ptr [ebx + 0000002A0h], eax
    call sub_100F6248
    push 000030000h
    push esi
    call sub_100F6253
    add esp, 24
    call sub_100840DE
    pop edi
    pop esi
    mov eax, ebx
    pop ebx
    ret
FUN_10065ae3 ENDP
END
