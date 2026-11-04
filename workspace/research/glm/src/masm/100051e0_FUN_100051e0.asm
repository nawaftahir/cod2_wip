.686
.MODEL FLAT, C
EXTRN sub_1000519F:PROC
EXTRN sub_100051DF:PROC
.CODE
FUN_100051e0 PROC
    push ecx
    push ebx
    push esi
    mov dword ptr [esp + 8], 6
    xor esi, esi
    lea ecx, [ecx]
L0:
    mov eax, dword ptr [esi + 0101825D8h]
    mov ecx, dword ptr [edi + eax]
    mov eax, dword ptr [esi + 0101825E0h]
    test eax, eax
    je L1
    mov edx, ecx
    not edx
    test eax, edx
    je L3
L1:
    mov eax, dword ptr [esi + 0101825DCh]
    test eax, eax
    je L2
    test ecx, eax
    je L3
L2:
    mov ebx, dword ptr [esi + 0101825E8h]
    lea eax, [esp + 8]
    push eax
    mov eax, dword ptr [esi + 0101825E4h]
    call sub_1000519F
    add esp, 4
L3:
    add esi, 20
    cmp esi, 0000002D0h
    jb L0
    xor esi, esi
    nop
L4:
    mov ecx, dword ptr [esi + 0101828A8h]
    mov eax, dword ptr [edi + ecx]
    cmp eax, dword ptr [esi + 0101828ACh]
    jb L5
    cmp eax, dword ptr [esi + 0101828B0h]
    jbe L6
L5:
    mov ebx, dword ptr [esi + 0101828B8h]
    mov eax, dword ptr [esi + 0101828B4h]
    lea edx, [esp + 8]
    push edx
    call sub_100051DF
    add esp, 4
L6:
    add esi, 20
    cmp esi, 0000000A0h
    jb L4
    mov eax, dword ptr [esp + 8]
    pop esi
    pop ebx
    pop ecx
    ret
FUN_100051e0 ENDP
END
