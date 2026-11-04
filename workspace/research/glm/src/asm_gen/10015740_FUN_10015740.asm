; FUN_10015740 @ 0x10015740 — auto-synthesized
    EXTRN g_101d1b9c:DWORD
    sub_1001562a PROTO C
    sub_1005da5b PROTO C
.CODE
FUN_10015740 PROC
    push ebx
    mov ebx, dword ptr [esp + 0xc]
    push ebp
    mov ebp, dword ptr [esp + 0x20]
    push esi
    mov esi, dword ptr [esp + 0x10]
    cmp dword ptr [esi + 8], -2
    push edi
    mov edi, dword ptr [esp + 0x1c]
    jne L0
    lea ebx, [ebx]
    mov eax, dword ptr [esi + 0xc]
    push eax
    push edi
    push ebx
    call sub_1005da5b
    add esp, 0xc
    cmp eax, 1
    jne L1
    mov esi, dword ptr [esi + 0x10]
    jmp L2
    cmp eax, 2
    je L3
    mov ecx, dword ptr [esp + 0x24]
    mov edx, dword ptr [esp + 0x20]
    mov eax, dword ptr [esi + 0x10]
    push ebp
    push ecx
    push edx
    push edi
    push ebx
    push eax
    call L4
    add esp, 0x18
    mov esi, dword ptr [esi + 0x14]
    cmp dword ptr [esi + 8], -2
    je L5
    mov esi, dword ptr [esi + 8]
    cmp esi, -1
    je L6
    mov ecx, dword ptr [esp + 0x24]
    imul esi, esi, 0x3c
    mov edx, dword ptr [esp + 0x20]
    mov eax, dword ptr [g_101d1b9c]
    push ebp
    push ecx
    push edx
    mov edx, dword ptr [eax + 0x100]
    push edi
    add esi, edx
    push ebx
    push esi
    call sub_1001562a
    add esp, 0x18
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_10015740 ENDP
END