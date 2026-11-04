.686
.MODEL FLAT, C
.CODE
FUN_100b5fbf PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    push dword ptr [edi + 108]
    mov esi, ecx
    mov eax, dword ptr [esi]
    call dword ptr [eax + 0x54]
    cmp eax, 00000FFFFh
    mov eax, dword ptr [ebp + 16]
    jne L0
    and dword ptr [eax], 0
    push dword ptr [edi + 108]
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x58]
    jmp L1
L0:
    mov dword ptr [eax], 1
    mov eax, dword ptr [edi + 12]
L1:
    mov ecx, dword ptr [ebp + 12]
    pop edi
    mov dword ptr [ecx], eax
    xor eax, eax
    pop esi
    pop ebp
    ret 12
FUN_100b5fbf ENDP
END
