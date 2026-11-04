.686
.MODEL FLAT, C
EXTRN sub_1001A832:PROC
EXTRN sub_1001A965:PROC
EXTRN sub_1001AAA7:PROC
EXTRN sub_1005FB02:PROC
.CODE
FUN_1001aa50 PROC
    push push esi
    push push edi
    push push 1
    push push 0101950A8h
    mov mov esi, eax
    mov mov edi, ecx
    call sub_1005FB02
    add add esp, 8
    test test eax, eax
    je L0
    push push 1
    mov mov eax, edi
    call sub_1001A832
    add add esp, 4
    test test eax, eax
    jne sub_1001AAA7
    pop pop edi
    xor xor al, al
    pop pop esi
    ret ret
    mov mov edx, dword ptr [esp + 12]
    lea lea ecx, [esi + 24]
    mov mov dword ptr [esi + 12], eax
    push push ecx
    add add esi, 18
    push push esi
    push push edx
    mov mov esi, eax
    call sub_1001A965
    add add esp, 12
    pop pop edi
    pop pop esi
    ret ret
FUN_1001aa50 ENDP
END
