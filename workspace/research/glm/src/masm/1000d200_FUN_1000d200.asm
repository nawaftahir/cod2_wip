.686
.MODEL FLAT, C
EXTRN sub_1000CC5A:PROC
EXTRN sub_1000D14B:PROC
EXTRN sub_1000FA96:PROC
EXTRN sub_100108C1:PROC
EXTRN sub_100138F4:PROC
.CODE
FUN_1000d200 PROC
    push ebx
    push edi
    mov ebx, esi
    mov edi, eax
    call sub_1000D14B
    test eax, eax
    jne L3
    cmp byte ptr [esi], 36
    jne L4
    mov bl, byte ptr [esp + 12]
    mov edx, edi
    mov eax, esi
    call sub_100108C1
    mov edi, eax
L0:
    test edi, edi
    jne L2
L1:
    push esi
    push 010193544h
    push 1
    call sub_100138F4
    add esp, 12
L2:
    mov eax, edi
L3:
    pop edi
    pop ebx
    ret
L4:
    mov eax, dword ptr [esp + 12]
    push edi
    push eax
    push 3
    push esi
    call sub_1000CC5A
    add esp, 16
    mov edi, eax
    mov ebx, edi
    call sub_1000FA96
    test al, al
    jne L0
    xor edi, edi
    jmp L1
FUN_1000d200 ENDP
END
