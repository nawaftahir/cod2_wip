.686
.MODEL FLAT, C
EXTRN sub_10063B57:PROC
EXTRN sub_10063DF0:PROC
EXTRN sub_10063E24:PROC
EXTRN sub_1006518D:PROC
EXTRN sub_10065234:PROC
EXTRN sub_10065C98:PROC
EXTRN sub_10065CA8:PROC
EXTRN sub_10065CD1:PROC
EXTRN sub_10065D15:PROC
EXTRN sub_1006750E:PROC
EXTRN sub_10082751:PROC
EXTRN sub_100F6208:PROC
EXTRN sub_100F83E5:PROC
EXTRN sub_100F8553:PROC
.CODE
FUN_10065bd0 PROC
    mov mov edi, edi
    push push ebx
    mov mov ebx, ecx
    mov mov ecx, dword ptr [ebx + 60]
    test test ecx, ecx
    je L0
    push push 1
    call sub_10063E24
    mov mov ecx, dword ptr [ebx + 104]
    test test ecx, ecx
    je L1
    push push 1
    call sub_10063DF0
    mov mov ecx, dword ptr [ebx + 0268h]
    test test ecx, ecx
    je L2
    push push 1
    call sub_10063B57
    push push esi
    push push edi
    push push 127
    lea lea esi, [ebx + 108]
    pop pop edi
    mov mov ecx, dword ptr [esi]
    test test ecx, ecx
    je L3
    push push 1
    call sub_1006518D
    add add esi, 4
    dec dec edi
    jne L3
    mov mov eax, dword ptr [ebx + 029Ch]
    test test eax, eax
    je sub_10065C98
    push push 2
    mov mov edi, 01010C878h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_10065CA8
    push push eax
    push push 4
    call sub_100F83E5
    pop pop ecx
    pop pop ecx
    mov mov eax, dword ptr [ebx + 029Ch]
    test test eax, eax
    pop pop edi
    pop pop esi
    je sub_10065CD1
    push push eax
    call sub_100F8553
    pop pop ecx
    push push 0B001Fh
    push push dword ptr [ebx + 02A0h]
    call sub_100F6208
    cmp cmp dword ptr [ebx + 02A4h], 0
    pop pop ecx
    pop pop ecx
    je sub_10065D15
    mov mov ecx, ebx
    call sub_10065234
    lea lea ecx, [ebx + 24]
    call sub_1006750E
    mov mov ecx, ebx
    pop pop ebx
    jmp sub_10082751
FUN_10065bd0 ENDP
END
