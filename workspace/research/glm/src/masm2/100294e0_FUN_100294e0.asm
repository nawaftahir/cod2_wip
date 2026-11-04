.686
.MODEL FLAT, C
EXTRN sub_10020F4C:PROC
EXTRN sub_10020F8A:PROC
EXTRN sub_10029539:PROC
.CODE
FUN_100294e0 PROC
    push push esi
    mov mov esi, eax
    imul imul eax, eax, 7
    add add eax, edx
    mov mov eax, dword ptr [eax*4 + 010696C48h]
    cmp cmp eax, -1
    je L0
    push push eax
    call sub_10020F8A
    add add esp, 4
    imul imul esi, esi, 28
    cmp cmp dword ptr [esi + 010696C58h], -1
    je sub_10029539
    mov mov eax, 1
    pop pop esi
    ret ret
    mov mov byte ptr [esi + 010696C40h], 1
    call sub_10020F4C
    mov mov dword ptr [esi + 010696C58h], eax
    xor xor eax, eax
    pop pop esi
    ret ret
FUN_100294e0 ENDP
END
