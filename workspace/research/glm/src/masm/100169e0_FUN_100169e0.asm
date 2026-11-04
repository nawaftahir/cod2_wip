.686
.MODEL FLAT, C
EXTRN sub_100F790A:PROC
.CODE
FUN_100169e0 PROC
    mov cl, byte ptr [edi]
    push esi
    xor esi, esi
    test cl, cl
    mov eax, 119
    je L1
    mov edi, edi
L0:
    movsx ecx, cl
    imul ecx, eax
    add esi, ecx
    mov cl, byte ptr [edi + eax - 118]
    inc eax
    test cl, cl
    jne L0
L1:
    and esi, 0000003FFh
    mov eax, dword ptr [esi*4 + 0101D82D0h]
    test eax, eax
    je L3
L2:
    mov edx, dword ptr [eax]
    push edi
    push edx
    call sub_100F790A
    add esp, 8
    test eax, eax
    je L4
    inc esi
    and esi, 0000003FFh
    mov eax, dword ptr [esi*4 + 0101D82D0h]
    test eax, eax
    jne L2
L3:
    mov dword ptr [ebx], esi
    xor al, al
    pop esi
    ret
L4:
    mov dword ptr [ebx], esi
    mov al, 1
    pop esi
    ret
FUN_100169e0 ENDP
END
