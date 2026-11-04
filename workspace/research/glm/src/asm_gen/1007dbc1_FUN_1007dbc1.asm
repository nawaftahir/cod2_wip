; FUN_1007dbc1 @ 0x1007dbc1 — auto-synthesized
    sub_1007dab9 PROTO C
.CODE
FUN_1007dbc1 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    xor edi, edi
    cmp dword ptr [esi + 0x18], edi
    jbe L0
    mov eax, dword ptr [esi + 0x14]
    mov ecx, dword ptr [eax + edi*4]
    push 0
    push dword ptr [ebp + 0xc]
    call sub_1007dab9
    test eax, eax
    jl L1
    inc edi
    cmp edi, dword ptr [esi + 0x18]
    jb L2
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 8
FUN_1007dbc1 ENDP
END