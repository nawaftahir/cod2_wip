; FUN_10022b90 @ 0x10022b90 — auto-synthesized
    EXTRN g_101a59cc:DWORD
    EXTRN g_101ce8be:DWORD
    EXTRN g_101ce8c0:DWORD
    EXTRN g_101ce8d2:DWORD
    EXTRN g_101ce8d4:DWORD
    sub_1000cad2 PROTO C
    sub_1000cb02 PROTO C
    sub_1000cb68 PROTO C
    sub_1000cecc PROTO C
    sub_1000d519 PROTO C
    sub_1002296a PROTO C
.CODE
FUN_10022b90 PROC
    push ebx
    push esi
    mov esi, dword ptr [g_101a59cc]
    xor ebx, ebx
    mov dword ptr [g_101ce8d4], esi
    mov byte ptr [g_101ce8d2], 6
    mov byte ptr [g_101ce8be], bl
    mov byte ptr [g_101ce8c0], bl
    call sub_1000cb68
    mov esi, 0x101ce8b4
    push ebx
    mov dword ptr [eax*4 + 0x101cea68], esi
    mov eax, 0x80
    push 1
    push 1
    mov ebx, 0x15
    mov ecx, eax
    mov dword ptr [edi], esi
    call sub_1000cecc
    push 1
    push 0x80
    push 0x80
    push 3
    push esi
    mov eax, ebx
    call sub_1000cad2
    mov esi, dword ptr [edi]
    call sub_1000d519
    push 1
    push 0x80
    mov dword ptr [edi + 4], eax
    mov eax, dword ptr [edi]
    push 0x80
    push 3
    push eax
    mov eax, ebx
    mov dword ptr [edi + 0xc], 0x80
    mov dword ptr [edi + 0x10], 0x80
    call sub_1000cb02
    add esp, 0x34
    call sub_1002296a
    pop esi
    mov dword ptr [edi + 8], eax
    pop ebx
    ret
FUN_10022b90 ENDP
END