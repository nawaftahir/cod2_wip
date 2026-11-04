; FUN_1008269b @ 0x1008269b — auto-synthesized
    EXTRN fp_1010c090:DWORD
.CODE
FUN_1008269b PROC
    mov edi, edi
    push esi
    mov esi, ecx
    jmp L0
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [eax]
    push 0x8000
    push 0
    push eax
    mov dword ptr [esi], ecx
    call dword ptr [fp_1010c090]
    cmp dword ptr [esi], 0
    jne L1
    pop esi
    ret
FUN_1008269b ENDP
END