.686
.MODEL FLAT, C
EXTRN sub_1001ABB8:PROC
.CODE
FUN_1001acb0 PROC
    push ecx
    push ebx
    mov ebx, eax
    xor ecx, ecx
    xor eax, eax
    jmp L0
    lea ebx, [ebx]
L0:
    mov edx, dword ptr [eax + 010190254h]
    add eax, 8
    cmp eax, 40
    mov byte ptr [esi + edx], cl
    jne L0
    mov byte ptr [esp + 7], cl
    mov byte ptr [esp + 6], cl
    lea esp, [esp]
L1:
    mov al, byte ptr [esp + 6]
    test al, al
    jne L2
    lea eax, [esp + 6]
    push eax
    lea ecx, [esp + 11]
    push ecx
    push esi
    call sub_1001ABB8
    mov al, byte ptr [esp + 19]
    add esp, 12
    test al, al
    je L1
L2:
    mov cl, byte ptr [esp + 6]
    xor eax, eax
    test cl, cl
FUN_1001acb0 ENDP
END
