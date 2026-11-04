; FUN_10012b90 @ 0x10012b90 — auto-synthesized
    EXTRN fp_101d4ac4:DWORD
    EXTRN g_101ce66c:DWORD
    EXTRN g_101ce688:DWORD
    EXTRN g_101ce6cc:DWORD
    EXTRN g_101ce6dc:DWORD
    EXTRN g_101ce7fc:DWORD
    sub_10012b4e PROTO C
    sub_100f5da0 PROTO C
    sub_100f5dbd PROTO C
.CODE
FUN_10012b90 PROC
    push ecx
    mov eax, dword ptr [g_101ce688]
    push ebx
    push edi
    push eax
    call dword ptr [fp_101d4ac4]
    lea edi, [esi + 0x18]
    push edi
    lea ebx, [esi + 0x14]
    push ebx
    push 0x10193c84
    push eax
    call sub_100f5da0
    mov ecx, dword ptr [g_101ce7fc]
    push ecx
    call dword ptr [fp_101d4ac4]
    lea edx, [esp + 0x20]
    push edx
    push 0x10193c74
    push eax
    call sub_100f5dbd
    mov eax, dword ptr [esp + 0x2c]
    mov ecx, dword ptr [edi]
    mov ebx, dword ptr [ebx]
    push eax
    push ecx
    call sub_10012b4e
    mov edx, dword ptr [g_101ce6cc]
    mov ecx, dword ptr [g_101ce66c]
    mov dword ptr [esi + 4], eax
    mov eax, dword ptr [edx + 8]
    mov dword ptr [esi + 0xc], eax
    mov edx, dword ptr [ecx + 8]
    mov eax, dword ptr [g_101ce6dc]
    add esp, 0x2c
    mov dword ptr [esi + 0x10], edx
    mov byte ptr [esi + 8], 1
    mov dword ptr [esi], 0
    mov ecx, dword ptr [eax + 8]
    pop edi
    mov dword ptr [esi + 0x20], ecx
    pop ebx
    pop ecx
    ret
FUN_10012b90 ENDP
END