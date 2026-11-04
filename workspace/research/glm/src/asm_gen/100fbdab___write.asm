; __write @ 0x100fbdab — auto-synthesized
    EXTRN g_1076ac9c:DWORD
    sub_100fb61c PROTO C
    sub_100fbc34 PROTO C
    sub_100fbed4 PROTO C
    sub_100fc27a PROTO C
    sub_100fc28e PROTO C
    sub_100fc2aa PROTO C
    sub_100fc2be PROTO C
    sub_1010778e PROTO C
    sub_1010787e PROTO C
.CODE
__write PROC
    push 0xc
    push 0x1017c890
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
    push dword ptr [ebp + 0x10]
    push dword ptr [ebp + 0xc]
    push ebx
    call sub_100fbc34
    add esp, 0xc
    mov dword ptr [ebp - 0x1c], eax
    jmp L2
    call sub_100fc27a
    mov dword ptr [eax], 9
    call sub_100fc28e
    and dword ptr [eax], 0
    or dword ptr [ebp - 0x1c], 0xffffffff
    or dword ptr [ebp - 4], 0xffffffff
    call L3
    mov eax, dword ptr [ebp - 0x1c]
    jmp sub_100fbed4
    mov ebx, dword ptr [ebp + 8]
    push ebx
    call sub_1010787e
    pop ecx
    ret
    call sub_100fc2aa
    mov dword ptr [eax], 9
    call sub_100fc2be
__write ENDP
END