; FUN_10082bbd @ 0x10082bbd — auto-synthesized
    sub_100827ec PROTO C
    sub_10082826 PROTO C
    sub_10082835 PROTO C
    sub_10082844 PROTO C
.CODE
FUN_10082bbd PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    push edi
    mov esi, ecx
    call sub_100827ec
    test eax, eax
    je L0
    mov eax, dword ptr [esi + 0x10]
    cmp eax, dword ptr [edi + 0x10]
    jne L0
    mov eax, dword ptr [esi + 0x14]
    cmp eax, dword ptr [edi + 0x14]
    jne L0
    push dword ptr [edi + 0x18]
    push dword ptr [esi + 0x18]
    call sub_10082826
    test eax, eax
    je L0
    push dword ptr [edi + 0x1c]
    push dword ptr [esi + 0x1c]
    call sub_10082835
    test eax, eax
    je L0
    push dword ptr [edi + 0x20]
    push dword ptr [esi + 0x20]
    call sub_10082844
    test eax, eax
    je L0
    xor eax, eax
    inc eax
    jmp L1
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 4
FUN_10082bbd ENDP
END