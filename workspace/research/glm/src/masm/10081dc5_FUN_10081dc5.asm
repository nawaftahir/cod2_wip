.686
.MODEL FLAT, C
EXTRN sub_10081DB6:PROC
EXTRN sub_100F7886:PROC
.CODE
FUN_10081dc5 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, dword ptr [ebp + 12]
    test ebx, ebx
    jne L0
    mov eax, 08876086Ch
    jmp L7
L0:
    push esi
    push 24
    call sub_100F7886
    test eax, eax
    pop ecx
    je L1
    mov ecx, eax
    call sub_10081DB6
    mov esi, eax
    jmp L2
L1:
    xor esi, esi
L2:
    test esi, esi
    jne L3
    mov eax, 08007000Eh
    jmp L6
L3:
    mov eax, dword ptr [esi]
    push edi
    push dword ptr [ebp + 8]
    mov ecx, esi
    call dword ptr [eax + 0x18]
    mov edi, eax
    test edi, edi
    jge L4
    mov eax, dword ptr [esi]
    push 1
    mov ecx, esi
    call dword ptr [eax + 0x14]
    mov eax, edi
    jmp L5
L4:
    mov dword ptr [ebx], esi
    xor eax, eax
L5:
    pop edi
L6:
    pop esi
L7:
    pop ebx
    pop ebp
    ret 8
FUN_10081dc5 ENDP
END
