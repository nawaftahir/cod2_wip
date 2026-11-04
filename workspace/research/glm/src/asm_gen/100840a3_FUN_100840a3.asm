; FUN_100840a3 @ 0x100840a3 — auto-synthesized
    sub_100f788c PROTO C
    sub_100f7893 PROTO C
.CODE
FUN_100840a3 PROC
    mov edi, edi
    push esi
    mov esi, ecx
    cmp dword ptr [esi + 8], 0
    je L0
    push edi
    mov edi, dword ptr [esi + 8]
    mov eax, dword ptr [edi + 0x10]
    mov dword ptr [esi + 8], eax
    mov eax, dword ptr [edi + 8]
    test al, 8
    jne L1
    test al, 1
    jne L2
    push dword ptr [edi]
    call sub_100f788c
    pop ecx
    push edi
    call sub_100f7893
    cmp dword ptr [esi + 8], 0
    pop ecx
    jne L3
    pop edi
    pop esi
    ret
FUN_100840a3 ENDP
END