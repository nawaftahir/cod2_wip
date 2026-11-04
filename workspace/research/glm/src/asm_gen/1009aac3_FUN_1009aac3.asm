; FUN_1009aac3 @ 0x1009aac3 — auto-synthesized
.CODE
FUN_1009aac3 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0x10]
    dec eax
    js L0
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    lea edi, [eax + 1]
    mov ecx, esi
    call dword ptr [ebp + 0x14]
    add esi, dword ptr [ebp + 0xc]
    dec edi
    jne L1
    pop edi
    pop esi
    pop ebp
    ret 0x10
FUN_1009aac3 ENDP
END