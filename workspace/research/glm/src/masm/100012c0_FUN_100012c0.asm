.686
.MODEL FLAT, C
EXTRN sub_1005DF4E:PROC
EXTRN sub_1005DF7E:PROC
EXTRN sub_1005DFAE:PROC
EXTRN g_101CE5FC:DWORD
EXTRN g_101CE604:DWORD
EXTRN g_101CE6D8:DWORD
EXTRN g_101CE728:DWORD
EXTRN g_101CE73C:DWORD
EXTRN g_101CE768:DWORD
EXTRN g_101CE778:DWORD
.CODE
FUN_100012c0 PROC
    push ecx
    mov eax, dword ptr [g_101CE73C]
    mov ecx, dword ptr [eax + 8]
    mov edx, dword ptr [g_101CE5FC]
    mov dword ptr [esi + 64], ecx
    mov eax, dword ptr [edx + 8]
    mov ecx, dword ptr [g_101CE604]
    mov dword ptr [esi + 80], eax
    mov edx, dword ptr [ecx + 8]
    mov dword ptr [esi + 84], edx
    mov edx, dword ptr [g_101CE6D8]
    lea ecx, [esi + 68]
    xor eax, eax
    push edi
L0:
    movzx edi, byte ptr [edx + eax + 8]
    mov dword ptr [esp + 4], edi
    inc eax
    cmp eax, 3
    fild dword ptr [esp + 4]
    fstp dword ptr [ecx + eax*4 - 4]
    jne L0
    mov edx, ecx
    call sub_1005DF4E
    fstp st(0)
    mov edx, dword ptr [g_101CE778]
    lea ecx, [esi + 88]
    xor eax, eax
    jmp L1
    lea ecx, [ecx]
L1:
    movzx edi, byte ptr [edx + eax + 8]
    mov dword ptr [esp + 4], edi
    inc eax
    cmp eax, 3
    fild dword ptr [esp + 4]
    fstp dword ptr [ecx + eax*4 - 4]
    jne L1
    mov edx, ecx
    call sub_1005DF7E
    fstp st(0)
    mov edx, dword ptr [g_101CE768]
    lea ecx, [esi + 100]
    xor eax, eax
    jmp L2
    lea ecx, [ecx]
L2:
    movzx edi, byte ptr [edx + eax + 8]
    mov dword ptr [esp + 4], edi
    inc eax
    cmp eax, 3
    fild dword ptr [esp + 4]
    fstp dword ptr [ecx + eax*4 - 4]
    jne L2
    mov edx, ecx
    call sub_1005DFAE
    fstp st(0)
    mov eax, dword ptr [g_101CE728]
    mov byte ptr [esi + 112], 1
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [eax]
    mov dword ptr [esi + 116], ecx
    mov edx, dword ptr [eax + 4]
    mov dword ptr [esi + 120], edx
    mov eax, dword ptr [eax + 8]
FUN_100012c0 ENDP
END
