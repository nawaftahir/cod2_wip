; __onexit_lk @ 0x10108193 — auto-synthesized
    EXTRN g_1076ada4:DWORD
    EXTRN g_1076ada8:DWORD
    sub_10109606 PROTO C
    sub_1010961b PROTO C
    sub_10109786 PROTO C
.CODE
__onexit_lk PROC
    push esi
    push dword ptr [g_1076ada8]
    call sub_10109786
    pop ecx
    mov ecx, dword ptr [g_1076ada4]
    mov esi, eax
    mov eax, dword ptr [g_1076ada8]
    mov edx, ecx
    sub edx, eax
    add edx, 4
    cmp esi, edx
    jae L0
    mov ecx, 0x800
    cmp esi, ecx
    jae L1
    mov ecx, esi
    add ecx, esi
    push ecx
    push eax
    call sub_10109606
    test eax, eax
    pop ecx
    pop ecx
    jne L2
    add esi, 0x10
    push esi
    push dword ptr [g_1076ada8]
    call sub_1010961b
    test eax, eax
    pop ecx
    pop ecx
    jne L2
    pop esi
    ret
    mov ecx, dword ptr [g_1076ada4]
    sub ecx, dword ptr [g_1076ada8]
    mov dword ptr [g_1076ada8], eax
    sar ecx, 2
    lea ecx, [eax + ecx*4]
    mov dword ptr [g_1076ada4], ecx
    mov dword ptr [ecx], edi
    add dword ptr [g_1076ada4], 4
    mov eax, edi
    pop esi
    ret
__onexit_lk ENDP
END