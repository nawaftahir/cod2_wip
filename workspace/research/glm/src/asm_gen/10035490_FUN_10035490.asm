; FUN_10035490 @ 0x10035490 — auto-synthesized
    EXTRN g_1073055c:DWORD
    sub_1002e8fb PROTO C
    sub_10035441 PROTO C
    sub_10035564 PROTO C
    sub_1003a983 PROTO C
    sub_1003eaaa PROTO C
.CODE
FUN_10035490 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    mov eax, dword ptr [ebp]
    push esi
    push edi
    xor edi, edi
    test eax, eax
    jle sub_10035564
    jmp L0
    lea esp, [esp]
    mov edi, edi
    mov eax, edi
    imul eax, eax, 0x98
    lea esi, [eax + ebp + 4]
    mov eax, edi
    and eax, 1
    test edi, edi
    jne L1
    mov ecx, dword ptr [ebp + 0x984]
    mov dword ptr [g_1073055c], ecx
    jmp L2
    mov edx, 0x264
    sub edx, eax
    mov ecx, dword ptr [ebp + edx*4]
    lea ecx, [ecx + ecx*4]
    mov edx, dword ptr [ecx*4 + 0x101d4820]
    mov dword ptr [g_1073055c], edx
    mov ecx, dword ptr [ebp]
    dec ecx
    cmp edi, ecx
    jne L3
    mov eax, dword ptr [ebp + 0x988]
    jmp L4
    mov eax, dword ptr [ebp + eax*4 + 0x98c]
    call sub_1003eaaa
    mov ecx, esi
    call sub_10035441
    fild dword ptr [esi + 0x10]
    mov edx, dword ptr [esi + 8]
    mov eax, dword ptr [esi + 4]
    push edx
    push eax
    mov eax, dword ptr [esi]
    push 0
    push 0
    sub esp, 8
    fstp dword ptr [esp + 4]
    or ebx, 0xffffffff
    fild dword ptr [esi + 0xc]
    fstp dword ptr [esp]
    push 0
    push 0
    call sub_1002e8fb
    add esp, 0x20
    call sub_1003a983
    mov eax, dword ptr [ebp]
    inc edi
    cmp edi, eax
FUN_10035490 ENDP
END