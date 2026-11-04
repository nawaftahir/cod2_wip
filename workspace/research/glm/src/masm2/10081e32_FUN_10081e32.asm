.686
.MODEL FLAT, C
EXTRN sub_10081D2E:PROC
EXTRN sub_10081EA9:PROC
EXTRN sub_10081ED3:PROC
EXTRN sub_10081EDF:PROC
EXTRN sub_10081EF0:PROC
EXTRN sub_100F7886:PROC
.CODE
FUN_10081e32 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ebx
    mov mov ebx, dword ptr [ebp + 12]
    test test ebx, ebx
    jne L0
    mov mov eax, 08876086Ch
    jmp sub_10081EA9
    push push esi
    push push 16
    call sub_100F7886
    pop pop ecx
    mov mov ecx, eax
    test test ecx, ecx
L0:
    je L1
    call sub_10081D2E
    mov mov dword ptr [ecx], 01010FF18h
    mov mov esi, ecx
    jmp L2
    xor xor esi, esi
    test test esi, esi
    jne sub_10081EA9
    mov mov eax, 08007000Eh
    jmp sub_10081ED3
    mov mov eax, dword ptr [esi]
    push push edi
    push push dword ptr [ebp + 8]
    mov mov ecx, esi
    call call dword ptr [eax + 24]
    mov mov edi, eax
    test test edi, edi
    jge sub_10081EDF
    mov mov eax, dword ptr [esi]
    push push 1
    mov mov ecx, esi
    call call dword ptr [eax + 20]
    mov mov eax, edi
    jmp sub_10081EF0
    mov mov dword ptr [ebx], esi
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret 8
FUN_10081e32 ENDP
END
