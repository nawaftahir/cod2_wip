.686
.MODEL FLAT, C
EXTRN sub_10063B57:PROC
EXTRN sub_10063DF0:PROC
EXTRN sub_10063E24:PROC
EXTRN sub_1006518D:PROC
EXTRN sub_10065234:PROC
EXTRN sub_1006750E:PROC
EXTRN sub_10082751:PROC
EXTRN sub_100F6208:PROC
EXTRN sub_100F83E5:PROC
EXTRN sub_100F8553:PROC
.CODE
FUN_10065bd0 PROC
    mov edi, edi
    push ebx
    mov ebx, ecx
    mov ecx, dword ptr [ebx + 60]
    test ecx, ecx
    je L0
    push 1
    call sub_10063E24
L0:
    mov ecx, dword ptr [ebx + 104]
    test ecx, ecx
    je L1
    push 1
    call sub_10063DF0
L1:
    mov ecx, dword ptr [ebx + 000000268h]
    test ecx, ecx
    je L2
    push 1
    call sub_10063B57
L2:
    push esi
    push edi
    push 127
    lea esi, [ebx + 108]
    pop edi
L3:
    mov ecx, dword ptr [esi]
    test ecx, ecx
    je L4
    push 1
    call sub_1006518D
L4:
    add esi, 4
    dec edi
    jne L3
    mov eax, dword ptr [ebx + 00000029Ch]
    test eax, eax
    je L5
    push 2
    mov edi, 01010C878h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L5
    push eax
    push 4
    call sub_100F83E5
    pop ecx
    pop ecx
L5:
    mov eax, dword ptr [ebx + 00000029Ch]
    test eax, eax
    pop edi
    pop esi
    je L6
    push eax
    call sub_100F8553
    pop ecx
L6:
    push 0000B001Fh
    push dword ptr [ebx + 0000002A0h]
    call sub_100F6208
    cmp dword ptr [ebx + 0000002A4h], 0
    pop ecx
    pop ecx
    je L7
    mov ecx, ebx
    call sub_10065234
L7:
    lea ecx, [ebx + 24]
    call sub_1006750E
    mov ecx, ebx
    pop ebx
    jmp sub_10082751
FUN_10065bd0 ENDP
END
