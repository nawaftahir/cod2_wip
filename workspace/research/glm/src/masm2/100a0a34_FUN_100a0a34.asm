.686
.MODEL FLAT, C
EXTRN sub_100650BA:PROC
EXTRN sub_10082E99:PROC
EXTRN sub_10099511:PROC
EXTRN sub_10099558:PROC
EXTRN sub_100A07FF:PROC
EXTRN sub_100A0AC2:PROC
EXTRN sub_100A0AD8:PROC
EXTRN sub_100A0ADE:PROC
EXTRN sub_100A0AEB:PROC
EXTRN sub_100A0B02:PROC
EXTRN sub_100A0B19:PROC
.CODE
FUN_100a0a34 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    test test esi, esi
    push push edi
    mov mov edi, ecx
    je sub_100A0AC2
    lea lea eax, [ebp + 8]
    push push eax
    push push dword ptr [ebp + 12]
    call sub_100A07FF
    test test eax, eax
    jge L0
    push push 010115218h
    push push 0BF4h
    lea lea eax, [edi + 32]
    push push eax
    push push edi
    call sub_10099511
    add add esp, 16
    jmp sub_100A0AEB
    cmp cmp dword ptr [ebp + 8], 1
    jb sub_100A0AD8
    cmp cmp dword ptr [ebp + 8], 4
    ja sub_100A0ADE
    push push 36
    call sub_100650BA
    test test eax, eax
    je sub_100A0B02
    push push 0
    push push dword ptr [ebp + 8]
    mov mov ecx, eax
    push push 1
L0:
    push push dword ptr [esi + 20]
    push push 1
    call sub_10082E99
    jmp sub_100A0B19
    push push 4
    push push 0101151ECh
    push push 0BECh
    lea lea eax, [edi + 32]
    push push eax
    push push edi
    call sub_10099558
    add add esp, 20
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret 8
FUN_100a0a34 ENDP
END
