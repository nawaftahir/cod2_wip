.686
.MODEL FLAT, C
EXTRN sub_10067C99:PROC
EXTRN sub_10067D60:PROC
EXTRN sub_100994F1:PROC
EXTRN sub_10099501:PROC
EXTRN sub_1009950A:PROC
EXTRN sub_10099514:PROC
EXTRN sub_10099535:PROC
EXTRN sub_1009953C:PROC
EXTRN sub_10099542:PROC
EXTRN sub_10099549:PROC
EXTRN sub_10099560:PROC
EXTRN sub_10099564:PROC
EXTRN sub_10099567:PROC
EXTRN sub_1009957A:PROC
EXTRN sub_1009957B:PROC
EXTRN sub_10099581:PROC
EXTRN sub_10099588:PROC
EXTRN sub_100F61EF:PROC
EXTRN sub_100F793D:PROC
EXTRN sub_100F7979:PROC
.CODE
FUN_100993ad PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0100h
    push push esi
    mov mov esi, dword ptr [ebp + 12]
    push push edi
    push push 13
    mov mov edi, 01010C5E8h
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L0
    lea lea eax, [ebp + 16]
    push push eax
    push push dword ptr [ebp + 12]
    lea lea eax, [ebp - 0100h]
    push push 0100h
    push push eax
    call sub_100F61EF
    mov mov esi, dword ptr [ebp + 8]
    lea lea eax, [ebp - 0100h]
    push push eax
    push push 010193358h
    push push 0
    lea lea eax, [esi + 32]
    push push eax
    mov mov eax, dword ptr [esi + 4]
    add add eax, 24
    push push eax
    mov mov byte ptr [ebp - 1], 0
    call sub_10067C99
    add add esp, 36
    jmp sub_10099535
    mov mov esi, dword ptr [ebp + 8]
    cmp cmp dword ptr [esi + 64], 0
    jne sub_10099542
    lea lea edi, [esi + 32]
    mov mov eax, dword ptr [edi]
    cmp cmp eax, 9
    jg sub_100994F1
    je L3
    test test eax, eax
    je L2
    cmp cmp eax, 1
    je L1
    jle sub_1009950A
    cmp cmp eax, 4
    jle L1
    cmp cmp eax, 8
    jg sub_10099514
    push push 010114700h
    jmp sub_10099535
    push push 0101146ECh
    jmp sub_1009953C
    lea lea eax, [esi + 40]
    push push eax
    jmp sub_10099501
    push push 01010CAE4h
    jmp sub_10099549
    push push dword ptr [esi + 40]
    push push 01010CA78h
    lea lea eax, [ebp - 0100h]
    push push 0100h
    push push eax
    call sub_100F793D
    add add esp, 16
    jmp sub_1009957B
    sub sub eax, 10
    je sub_10099567
    dec dec eax
    dec dec eax
    je sub_10099564
    dec dec eax
    je sub_10099560
    push push 01010CA48h
    jmp sub_1009957A
    push push 01010CA50h
    jmp sub_10099581
    push push 01010CA5Ch
    jmp sub_10099588
    push push 01010CA68h
    lea lea eax, [ebp - 0100h]
    push push 0100h
    push push eax
    call sub_100F7979
    add add esp, 12
    lea lea eax, [ebp - 0100h]
    push push eax
    mov mov eax, dword ptr [esi + 4]
    push push 0101146D0h
    push push 0BB8h
    add add eax, 24
    push push edi
    push push eax
    call sub_10067D60
    add add esp, 20
L2:
    pop pop edi
    mov mov dword ptr [esi + 64], 1
    pop pop esi
    leave leave
    ret ret
FUN_100993ad ENDP
END
