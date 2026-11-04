.686
.MODEL FLAT, C
EXTRN sub_1003A8EB:PROC
EXTRN sub_1003DE79:PROC
EXTRN sub_1003E357:PROC
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9E0:DWORD:DWORD
EXTRN EXTRN g_1072DAB0:DWORD:DWORD
EXTRN EXTRN g_1072DAB4:DWORD:DWORD
EXTRN EXTRN g_1072DAB8:DWORD:DWORD
EXTRN EXTRN g_1072DABC:DWORD:DWORD
EXTRN EXTRN g_1072DAC0:DWORD:DWORD
EXTRN EXTRN g_1072DAC4:DWORD:DWORD
EXTRN EXTRN g_1072DAC8:DWORD:DWORD
EXTRN EXTRN g_1072DACC:DWORD:DWORD
EXTRN EXTRN g_1072DAD0:DWORD:DWORD
EXTRN EXTRN g_1072DAD4:DWORD:DWORD
EXTRN EXTRN g_1072DAD8:DWORD:DWORD
EXTRN EXTRN g_1072DADC:DWORD:DWORD
EXTRN EXTRN g_1072DAE0:DWORD:DWORD
EXTRN EXTRN g_1072DAE4:DWORD:DWORD
EXTRN EXTRN g_1072DAE8:DWORD:DWORD
EXTRN EXTRN g_1072DAEC:DWORD:DWORD
EXTRN EXTRN g_1072DDC8:DWORD:DWORD
EXTRN EXTRN g_1072DEBD:DWORD:DWORD
EXTRN EXTRN g_10730550:DWORD:DWORD
.CODE
FUN_1002e380 PROC
    mov mov eax, dword ptr [g_1072D9D0]
    push push ebx
    xor xor ebx, ebx
    cmp cmp eax, ebx
    push push esi
    push push edi
    jne L0
    cmp cmp dword ptr [g_1072D9E0], ebx
    je L1
    call sub_1003A8EB
    mov mov edi, dword ptr [g_10730550]
    imul imul edi, edi, 0CD0h
    mov mov byte ptr [g_1072DEBD], bl
    add add edi, 01072DEF0h
    mov mov ecx, 16
    mov mov esi, 010191368h
    push push 03F800000h
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    call sub_1003DE79
    mov mov edi, dword ptr [g_1072DDC8]
    add add esp, 4
    call sub_1003E357
    mov mov eax, dword ptr [g_1072DDC8]
    mov mov ecx, dword ptr [eax + 8]
    mov mov edx, dword ptr [eax + 4]
    mov mov esi, dword ptr [eax]
    mov mov dword ptr [g_1072DAB0], esi
    mov mov dword ptr [g_1072DAB4], edx
    mov mov dword ptr [g_1072DAB8], ecx
    mov mov dword ptr [g_1072DABC], 03F800000h
    mov mov ecx, dword ptr [eax + 20]
    mov mov edx, dword ptr [eax + 16]
    mov mov esi, dword ptr [eax + 12]
    mov mov dword ptr [g_1072DAC0], esi
    mov mov dword ptr [g_1072DACC], ebx
    mov mov dword ptr [g_1072DAC4], edx
    mov mov dword ptr [g_1072DAC8], ecx
    mov mov ecx, dword ptr [eax + 32]
    mov mov edx, dword ptr [eax + 28]
    mov mov esi, dword ptr [eax + 24]
    mov mov dword ptr [g_1072DAD0], esi
    mov mov dword ptr [g_1072DADC], ebx
    mov mov dword ptr [g_1072DAD4], edx
    mov mov dword ptr [g_1072DAD8], ecx
    mov mov ecx, dword ptr [eax + 44]
    mov mov edx, dword ptr [eax + 40]
    mov mov eax, dword ptr [eax + 36]
    pop pop edi
    pop pop esi
    mov mov dword ptr [g_1072DAEC], ebx
    mov mov dword ptr [g_1072DAE0], eax
    mov mov dword ptr [g_1072DAE4], edx
    mov mov dword ptr [g_1072DAE8], ecx
    pop pop ebx
    ret ret
FUN_1002e380 ENDP
END
