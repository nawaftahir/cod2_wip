; __close @ 0x100fcd1b — auto-synthesized
    EXTRN g_1076ac9c:DWORD
    sub_100fb61c PROTO C
    sub_100fc272 PROTO C
    sub_100fc29a PROTO C
    sub_100fc2ae PROTO C
    sub_100fcce9 PROTO C
    sub_100fce24 PROTO C
    sub_1010778e PROTO C
    sub_1010786e PROTO C
.CODE
__close PROC
    push 0xc
    push 0x1017c960
    call sub_100fb61c
    mov ebx, dword ptr [ebp + 8]
    cmp ebx, dword ptr [g_1076ac9c]
    jae L0
    mov eax, ebx
    sar eax, 5
    lea edi, [eax*4 + 0x1076aca0]
    mov eax, ebx
    and eax, 0x1f
    lea esi, [eax + eax*8]
    shl esi, 2
    mov eax, dword ptr [edi]
    test byte ptr [eax + esi + 4], 1
    je L0
    push ebx
    call sub_1010778e
    pop ecx
    and dword ptr [ebp - 4], 0
    mov eax, dword ptr [edi]
    test byte ptr [eax + esi + 4], 1
    je L1
    push ebx
    call sub_100fcce9
    pop ecx
    mov dword ptr [ebp - 0x1c], eax
    jmp L2
    call sub_100fc272
    mov dword ptr [eax], 9
    or dword ptr [ebp - 0x1c], 0xffffffff
    or dword ptr [ebp - 4], 0xffffffff
    call L3
    mov eax, dword ptr [ebp - 0x1c]
    jmp sub_100fce24
    mov ebx, dword ptr [ebp + 8]
    push ebx
    call sub_1010786e
    pop ecx
    ret
    call sub_100fc29a
    mov dword ptr [eax], 9
    call sub_100fc2ae
__close ENDP
END