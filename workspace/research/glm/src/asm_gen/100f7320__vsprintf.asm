; _vsprintf @ 0x100f7320 — auto-synthesized
    sub_100fa36f PROTO C
    sub_100fa514 PROTO C
.CODE
_vsprintf PROC
    push ebp
    mov ebp, esp
    sub esp, 0x20
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    push dword ptr [ebp + 0x10]
    lea eax, [ebp - 0x20]
    push dword ptr [ebp + 0xc]
    mov dword ptr [ebp - 0x1c], 0x7fffffff
    push eax
    mov dword ptr [ebp - 0x14], 0x42
    mov dword ptr [ebp - 0x18], esi
    mov dword ptr [ebp - 0x20], esi
    call sub_100fa514
    add esp, 0xc
    test esi, esi
    mov edi, eax
    je L0
    dec dword ptr [ebp - 0x1c]
    js L1
    mov eax, dword ptr [ebp - 0x20]
    mov byte ptr [eax], 0
    jmp L0
    lea eax, [ebp - 0x20]
    push eax
    push 0
    call sub_100fa36f
    pop ecx
    pop ecx
    mov eax, edi
    pop edi
    pop esi
    leave
    ret
_vsprintf ENDP
END