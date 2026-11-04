; __lock_fhandle @ 0x10107751 — auto-synthesized
    EXTRN fp_1010c030:DWORD
    sub_100fb61c PROTO C
    sub_100fb6de PROTO C
    sub_100fc0b1 PROTO C
    sub_101010fe PROTO C
    sub_10107856 PROTO C
    sub_10107ab1 PROTO C
.CODE
__lock_fhandle PROC
    push 8
    push 0x10182210
    call sub_100fb61c
    mov edi, dword ptr [ebp + 8]
    mov ecx, edi
    sar ecx, 5
    mov eax, edi
    and eax, 0x1f
    lea eax, [eax + eax*8]
    mov ecx, dword ptr [ecx*4 + 0x1076aca0]
    lea esi, [ecx + eax*4]
    xor ebx, ebx
    cmp dword ptr [esi + 8], ebx
    jne L0
    push 0xa
    call sub_100fc0b1
    pop ecx
    mov dword ptr [ebp - 4], ebx
    cmp dword ptr [esi + 8], ebx
    jne L1
    push 0xfa0
    lea eax, [esi + 0xc]
    push eax
    call sub_10107ab1
    pop ecx
    pop ecx
    test eax, eax
    jne L2
    push -1
    lea eax, [ebp - 0x10]
    push eax
    call sub_101010fe
    pop ecx
    pop ecx
    xor eax, eax
    jmp L3
    inc dword ptr [esi + 8]
    or dword ptr [ebp - 4], 0xffffffff
    call sub_10107856
    mov eax, edi
    sar eax, 5
    and edi, 0x1f
    lea ecx, [edi + edi*8]
    mov eax, dword ptr [eax*4 + 0x1076aca0]
    lea eax, [eax + ecx*4 + 0xc]
    push eax
    call dword ptr [fp_1010c030]
    xor eax, eax
    inc eax
    call sub_100fb6de
    ret
__lock_fhandle ENDP
END