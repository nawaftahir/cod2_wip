; FUN_10086add @ 0x10086add — auto-synthesized
    sub_10086338 PROTO C
    sub_100f787b PROTO C
.CODE
FUN_10086add PROC
    mov edi, edi
    push esi
    mov esi, ecx
    push dword ptr [esi + 0xd0]
    mov dword ptr [esi], 0x10110420
    call sub_100f787b
    pop ecx
    mov ecx, dword ptr [esi + 0xe0]
    test ecx, ecx
    je L0
    mov eax, dword ptr [ecx]
    push 1
    call dword ptr [eax]
    mov ecx, esi
    pop esi
    jmp sub_10086338
FUN_10086add ENDP
END