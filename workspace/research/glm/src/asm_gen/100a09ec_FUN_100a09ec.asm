; FUN_100a09ec @ 0x100a09ec — auto-synthesized
    sub_1006507e PROTO C
    sub_10082897 PROTO C
    sub_100a087a PROTO C
.CODE
FUN_100a09ec PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    push 0x14
    mov edi, ecx
    call sub_1006507e
    test eax, eax
    je L0
    push 0x101151e8
    push 0
    push dword ptr [ebp + 0xc]
    mov ecx, eax
    call sub_10082897
    mov esi, eax
    jmp L1
    xor esi, esi
    test esi, esi
    jne L2
    xor eax, eax
    jmp L3
    push esi
    push dword ptr [ebp + 8]
    mov ecx, edi
    call sub_100a087a
    and dword ptr [esi + 8], 0
    pop edi
    pop esi
    pop ebp
    ret 8
FUN_100a09ec ENDP
END