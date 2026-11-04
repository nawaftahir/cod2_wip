; ___security_init_cookie @ 0x1010882c — auto-synthesized
    EXTRN fp_1010c028:DWORD
    EXTRN fp_1010c0b8:DWORD
    EXTRN fp_1010c0bc:DWORD
    EXTRN fp_1010c0f4:DWORD
    EXTRN fp_1010c0fc:DWORD
    EXTRN g_101a50d0:DWORD
.CODE
___security_init_cookie PROC
    push ebp
    mov ebp, esp
    sub esp, 0x10
    mov eax, dword ptr [g_101a50d0]
    test eax, eax
    je L0
    cmp eax, 0xbb40e64e
    jne L1
    push esi
    lea eax, [ebp - 8]
    push eax
    call dword ptr [fp_1010c0f4]
    mov esi, dword ptr [ebp - 4]
    xor esi, dword ptr [ebp - 8]
    call dword ptr [fp_1010c0b8]
    xor esi, eax
    call dword ptr [fp_1010c0fc]
    xor esi, eax
    call dword ptr [fp_1010c0bc]
    xor esi, eax
    lea eax, [ebp - 0x10]
    push eax
    call dword ptr [fp_1010c028]
    mov eax, dword ptr [ebp - 0xc]
    xor eax, dword ptr [ebp - 0x10]
    xor esi, eax
    mov dword ptr [g_101a50d0], esi
    jne L2
    mov dword ptr [g_101a50d0], 0xbb40e64e
    pop esi
    leave
    ret
___security_init_cookie ENDP
END