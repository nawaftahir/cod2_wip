; FUN_100cbbc6 @ 0x100cbbc6 — auto-synthesized
    sub_10086942 PROTO C
.CODE
FUN_100cbbc6 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push edi
    mov edi, dword ptr [ebp + 0xc]
    mov eax, dword ptr [edi]
    cmp eax, 1
    jbe L0
    push esi
    mov esi, dword ptr [ebp + 8]
    push 0
    push eax
    push esi
    push 0x100cbbac
    call sub_10086942
    xor ecx, ecx
    xor edx, edx
    inc ecx
    inc edx
    cmp dword ptr [edi], ecx
    jbe L1
    mov eax, dword ptr [esi + ecx*4]
    cmp eax, dword ptr [esi + ecx*4 - 4]
    je L2
    mov dword ptr [esi + edx*4], eax
    inc edx
    inc ecx
    cmp ecx, dword ptr [edi]
    jb L3
    mov dword ptr [edi], edx
    pop esi
    pop edi
    pop ebp
    ret 8
FUN_100cbbc6 ENDP
END