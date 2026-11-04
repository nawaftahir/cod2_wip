; FUN_1007e306 @ 0x1007e306 — auto-synthesized
    sub_1007e30c PROTO C
    sub_100f789d PROTO C
    sub_100f78a7 PROTO C
    sub_100f78af PROTO C
.CODE
FUN_1007e306 PROC
    mov edi, edi
    push esi
    mov esi, ecx
    cmp dword ptr [esi + 0x14], 0
    mov dword ptr [esi], 0x1010fd70
    je L0
    push edi
    xor edi, edi
    cmp dword ptr [esi + 0x18], edi
    jbe L1
    mov eax, dword ptr [esi + 0x14]
    mov ecx, dword ptr [eax + edi*4]
    test ecx, ecx
    je L2
    push 1
    call sub_1007e30c
    inc edi
    cmp edi, dword ptr [esi + 0x18]
    jb L3
    push dword ptr [esi + 0x14]
    call sub_100f789d
    pop ecx
    pop edi
    push dword ptr [esi + 8]
    call sub_100f78a7
    push dword ptr [esi + 0x1c]
    call sub_100f78af
    pop ecx
    pop ecx
    pop esi
    ret
FUN_1007e306 ENDP
END