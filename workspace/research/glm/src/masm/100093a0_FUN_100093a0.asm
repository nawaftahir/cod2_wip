.686
.MODEL FLAT, C
EXTRN sub_100055E2:PROC
EXTRN sub_10006402:PROC
EXTRN sub_1002443A:PROC
EXTRN g_101CE6E0:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_101D7E98:DWORD
EXTRN g_101D7E9C:DWORD
EXTRN g_101DA9C8:DWORD
EXTRN g_10678500:DWORD
.CODE
FUN_100093a0 PROC
    push ecx
    push ebx
    mov ebx, eax
    mov eax, dword ptr [g_101D1B9C]
    mov edx, dword ptr [eax + 0000000F0h]
    mov eax, dword ptr [esp + 12]
    push edi
    mov edi, ebx
    shl edi, 5
    add edi, edx
    mov edx, edi
    call sub_10006402
    test al, al
    jne L3
    mov ecx, dword ptr [g_101CE6E0]
    test byte ptr [ecx + 8], 1
    push esi
    je L0
    mov esi, dword ptr [g_101DA9C8]
    push 010191418h
    lea edx, [edi + 12]
    add esi, 000249D18h
    mov eax, edi
    call sub_100055E2
    add esp, 4
L0:
    mov eax, dword ptr [g_10678500]
    mov edx, dword ptr [g_101D7E9C]
    mov dword ptr [edx + ebx*4], eax
    mov ecx, dword ptr [edi + 24]
    mov eax, dword ptr [edi + 28]
    push ebp
    xor ebp, ebp
    test ecx, ecx
    jle L2
    lea ebx, [eax + eax*2]
    lea ecx, [eax*4]
    shl ebx, 2
    mov dword ptr [esp + 16], ecx
L1:
    mov edx, dword ptr [g_101D7E98]
    mov eax, dword ptr [g_10678500]
    mov ecx, dword ptr [esp + 16]
    mov dword ptr [ecx + edx], eax
    mov edx, dword ptr [g_101D1B9C]
    mov eax, dword ptr [edx + 20]
    movzx ecx, word ptr [eax + ebx + 6]
    mov edx, dword ptr [eax + ebx + 8]
    movzx esi, word ptr [eax + ebx + 4]
    add eax, ebx
    mov eax, dword ptr [eax]
    add ecx, 000000800h
    push edx
    call sub_1002443A
    mov edx, dword ptr [esp + 20]
    mov eax, dword ptr [edi + 24]
    add esp, 4
    inc ebp
    add edx, 4
    add ebx, 12
    cmp ebp, eax
    mov dword ptr [esp + 16], edx
    jl L1
L2:
    pop ebp
    pop esi
L3:
    pop edi
    pop ebx
    pop ecx
    ret
FUN_100093a0 ENDP
END
