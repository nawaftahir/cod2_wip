.686
.MODEL FLAT, C
EXTRN sub_1000519F:PROC
EXTRN sub_100051DF:PROC
EXTRN sub_100052CA:PROC
EXTRN sub_100052DD:PROC
EXTRN sub_100052EB:PROC
.CODE
FUN_100051e0 PROC
    push push ecx
    push push ebx
    push push esi
    mov mov dword ptr [esp + 8], 6
    xor xor esi, esi
    lea lea ecx, [ecx]
    mov mov eax, dword ptr [esi + 0101825D8h]
    mov mov ecx, dword ptr [edi + eax]
    mov mov eax, dword ptr [esi + 0101825E0h]
    test test eax, eax
    je L0
    mov mov edx, ecx
    not not edx
    test test eax, edx
    je L3
    mov mov eax, dword ptr [esi + 0101825DCh]
    test test eax, eax
    je L2
    test test ecx, eax
    je L4
    mov mov ebx, dword ptr [esi + 0101825E8h]
    lea lea eax, [esp + 8]
    push push eax
    mov mov eax, dword ptr [esi + 0101825E4h]
    call sub_1000519F
    add add esp, 4
    add add esi, 20
    cmp cmp esi, 02D0h
    jb L1
    xor xor esi, esi
    nop nop
    mov mov ecx, dword ptr [esi + 0101828A8h]
    mov mov eax, dword ptr [edi + ecx]
    cmp cmp eax, dword ptr [esi + 0101828ACh]
    jb sub_100052CA
    cmp cmp eax, dword ptr [esi + 0101828B0h]
    jbe sub_100052EB
    mov mov ebx, dword ptr [esi + 0101828B8h]
    mov mov eax, dword ptr [esi + 0101828B4h]
    lea lea edx, [esp + 8]
    push push edx
    call sub_100051DF
    add add esp, 4
    add add esi, 20
    cmp cmp esi, 0A0h
    jb sub_100052DD
    mov mov eax, dword ptr [esp + 8]
    pop pop esi
    pop pop ebx
    pop pop ecx
    ret ret
FUN_100051e0 ENDP
END
