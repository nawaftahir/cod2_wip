.686
.MODEL FLAT, C
EXTRN sub_10081D89:PROC
EXTRN sub_10081D8F:PROC
EXTRN sub_10081DB3:PROC
EXTRN sub_10081DBF:PROC
EXTRN sub_10081DD0:PROC
EXTRN sub_100F7886:PROC
.CODE
FUN_10081d1e PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ebx
    mov mov ebx, dword ptr [ebp + 12]
    test test ebx, ebx
    jne L1
    mov mov eax, 08876086Ch
    jmp sub_10081D8F
    push push esi
    push push 16
    call sub_100F7886
    test test eax, eax
    pop pop ecx
    je L2
L1:
    mov mov ecx, eax
    call L0
    mov mov esi, eax
    jmp L3
    xor xor esi, esi
    test test esi, esi
    jne sub_10081D89
    mov mov eax, 08007000Eh
    jmp sub_10081DB3
    mov mov eax, dword ptr [esi]
    push push edi
    push push dword ptr [ebp + 8]
    mov mov ecx, esi
    call call dword ptr [eax + 24]
    mov mov edi, eax
    test test edi, edi
    jge sub_10081DBF
    mov mov eax, dword ptr [esi]
    push push 1
    mov mov ecx, esi
    call call dword ptr [eax + 20]
    mov mov eax, edi
    jmp sub_10081DD0
    mov mov dword ptr [ebx], esi
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret 8
FUN_10081d1e ENDP
END
