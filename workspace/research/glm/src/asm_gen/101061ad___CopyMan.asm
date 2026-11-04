; __CopyMan @ 0x101061ad — auto-synthesized
.CODE
__CopyMan PROC
    mov eax, dword ptr [esp + 8]
    mov ecx, dword ptr [esp + 4]
    push 3
    pop edx
    sub ecx, eax
    push esi
    mov esi, dword ptr [eax]
    mov dword ptr [ecx + eax], esi
    add eax, 4
    dec edx
    jne L0
    pop esi
    ret
__CopyMan ENDP
END