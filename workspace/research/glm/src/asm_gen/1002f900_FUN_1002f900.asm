; FUN_1002f900 @ 0x1002f900 — auto-synthesized
    EXTRN g_1072d9d0:DWORD
    EXTRN g_1072d9e0:DWORD
    EXTRN g_1072debc:DWORD
    EXTRN g_1072debd:DWORD
    EXTRN g_10766748:DWORD
    sub_1002e3ba PROTO C
    sub_1002f494 PROTO C
    sub_1003a8fc PROTO C
    sub_1003e9f8 PROTO C
.CODE
FUN_1002f900 PROC
    push ebp
    mov ebp, esp
    and esp, 0xfffffff8
    push ecx
    mov eax, dword ptr [ebp + 8]
    push esi
    mov esi, dword ptr [eax]
    movzx ecx, word ptr [esi + 2]
    add ecx, esi
    mov dword ptr [eax], ecx
    mov eax, dword ptr [g_1072d9d0]
    test eax, eax
    jne L0
    mov eax, dword ptr [g_1072d9e0]
    test eax, eax
    je L1
    call sub_1003a8fc
    mov al, byte ptr [g_1072debd]
    test al, al
    je L2
    call sub_1002e3ba
    mov al, byte ptr [g_1072debc]
    test al, al
    je L3
    call sub_1003e9f8
    mov al, byte ptr [g_10766748]
    test al, al
    jne L4
    mov edx, dword ptr [esi + 4]
    mov eax, dword ptr [esi + 0x10]
    mov ecx, dword ptr [esi + 0xc]
    push edx
    push eax
    mov eax, dword ptr [esi + 8]
    call sub_1002f494
    add esp, 8
    pop esi
    mov esp, ebp
    pop ebp
    ret
FUN_1002f900 ENDP
END