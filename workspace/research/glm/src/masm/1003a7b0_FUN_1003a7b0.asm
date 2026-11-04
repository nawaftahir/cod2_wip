.686
.MODEL FLAT, C
EXTRN sub_1003871C:PROC
EXTRN sub_1003886E:PROC
EXTRN sub_1003A632:PROC
EXTRN g_101CE708:DWORD
EXTRN g_101D49A4:DWORD
EXTRN g_1072D9B0:DWORD
EXTRN g_1072D9CC:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9D4:DWORD
.CODE
FUN_1003a7b0 PROC
    sub esp, 20
    mov eax, dword ptr [g_1072D9D4]
    mov ecx, dword ptr [g_1072D9D0]
    mov dword ptr [esp + 4], eax
    mov eax, 055555556h
    imul ecx
    mov eax, edx
    shr eax, 31
    add eax, edx
    push esi
    mov dword ptr [esp + 12], eax
    mov eax, dword ptr [g_1072D9CC]
    push edi
    xor edi, edi
    xor edx, edx
    cmp eax, 1
    mov eax, dword ptr [g_101CE708]
    mov esi, dword ptr [eax + 8]
    mov dword ptr [esp + 8], edi
    jne L0
    cmp esi, 2
    setne dl
    dec edx
    and edx, 0FFFFFFDCh
    add edx, 68
    jmp L1
L0:
    cmp esi, 2
    setne dl
    dec edx
    and edx, 0FFFFFFE4h
    add edx, 64
L1:
    mov esi, edx
    mov edx, dword ptr [g_1072D9B0]
    push edx
    mov eax, ecx
    call sub_1003871C
    mov ecx, dword ptr [g_1072D9D4]
    imul ecx, esi
    mov dword ptr [esp + 28], eax
    mov eax, dword ptr [g_101D49A4]
    add ecx, dword ptr [eax]
    mov edx, dword ptr [eax + 4]
    add esp, 4
    cmp ecx, edx
    jle L2
    mov dword ptr [eax], edi
L2:
    mov eax, dword ptr [g_1072D9D4]
    push 0106D3200h
    push edi
    mov ecx, esi
    call sub_1003886E
    mov eax, dword ptr [g_1072D9CC]
    lea edx, [esp + 16]
    push edx
    push eax
    mov dword ptr [esp + 36], edi
    call sub_1003A632
    add esp, 16
    mov dword ptr [g_1072D9D0], edi
    mov dword ptr [g_1072D9D4], edi
    pop edi
    pop esi
    add esp, 20
    ret
FUN_1003a7b0 ENDP
END
