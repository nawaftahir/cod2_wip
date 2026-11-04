; FUN_100091d0 @ 0x100091d0 — auto-synthesized
    EXTRN g_101d1b9c:DWORD
    EXTRN g_10678510:DWORD
    sub_10006420 PROTO C
    sub_1000865a PROTO C
    sub_100088f3 PROTO C
    sub_1002467a PROTO C
.CODE
FUN_100091d0 PROC
    mov edx, dword ptr [g_10678510]
    sub esp, 0x18
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0x24]
    mov ebx, ebp
    mov ecx, ebp
    imul ebx, ebx, 0x34
    imul ecx, ecx, 0x74
    push esi
    push edi
    add ebx, 0x10678ac4
    mov edi, dword ptr [ebx + 4]
    add ecx, edx
    lea esi, [esp + 0x1c]
    lea edx, [esp + 0x10]
    call sub_100088f3
    mov eax, dword ptr [esp + 0x34]
    mov ecx, dword ptr [esp + 0x30]
    call sub_10006420
    test al, al
    jne L0
    mov eax, esi
    push eax
    mov ecx, edx
    mov edx, dword ptr [g_101d1b9c]
    mov eax, dword ptr [edx + 0xc]
    push ecx
    push ebp
    push eax
    call sub_1000865a
    add esp, 0x10
    cmp eax, -1
    jne L0
    push ebp
    mov eax, ebx
    call sub_1002467a
    add esp, 4
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 0x18
    ret
FUN_100091d0 ENDP
END