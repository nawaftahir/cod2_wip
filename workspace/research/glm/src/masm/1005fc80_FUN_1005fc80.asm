.686
.MODEL FLAT, C
EXTRN sub_1005F719:PROC
EXTRN g_101AAC70:DWORD
.CODE
FUN_1005fc80 PROC
    sub esp, 20
    mov ecx, dword ptr [g_101AAC70]
    mov eax, ecx
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    movzx edx, byte ptr [eax + 000000404h]
    push ebx
    mov ebx, dword ptr [esi]
    push ebp
    mov ebp, dword ptr [eax + 000000400h]
    mov dword ptr [esp + 16], edx
    mov edx, dword ptr [eax + 000000414h]
    mov eax, dword ptr [eax + 000000418h]
    push edi
    mov dword ptr [esp + 24], edx
    mov dword ptr [esp + 28], eax
    xor edi, edi
L0:
    imul ecx, ecx, 00000045Ch
    add ecx, 0101A66B0h
    mov al, byte ptr [ecx + 000000404h]
    test al, al
    je L2
    mov al, byte ptr [ecx + 000000405h]
    test al, al
    mov byte ptr [ecx + 000000404h], 0
    jne L1
    mov eax, ecx
    jmp L3
L1:
    mov edx, dword ptr [ecx + 000000418h]
    mov dword ptr [esi], edx
    mov eax, dword ptr [ecx + 000000414h]
    mov dword ptr [ecx + 000000400h], eax
L2:
    push esi
    xor eax, eax
    call sub_1005F719
    add esp, 4
L3:
    cmp byte ptr [eax], 0
    je L4
    mov ecx, dword ptr [g_101AAC70]
    inc edi
    jmp L0
L4:
    mov eax, dword ptr [g_101AAC70]
    mov ecx, dword ptr [esp + 20]
    imul eax, eax, 00000045Ch
    mov edx, dword ptr [esp + 24]
    add eax, 0101A66B0h
    test ecx, ecx
    mov dword ptr [eax + 000000400h], ebp
    mov dword ptr [esi], ebx
    setne cl
    mov byte ptr [eax + 000000404h], cl
    mov ecx, dword ptr [esp + 28]
    mov dword ptr [eax + 000000414h], edx
    mov dword ptr [eax + 000000418h], ecx
    mov eax, edi
    pop edi
    pop ebp
    pop ebx
    add esp, 20
    ret
FUN_1005fc80 ENDP
END
