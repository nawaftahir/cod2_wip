.686
.MODEL FLAT, C
EXTRN sub_1005F719:PROC
EXTRN sub_1005FD79:PROC
EXTRN sub_1005FDAB:PROC
EXTRN EXTRN g_101AAC70:DWORD:DWORD
.CODE
FUN_1005fc80 PROC
    sub sub esp, 20
    mov mov ecx, dword ptr [g_101AAC70]
    mov mov eax, ecx
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    movzx movzx edx, byte ptr [eax + 0404h]
    push push ebx
    mov mov ebx, dword ptr [esi]
    push push ebp
    mov mov ebp, dword ptr [eax + 0400h]
    mov mov dword ptr [esp + 16], edx
    mov mov edx, dword ptr [eax + 0414h]
    mov mov eax, dword ptr [eax + 0418h]
    push push edi
    mov mov dword ptr [esp + 24], edx
    mov mov dword ptr [esp + 28], eax
    xor xor edi, edi
    imul imul ecx, ecx, 045Ch
    add add ecx, 0101A66B0h
    mov mov al, byte ptr [ecx + 0404h]
    test test al, al
    je L1
    mov mov al, byte ptr [ecx + 0405h]
    test test al, al
    mov mov byte ptr [ecx + 0404h], 0
    jne L0
    mov mov eax, ecx
    jmp sub_1005FD79
    mov mov edx, dword ptr [ecx + 0418h]
    mov mov dword ptr [esi], edx
    mov mov eax, dword ptr [ecx + 0414h]
    mov mov dword ptr [ecx + 0400h], eax
    push push esi
    xor xor eax, eax
    call sub_1005F719
    add add esp, 4
    cmp cmp byte ptr [eax], 0
    je sub_1005FDAB
    mov mov ecx, dword ptr [g_101AAC70]
    inc inc edi
    jmp L2
    mov mov eax, dword ptr [g_101AAC70]
    mov mov ecx, dword ptr [esp + 20]
    imul imul eax, eax, 045Ch
    mov mov edx, dword ptr [esp + 24]
    add add eax, 0101A66B0h
    test test ecx, ecx
    mov mov dword ptr [eax + 0400h], ebp
    mov mov dword ptr [esi], ebx
    setne setne cl
    mov mov byte ptr [eax + 0404h], cl
    mov mov ecx, dword ptr [esp + 28]
    mov mov dword ptr [eax + 0414h], edx
    mov mov dword ptr [eax + 0418h], ecx
    mov mov eax, edi
    pop pop edi
    pop pop ebp
L1:
    pop pop ebx
    add add esp, 20
    ret ret
FUN_1005fc80 ENDP
END
