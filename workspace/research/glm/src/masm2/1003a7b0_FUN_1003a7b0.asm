.686
.MODEL FLAT, C
EXTRN sub_1003871C:PROC
EXTRN sub_1003886E:PROC
EXTRN sub_1003A632:PROC
EXTRN sub_1003A8C6:PROC
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101D49A4:DWORD:DWORD
EXTRN EXTRN g_1072D9B0:DWORD:DWORD
EXTRN EXTRN g_1072D9CC:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9D4:DWORD:DWORD
.CODE
FUN_1003a7b0 PROC
    sub sub esp, 20
    mov mov eax, dword ptr [g_1072D9D4]
    mov mov ecx, dword ptr [g_1072D9D0]
    mov mov dword ptr [esp + 4], eax
    mov mov eax, 055555556h
    imul imul ecx
    mov mov eax, edx
    shr shr eax, 31
    add add eax, edx
    push push esi
    mov mov dword ptr [esp + 12], eax
    mov mov eax, dword ptr [g_1072D9CC]
    push push edi
    xor xor edi, edi
    xor xor edx, edx
    cmp cmp eax, 1
    mov mov eax, dword ptr [g_101CE708]
    mov mov esi, dword ptr [eax + 8]
    mov mov dword ptr [esp + 8], edi
    jne L0
    cmp cmp esi, 2
    setne setne dl
    dec dec edx
    and and edx, -36
    add add edx, 68
    jmp L1
    cmp cmp esi, 2
    setne setne dl
    dec dec edx
    and and edx, -28
    add add edx, 64
    mov mov esi, edx
    mov mov edx, dword ptr [g_1072D9B0]
    push push edx
    mov mov eax, ecx
    call sub_1003871C
    mov mov ecx, dword ptr [g_1072D9D4]
    imul imul ecx, esi
    mov mov dword ptr [esp + 28], eax
    mov mov eax, dword ptr [g_101D49A4]
    add add ecx, dword ptr [eax]
    mov mov edx, dword ptr [eax + 4]
    add add esp, 4
    cmp cmp ecx, edx
    jle sub_1003A8C6
    mov mov dword ptr [eax], edi
    mov mov eax, dword ptr [g_1072D9D4]
    push push 0106D3200h
    push push edi
    mov mov ecx, esi
    call sub_1003886E
    mov mov eax, dword ptr [g_1072D9CC]
    lea lea edx, [esp + 16]
    push push edx
    push push eax
    mov mov dword ptr [esp + 36], edi
    call sub_1003A632
    add add esp, 16
    mov mov dword ptr [g_1072D9D0], edi
    mov mov dword ptr [g_1072D9D4], edi
    pop pop edi
    pop pop esi
    add add esp, 20
    ret ret
FUN_1003a7b0 ENDP
END
