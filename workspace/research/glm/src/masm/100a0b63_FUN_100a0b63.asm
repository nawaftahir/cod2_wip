.686
.MODEL FLAT, C
EXTRN sub_100650A4:PROC
EXTRN sub_10082DFC:PROC
EXTRN sub_10099507:PROC
EXTRN sub_100A07F7:PROC
.CODE
FUN_100a0b63 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    lea eax, [ebp + 12]
    push eax
    push dword ptr [ebp + 12]
    mov esi, ecx
    call sub_100A07F7
    test eax, eax
    jge L0
    push 0101152B4h
    push 000000BF2h
    push 0
    push esi
    call sub_10099507
    add esp, 16
    jmp L3
L0:
    push 24
    call sub_100650A4
    xor esi, esi
    cmp eax, esi
    je L1
    push dword ptr [ebp + 12]
    mov ecx, eax
    push esi
    call sub_10082DFC
    jmp L2
L1:
    xor eax, eax
L2:
    cmp eax, esi
    jne L4
L3:
    xor eax, eax
    jmp L7
L4:
    cmp dword ptr [ebp + 8], esi
    lea ecx, [ebp + 8]
    je L6
L5:
    mov edx, dword ptr [ecx]
    cmp dword ptr [edx + 4], 8
    jne L6
    lea ecx, [edx + 16]
    cmp dword ptr [ecx], esi
    jne L5
L6:
    mov edx, dword ptr [ecx]
    mov dword ptr [eax + 16], edx
    mov dword ptr [ecx], eax
    mov eax, dword ptr [ebp + 8]
L7:
    pop esi
    pop ebp
    ret 8
FUN_100a0b63 ENDP
END
