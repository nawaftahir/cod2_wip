; FUN_100227e1 @ 0x100227e1 — auto-synthesized
    EXTRN g_1010c1e8:DWORD
.CODE
FUN_100227e1 PROC
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [g_1010c1e8]
    push edi
    push 0x4e
    call esi
    push 0x4f
    mov edi, eax
    call esi
    push 0
    mov ebp, eax
    call esi
    push 1
    mov ebx, eax
    call esi
    mov ecx, edi
    sub ecx, ebx
    jns L0
    mov edi, ebx
    mov edx, dword ptr [esp + 0x14]
    mov ecx, ebp
    sub ecx, eax
    mov dword ptr [edx], edi
    js L1
    mov eax, ebp
    mov edx, dword ptr [esp + 0x18]
    pop edi
    pop esi
    pop ebp
    mov dword ptr [edx], eax
    pop ebx
    ret
FUN_100227e1 ENDP
END