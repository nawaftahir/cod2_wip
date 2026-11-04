; __ungetc_lk @ 0x10105e3d — auto-synthesized
    sub_10106ae9 PROTO C
.CODE
__ungetc_lk PROC
    push ebx
    mov ebx, dword ptr [esp + 8]
    cmp ebx, -1
    push esi
    je L0
    mov esi, dword ptr [esp + 0x10]
    mov eax, dword ptr [esi + 0xc]
    test al, 1
    jne L1
    test al, al
    jns L0
    test al, 2
    jne L0
    cmp dword ptr [esi + 8], 0
    jne L2
    push esi
    call sub_10106ae9
    pop ecx
    mov eax, dword ptr [esi]
    cmp eax, dword ptr [esi + 8]
    jne L3
    cmp dword ptr [esi + 4], 0
    jne L0
    inc eax
    mov dword ptr [esi], eax
    dec dword ptr [esi]
    test byte ptr [esi + 0xc], 0x40
    mov eax, dword ptr [esi]
    je L4
    cmp byte ptr [eax], bl
    je L5
    inc eax
    mov dword ptr [esi], eax
    or eax, 0xffffffff
    pop esi
    pop ebx
    ret
    mov byte ptr [eax], bl
    mov eax, dword ptr [esi + 0xc]
    inc dword ptr [esi + 4]
    and eax, 0xffffffef
    or eax, 1
    mov dword ptr [esi + 0xc], eax
    mov eax, ebx
    and eax, 0xff
    jmp L6
__ungetc_lk ENDP
END