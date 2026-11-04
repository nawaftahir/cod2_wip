.686
.MODEL FLAT, C
EXTRN sub_1001ABB8:PROC
EXTRN sub_1001AD33:PROC
EXTRN sub_1001AD3B:PROC
.CODE
FUN_1001acb0 PROC
    push push ecx
    push push ebx
    mov mov ebx, eax
    xor xor ecx, ecx
    xor xor eax, eax
    jmp L0
    lea lea ebx, [ebx]
    mov mov edx, dword ptr [eax + 010190254h]
    add add eax, 8
    cmp cmp eax, 40
    mov mov byte ptr [esi + edx], cl
    jne L1
    mov mov byte ptr [esp + 7], cl
    mov mov byte ptr [esp + 6], cl
    lea lea esp, [esp]
    mov mov al, byte ptr [esp + 6]
    test test al, al
    jne sub_1001AD3B
    lea lea eax, [esp + 6]
    push push eax
    lea lea ecx, [esp + 11]
    push push ecx
    push push esi
    call sub_1001ABB8
    mov mov al, byte ptr [esp + 19]
    add add esp, 12
    test test al, al
    je sub_1001AD33
    mov mov cl, byte ptr [esp + 6]
    xor xor eax, eax
    test test cl, cl
FUN_1001acb0 ENDP
END
