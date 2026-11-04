; FUN_10081a50 @ 0x10081a50 — auto-synthesized
.CODE
FUN_10081a50 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + 4]
    cmp eax, 1
    push esi
    lea esi, [eax - 1]
    mov dword ptr [ecx + 4], esi
    jne L0
    mov eax, dword ptr [ecx]
    push 1
    call dword ptr [eax + 0x14]
    mov eax, esi
    pop esi
    pop ebp
    ret 4
FUN_10081a50 ENDP
END