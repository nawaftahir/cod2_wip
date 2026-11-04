; __commit @ 0x100fbe56 — auto-synthesized
    EXTRN fp_1010c054:DWORD
    EXTRN fp_1010c128:DWORD
    EXTRN g_1076ac9c:DWORD
    sub_100fb61c PROTO C
    sub_100fbfa9 PROTO C
    sub_100fc29a PROTO C
    sub_100fc29b PROTO C
    sub_100fc2c3 PROTO C
    sub_10107765 PROTO C
    sub_10107792 PROTO C
    sub_10107897 PROTO C
.CODE
__commit PROC
    push 0xc
    push 0x1017c8a0
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
    call sub_10107792
    pop ecx
    and dword ptr [ebp - 4], 0
    mov eax, dword ptr [edi]
    test byte ptr [eax + esi + 4], 1
    je L1
    push ebx
    call sub_10107765
    pop ecx
    push eax
    call dword ptr [fp_1010c128]
    test eax, eax
    jne L2
    call dword ptr [fp_1010c054]
    mov dword ptr [ebp - 0x1c], eax
    jmp L3
    and dword ptr [ebp - 0x1c], 0
    cmp dword ptr [ebp - 0x1c], 0
    je L4
    call sub_100fc29a
    mov ecx, dword ptr [ebp - 0x1c]
    mov dword ptr [eax], ecx
    call sub_100fc29b
    mov dword ptr [eax], 9
    or dword ptr [ebp - 0x1c], 0xffffffff
    or dword ptr [ebp - 4], 0xffffffff
    call L5
    mov eax, dword ptr [ebp - 0x1c]
    jmp sub_100fbfa9
    mov ebx, dword ptr [ebp + 8]
    push ebx
    call sub_10107897
    pop ecx
    ret
    call sub_100fc2c3
__commit ENDP
END