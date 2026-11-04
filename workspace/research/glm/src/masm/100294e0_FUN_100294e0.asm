.686
.MODEL FLAT, C
EXTRN sub_10020F4C:PROC
EXTRN sub_10020F8A:PROC
.CODE
FUN_100294e0 PROC
    push esi
    mov esi, eax
    imul eax, eax, 7
    add eax, edx
    mov eax, dword ptr [eax*4 + 010696C48h]
    cmp eax, -1
    je L0
    push eax
    call sub_10020F8A
    add esp, 4
L0:
    imul esi, esi, 28
    cmp dword ptr [esi + 010696C58h], -1
    je L1
    mov eax, 1
    pop esi
    ret
L1:
    mov byte ptr [esi + 010696C40h], 1
    call sub_10020F4C
    mov dword ptr [esi + 010696C58h], eax
    xor eax, eax
    pop esi
    ret
FUN_100294e0 ENDP
END
