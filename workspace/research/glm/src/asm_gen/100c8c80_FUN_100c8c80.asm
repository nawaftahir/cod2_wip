; FUN_100c8c80 @ 0x100c8c80 — auto-synthesized
    sub_100c5146 PROTO C
.CODE
FUN_100c8c80 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0xc
    mov edx, ecx
    mov eax, dword ptr [edx + 0xf4]
    mov dword ptr [ebp - 0xc], eax
    mov eax, dword ptr [edx + 0xf0]
    mov dword ptr [ebp - 8], eax
    mov eax, dword ptr [edx + 0xf8]
    push esi
    mov dword ptr [ebp - 4], eax
    mov eax, dword ptr [ebp + 8]
    xor esi, esi
    mov ecx, dword ptr [ebp + esi*4 - 0xc]
    test ecx, ecx
    je L0
    push dword ptr [ebp + 8]
    push ecx
    mov ecx, edx
    call sub_100c5146
    cmp dword ptr [eax + 0x10], -1
    jne L1
    inc esi
    cmp esi, 3
    jb L2
    pop esi
    leave
    ret 4
FUN_100c8c80 ENDP
END