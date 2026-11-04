; FUN_1006c52d @ 0x1006c52d — auto-synthesized
    sub_100f7899 PROTO C
.CODE
FUN_1006c52d PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    je L0
    lea edx, [eax - 8]
    mov eax, dword ptr [edx]
    mov dword ptr [ecx + 0x88], eax
    mov eax, dword ptr [edx + 4]
    test eax, eax
    jle L1
    mov dword ptr [ecx + 0x8c], eax
    jmp L0
    neg eax
    push edx
    mov dword ptr [ecx + 0x8c], eax
    call sub_100f7899
    pop ecx
    pop ebp
    ret 4
FUN_1006c52d ENDP
END