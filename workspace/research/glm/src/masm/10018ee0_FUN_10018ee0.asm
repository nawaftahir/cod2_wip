.686
.MODEL FLAT, C
EXTRN sub_10018EEF:PROC
EXTRN sub_1005F3FB:PROC
EXTRN sub_1005F6E9:PROC
EXTRN sub_1005FAFE:PROC
EXTRN sub_1005FB78:PROC
EXTRN g_101AAC70:DWORD
.CODE
FUN_10018ee0 PROC
    push 1
    push 0101956F0h
    mov ecx, esi
    call sub_1005FAFE
    add esp, 8
    test eax, eax
    je L2
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov cl, byte ptr [eax + 000000404h]
    test cl, cl
    je L0
    mov ecx, dword ptr [eax + 000000418h]
    mov byte ptr [eax + 000000404h], 0
    mov dword ptr [esi], ecx
    mov edx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], edx
L0:
    push esi
    mov eax, 1
    call sub_1005F6E9
    mov cl, byte ptr [eax]
    add esp, 4
    test cl, cl
    je L1
    cmp cl, 59
    je L1
    push edi
    mov edi, eax
    call sub_10018EEF
    test eax, eax
    mov ecx, dword ptr [esp + 8]
    mov dword ptr [ecx], eax
    pop edi
    je L2
    push 1
    push 010195820h
    mov ecx, esi
    call sub_1005FB78
    add esp, 8
    test eax, eax
    setne al
    ret
L1:
    push 0101956D4h
    call sub_1005F3FB
    add esp, 4
L2:
    xor al, al
    ret
FUN_10018ee0 ENDP
END
