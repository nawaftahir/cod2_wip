.686
.MODEL FLAT, C
EXTRN sub_1000CC5A:PROC
EXTRN sub_1000D14B:PROC
EXTRN sub_1000D25E:PROC
EXTRN sub_1000D27D:PROC
EXTRN sub_1000D285:PROC
EXTRN sub_1000FA96:PROC
EXTRN sub_100108C1:PROC
EXTRN sub_100138F4:PROC
.CODE
FUN_1000d200 PROC
    push push ebx
    push push edi
    mov mov ebx, esi
    mov mov edi, eax
    call sub_1000D14B
    test test eax, eax
    jne L0
    cmp cmp byte ptr [esi], 36
    jne L1
    mov mov bl, byte ptr [esp + 12]
    mov mov edx, edi
    mov mov eax, esi
    call sub_100108C1
    mov mov edi, eax
    test test edi, edi
    jne sub_1000D25E
    push push esi
    push push 010193544h
    push push 1
    call sub_100138F4
    add add esp, 12
    mov mov eax, edi
    pop pop edi
    pop pop ebx
    ret ret
    mov mov eax, dword ptr [esp + 12]
    push push edi
    push push eax
    push push 3
    push push esi
    call sub_1000CC5A
    add add esp, 16
    mov mov edi, eax
    mov mov ebx, edi
    call sub_1000FA96
    test test al, al
    jne sub_1000D27D
    xor xor edi, edi
    jmp sub_1000D285
FUN_1000d200 ENDP
END
