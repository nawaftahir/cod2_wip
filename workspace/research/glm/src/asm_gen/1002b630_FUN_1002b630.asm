; FUN_1002b630 @ 0x1002b630 — auto-synthesized
    EXTRN g_101ce708:DWORD
    sub_1002adfa PROTO C
    sub_1002b3f1 PROTO C
.CODE
FUN_1002b630 PROC
    push ebp
    mov ebp, esp
    and esp, 0xfffffff8
    push ecx
    mov ecx, dword ptr [ebp + 0x10]
    push ebx
    mov ebx, dword ptr [g_101ce708]
    add edx, 0x2000
    cmp dword ptr [ebx + 8], 2
    push edx
    jne L0
    mov edx, dword ptr [ebp + 0x14]
    push edx
    push esi
    push edi
    push ecx
    mov ecx, dword ptr [ebp + 0xc]
    push ecx
    mov ecx, dword ptr [ebp + 8]
    call sub_1002b3f1
    add esp, 0x18
    pop ebx
    mov esp, ebp
    pop ebp
    ret
    mov edx, dword ptr [ebp + 8]
    push esi
    push edi
    push ecx
    mov ecx, eax
    mov eax, dword ptr [ebp + 0xc]
    push edx
    call sub_1002adfa
    add esp, 0x14
    pop ebx
    mov esp, ebp
    pop ebp
    ret
FUN_1002b630 ENDP
END