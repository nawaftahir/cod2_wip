; FUN_100833d8 @ 0x100833d8 — auto-synthesized
    sub_100827cb PROTO C
.CODE
FUN_100833d8 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    push 0xe
    mov edx, ecx
    call sub_100827cb
    fld qword ptr [ebp + 0xc]
    mov eax, dword ptr [ebp + 8]
    fstp qword ptr [edx + 0x18]
    mov esi, dword ptr [ebp + 0x14]
    push 8
    pop ecx
    mov dword ptr [edx + 0x10], eax
    lea edi, [edx + 0x20]
    mov dword ptr [edx], 0x10110068
    rep movsd dword ptr es:[edi], dword ptr [esi]
    pop edi
    mov eax, edx
    pop esi
    pop ebp
    ret 0x10
FUN_100833d8 ENDP
END