; FUN_10068bfc @ 0x10068bfc — auto-synthesized
.CODE
FUN_10068bfc PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    xor edx, edx
    push edi
    xor esi, esi
    mov eax, dword ptr [ecx + esi*4]
    jmp L0
    mov edi, dword ptr [ebp + 8]
    mov dword ptr [edi + edx*4], eax
    mov eax, dword ptr [eax + 0x20]
    inc edx
    test eax, eax
    jne L1
    inc esi
    cmp esi, 7
    jb L2
    pop edi
    pop esi
    pop ebp
    ret 4
FUN_10068bfc ENDP
END