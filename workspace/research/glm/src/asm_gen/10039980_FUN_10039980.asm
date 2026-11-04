; FUN_10039980 @ 0x10039980 — auto-synthesized
    sub_100389bc PROTO C
    sub_10038c2b PROTO C
    sub_1003d98d PROTO C
.CODE
FUN_10039980 PROC
    sub esp, 0xc
    cmp word ptr [ecx], 3
    push ebx
    mov ebx, dword ptr [ecx + 4]
    push esi
    push edi
    jne L0
    lea edi, [esp + 0x10]
    lea esi, [esp + 0x14]
    call sub_100389bc
    jmp L1
    lea eax, [esp + 0x10]
    lea edx, [esp + 0x14]
    call sub_10038c2b
    mov eax, dword ptr [esp + 0x10]
    mov edi, dword ptr [esp + 0x1c]
    push eax
    mov eax, dword ptr [esp + 0x18]
    call sub_1003d98d
    add esp, 4
    pop edi
    pop esi
    pop ebx
    add esp, 0xc
    ret
FUN_10039980 ENDP
END