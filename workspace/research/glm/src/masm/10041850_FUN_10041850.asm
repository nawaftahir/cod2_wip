.686
.MODEL FLAT, C
.CODE
FUN_10041850 PROC
    mov ecx, dword ptr [eax + 80]
    test ecx, ecx
    je L0
    mov byte ptr [ecx + 000000080h], dl
L0:
    mov ecx, dword ptr [eax + 84]
    test ecx, ecx
    je L1
    mov byte ptr [ecx + 000000080h], dl
L1:
    mov ecx, dword ptr [eax + 88]
    test ecx, ecx
    je L2
    mov byte ptr [ecx + 000000080h], dl
L2:
    mov ecx, dword ptr [eax + 92]
    test ecx, ecx
    je L3
    mov byte ptr [ecx + 000000080h], dl
L3:
    push esi
    add eax, 112
    mov esi, 4
    lea ecx, [ecx]
L4:
    mov ecx, dword ptr [eax - 16]
    test ecx, ecx
    je L5
    mov byte ptr [ecx + 000000111h], dl
L5:
    mov ecx, dword ptr [eax]
    test ecx, ecx
    je L6
    mov byte ptr [ecx + 000000111h], dl
L6:
    add eax, 4
    dec esi
    jne L4
    pop esi
    ret
FUN_10041850 ENDP
END
