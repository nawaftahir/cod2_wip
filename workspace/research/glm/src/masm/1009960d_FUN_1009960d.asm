.686
.MODEL FLAT, C
EXTRN sub_10065092:PROC
EXTRN sub_10082BBF:PROC
EXTRN sub_100995CF:PROC
.CODE
FUN_1009960d PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 16]
    push edi
    xor edi, edi
    cmp eax, edi
    je L0
    cmp dword ptr [ebp + 12], edi
    jne L0
    mov eax, dword ptr [eax + 20]
    mov dword ptr [ebp + 12], eax
L0:
    push 36
    call sub_10065092
    cmp eax, edi
    je L1
    push dword ptr [esi + 16]
    mov ecx, eax
    push edi
    push edi
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call sub_10082BBF
    jmp L2
L1:
    xor eax, eax
L2:
    cmp eax, edi
    jne L3
    push 01010C928h
    push edi
    push edi
    push esi
    call sub_100995CF
    add esp, 16
    mov eax, 08007000Eh
    jmp L4
L3:
    mov dword ptr [esi + 16], eax
    xor eax, eax
L4:
    pop edi
    pop esi
    pop ebp
    ret 8
FUN_1009960d ENDP
END
