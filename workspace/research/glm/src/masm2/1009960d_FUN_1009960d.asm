.686
.MODEL FLAT, C
EXTRN sub_10065092:PROC
EXTRN sub_10082BBF:PROC
EXTRN sub_100995CF:PROC
EXTRN sub_10099671:PROC
EXTRN sub_10099687:PROC
EXTRN sub_100996A8:PROC
EXTRN sub_100996C4:PROC
.CODE
FUN_1009960d PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 16]
    push push edi
    xor xor edi, edi
    cmp cmp eax, edi
    je L0
    cmp cmp dword ptr [ebp + 12], edi
    jne L1
    mov mov eax, dword ptr [eax + 20]
    mov mov dword ptr [ebp + 12], eax
    push push 36
    call sub_10065092
    cmp cmp eax, edi
    je sub_10099671
    push push dword ptr [esi + 16]
    mov mov ecx, eax
    push push edi
    push push edi
L0:
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    call sub_10082BBF
    jmp sub_10099687
    xor xor eax, eax
    cmp cmp eax, edi
    jne sub_100996A8
    push push 01010C928h
    push push edi
    push push edi
    push push esi
    call sub_100995CF
    add add esp, 16
    mov mov eax, 08007000Eh
    jmp sub_100996C4
    mov mov dword ptr [esi + 16], eax
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret 8
FUN_1009960d ENDP
END
