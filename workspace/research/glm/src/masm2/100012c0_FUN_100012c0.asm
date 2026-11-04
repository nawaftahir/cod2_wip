.686
.MODEL FLAT, C
EXTRN sub_10001397:PROC
EXTRN sub_100013DD:PROC
EXTRN sub_100013F7:PROC
EXTRN sub_1005DF4E:PROC
EXTRN sub_1005DF7E:PROC
EXTRN sub_1005DFAE:PROC
EXTRN EXTRN g_101CE5FC:DWORD:DWORD
EXTRN EXTRN g_101CE604:DWORD:DWORD
EXTRN EXTRN g_101CE6D8:DWORD:DWORD
EXTRN EXTRN g_101CE728:DWORD:DWORD
EXTRN EXTRN g_101CE73C:DWORD:DWORD
EXTRN EXTRN g_101CE768:DWORD:DWORD
EXTRN EXTRN g_101CE778:DWORD:DWORD
.CODE
FUN_100012c0 PROC
    push push ecx
    mov mov eax, dword ptr [g_101CE73C]
    mov mov ecx, dword ptr [eax + 8]
    mov mov edx, dword ptr [g_101CE5FC]
    mov mov dword ptr [esi + 64], ecx
    mov mov eax, dword ptr [edx + 8]
    mov mov ecx, dword ptr [g_101CE604]
    mov mov dword ptr [esi + 80], eax
    mov mov edx, dword ptr [ecx + 8]
    mov mov dword ptr [esi + 84], edx
    mov mov edx, dword ptr [g_101CE6D8]
    lea lea ecx, [esi + 68]
    xor xor eax, eax
    push push edi
    movzx movzx edi, byte ptr [edx + eax + 8]
    mov mov dword ptr [esp + 4], edi
    inc inc eax
    cmp cmp eax, 3
    fild fild dword ptr [esp + 4]
    fstp fstp dword ptr [ecx + eax*4 - 4]
    jne L0
    mov mov edx, ecx
    call sub_1005DF4E
    fstp fstp st(0)
    mov mov edx, dword ptr [g_101CE778]
    lea lea ecx, [esi + 88]
    xor xor eax, eax
    jmp L1
    lea lea ecx, [ecx]
    movzx movzx edi, byte ptr [edx + eax + 8]
    mov mov dword ptr [esp + 4], edi
    inc inc eax
    cmp cmp eax, 3
    fild fild dword ptr [esp + 4]
    fstp fstp dword ptr [ecx + eax*4 - 4]
    jne sub_10001397
L0:
    mov mov edx, ecx
    call sub_1005DF7E
    fstp fstp st(0)
    mov mov edx, dword ptr [g_101CE768]
    lea lea ecx, [esi + 100]
    xor xor eax, eax
    jmp sub_100013DD
    lea lea ecx, [ecx]
    movzx movzx edi, byte ptr [edx + eax + 8]
    mov mov dword ptr [esp + 4], edi
    inc inc eax
    cmp cmp eax, 3
    fild fild dword ptr [esp + 4]
    fstp fstp dword ptr [ecx + eax*4 - 4]
    jne sub_100013F7
    mov mov edx, ecx
    call sub_1005DFAE
    fstp fstp st(0)
    mov mov eax, dword ptr [g_101CE728]
    mov mov byte ptr [esi + 112], 1
    mov mov eax, dword ptr [eax + 8]
    mov mov ecx, dword ptr [eax]
    mov mov dword ptr [esi + 116], ecx
    mov mov edx, dword ptr [eax + 4]
    mov mov dword ptr [esi + 120], edx
    mov mov eax, dword ptr [eax + 8]
FUN_100012c0 ENDP
END
