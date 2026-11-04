; FUN_1007da77 @ 0x1007da77 — auto-synthesized
.CODE
FUN_1007da77 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ecx + 0x18]
    movzx edx, word ptr [eax + 0xa]
    mov eax, dword ptr [ebp + 8]
    cmp eax, edx
    jb L0
    xor eax, eax
    jmp L1
    mov ecx, dword ptr [ecx + 0x38]
    mov eax, dword ptr [ecx + eax*4]
    pop ebp
    ret 4
FUN_1007da77 ENDP
END