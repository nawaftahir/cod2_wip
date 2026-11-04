; FUN_10030b60 @ 0x10030b60 — auto-synthesized
    EXTRN g_1072d9d0:DWORD
    EXTRN g_1072d9e0:DWORD
    sub_1003a8f4 PROTO C
    sub_1003c07c PROTO C
.CODE
FUN_10030b60 PROC
    push ebp
    mov ebp, esp
    and esp, 0xfffffff8
    mov eax, dword ptr [g_1072d9d0]
    test eax, eax
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    mov edi, dword ptr [esi]
    jne L0
    mov eax, dword ptr [g_1072d9e0]
    test eax, eax
    je L1
    call sub_1003a8f4
    mov eax, dword ptr [edi + 4]
    call sub_1003c07c
    mov eax, dword ptr [esi]
    movzx ecx, word ptr [eax + 2]
    add ecx, eax
    pop edi
    mov dword ptr [esi], ecx
    pop esi
    mov esp, ebp
    pop ebp
    ret
FUN_10030b60 ENDP
END