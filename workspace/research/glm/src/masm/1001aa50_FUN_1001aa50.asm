.686
.MODEL FLAT, C
EXTRN sub_1001A832:PROC
EXTRN sub_1001A965:PROC
EXTRN sub_1005FB02:PROC
.CODE
FUN_1001aa50 PROC
    push esi
    push edi
    push 1
    push 0101950A8h
    mov esi, eax
    mov edi, ecx
    call sub_1005FB02
    add esp, 8
    test eax, eax
    je L0
    push 1
    mov eax, edi
    call sub_1001A832
    add esp, 4
    test eax, eax
    jne L1
L0:
    pop edi
    xor al, al
    pop esi
    ret
L1:
    mov edx, dword ptr [esp + 12]
    lea ecx, [esi + 24]
    mov dword ptr [esi + 12], eax
    push ecx
    add esi, 18
    push esi
    push edx
    mov esi, eax
    call sub_1001A965
    add esp, 12
    pop edi
    pop esi
    ret
FUN_1001aa50 ENDP
END
