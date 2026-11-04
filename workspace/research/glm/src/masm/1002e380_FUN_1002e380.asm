.686
.MODEL FLAT, C
EXTRN sub_1003A8EB:PROC
EXTRN sub_1003DE79:PROC
EXTRN sub_1003E357:PROC
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9E0:DWORD
EXTRN g_1072DAB0:DWORD
EXTRN g_1072DAB4:DWORD
EXTRN g_1072DAB8:DWORD
EXTRN g_1072DABC:DWORD
EXTRN g_1072DAC0:DWORD
EXTRN g_1072DAC4:DWORD
EXTRN g_1072DAC8:DWORD
EXTRN g_1072DACC:DWORD
EXTRN g_1072DAD0:DWORD
EXTRN g_1072DAD4:DWORD
EXTRN g_1072DAD8:DWORD
EXTRN g_1072DADC:DWORD
EXTRN g_1072DAE0:DWORD
EXTRN g_1072DAE4:DWORD
EXTRN g_1072DAE8:DWORD
EXTRN g_1072DAEC:DWORD
EXTRN g_1072DDC8:DWORD
EXTRN g_1072DEBD:DWORD
EXTRN g_10730550:DWORD
.CODE
FUN_1002e380 PROC
    mov eax, dword ptr [g_1072D9D0]
    push ebx
    xor ebx, ebx
    cmp eax, ebx
    push esi
    push edi
    jne L0
    cmp dword ptr [g_1072D9E0], ebx
    je L1
L0:
    call sub_1003A8EB
L1:
    mov edi, dword ptr [g_10730550]
    imul edi, edi, 000000CD0h
    mov byte ptr [g_1072DEBD], bl
    add edi, 01072DEF0h
    mov ecx, 16
    mov esi, 010191368h
    push 03F800000h
    rep movsd dword ptr es:[edi], dword ptr [esi]
    call sub_1003DE79
    mov edi, dword ptr [g_1072DDC8]
    add esp, 4
    call sub_1003E357
    mov eax, dword ptr [g_1072DDC8]
    mov ecx, dword ptr [eax + 8]
    mov edx, dword ptr [eax + 4]
    mov esi, dword ptr [eax]
    mov dword ptr [g_1072DAB0], esi
    mov dword ptr [g_1072DAB4], edx
    mov dword ptr [g_1072DAB8], ecx
    mov dword ptr [g_1072DABC], 03F800000h
    mov ecx, dword ptr [eax + 20]
    mov edx, dword ptr [eax + 16]
    mov esi, dword ptr [eax + 12]
    mov dword ptr [g_1072DAC0], esi
    mov dword ptr [g_1072DACC], ebx
    mov dword ptr [g_1072DAC4], edx
    mov dword ptr [g_1072DAC8], ecx
    mov ecx, dword ptr [eax + 32]
    mov edx, dword ptr [eax + 28]
    mov esi, dword ptr [eax + 24]
    mov dword ptr [g_1072DAD0], esi
    mov dword ptr [g_1072DADC], ebx
    mov dword ptr [g_1072DAD4], edx
    mov dword ptr [g_1072DAD8], ecx
    mov ecx, dword ptr [eax + 44]
    mov edx, dword ptr [eax + 40]
    mov eax, dword ptr [eax + 36]
    pop edi
    pop esi
    mov dword ptr [g_1072DAEC], ebx
    mov dword ptr [g_1072DAE0], eax
    mov dword ptr [g_1072DAE4], edx
    mov dword ptr [g_1072DAE8], ecx
    pop ebx
    ret
FUN_1002e380 ENDP
END
