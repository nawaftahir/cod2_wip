; FUN_100b5fbf @ 0x100b5fbf — auto-synthesized
.CODE
FUN_100b5fbf PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    push dword ptr [edi + 0x6c]
    mov esi, ecx
    mov eax, dword ptr [esi]
    call dword ptr [eax + 0x54]
    cmp eax, 0xffff
    mov eax, dword ptr [ebp + 0x10]
    jne L0
    and dword ptr [eax], 0
    push dword ptr [edi + 0x6c]
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x58]
    jmp L1
    mov dword ptr [eax], 1
    mov eax, dword ptr [edi + 0xc]
    mov ecx, dword ptr [ebp + 0xc]
    pop edi
    mov dword ptr [ecx], eax
    xor eax, eax
    pop esi
    pop ebp
    ret 0xc
FUN_100b5fbf ENDP
END