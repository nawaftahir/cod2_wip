; FUN_10021660 @ 0x10021660 — auto-synthesized
    EXTRN g_1042e778:DWORD
    sub_1002c12f PROTO C
.CODE
FUN_10021660 PROC
    mov ecx, dword ptr [g_1042e778]
    mov edx, dword ptr [ecx + 0x30000]
    mov eax, 0x30000
    push esi
    mov esi, dword ptr [ecx + 0x30004]
    sub eax, edx
    lea eax, [eax + esi - 0x2000]
    cmp eax, 0x1c
    jge L0
    mov dword ptr [ecx + 0x30008], 0
    pop esi
    ret
    mov esi, dword ptr [esp + 0x18]
    lea eax, [edx + ecx]
    mov dword ptr [ecx + 0x30008], eax
    add edx, 0x1c
    mov dword ptr [ecx + 0x30000], edx
    mov ecx, dword ptr [esp + 0x1c]
    mov edx, dword ptr [esp + 8]
    mov word ptr [eax], 0x14
    mov word ptr [eax + 2], 0x1c
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [esp + 0xc]
    mov dword ptr [eax + 8], edx
    mov edx, dword ptr [esp + 0x10]
    mov dword ptr [eax + 0xc], ecx
    mov ecx, dword ptr [esp + 0x14]
    push edi
    lea edi, [eax + 0x18]
    mov dword ptr [eax + 0x10], edx
    mov dword ptr [eax + 0x14], ecx
    call sub_1002c12f
    pop edi
    pop esi
    ret
FUN_10021660 ENDP
END