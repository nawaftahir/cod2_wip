.686
.MODEL FLAT, C
EXTRN sub_10023AF6:PROC
EXTRN g_101CE708:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_10678510:DWORD
.CODE
FUN_10023b90 PROC
    push ebp
    call sub_10023AF6
    mov ebp, eax
    test ebp, ebp
    jge L0
    or eax, 0FFFFFFFFh
    pop ebp
    ret
L0:
    mov ecx, dword ptr [g_10678510]
    mov eax, dword ptr [g_101D1B9C]
    mov edx, ebp
    imul edx, edx, 116
    add edx, ecx
    push ebx
    mov ebx, dword ptr [esp + 12]
    push esi
    mov esi, dword ptr [eax + 0000000F8h]
    xor eax, eax
    push edi
    lea ebx, [ebx + ebx*2]
    shl ebx, 5
    add esi, ebx
    mov ecx, 29
    mov edi, edx
    rep stosd dword ptr es:[edi], eax
    mov dword ptr [edx], 2
    mov ecx, dword ptr [esi + 4]
    mov dword ptr [edx + 60], ecx
    mov eax, dword ptr [esi + 8]
    mov dword ptr [edx + 64], eax
    mov ecx, dword ptr [esi + 12]
    mov dword ptr [edx + 68], ecx
    mov eax, dword ptr [esi + 44]
    mov dword ptr [edx + 20], eax
    mov ecx, dword ptr [esi + 48]
    mov dword ptr [edx + 24], ecx
    mov eax, dword ptr [esi + 52]
    mov dword ptr [edx + 28], eax
    mov ecx, dword ptr [esi + 56]
    mov dword ptr [edx + 32], ecx
    mov eax, dword ptr [esi + 60]
    mov dword ptr [edx + 36], eax
    mov ecx, dword ptr [esi + 64]
    mov dword ptr [edx + 40], ecx
    mov eax, dword ptr [esi + 68]
    mov dword ptr [edx + 44], eax
    mov ecx, dword ptr [esi + 72]
    mov dword ptr [edx + 48], ecx
    mov eax, dword ptr [esi + 76]
    mov dword ptr [edx + 52], eax
    mov ecx, dword ptr [esi + 80]
    mov eax, dword ptr [g_101CE708]
    mov dword ptr [edx + 56], ecx
    cmp dword ptr [eax + 8], 2
    jne L1
    mov ecx, dword ptr [g_101D1B9C]
    mov eax, dword ptr [ecx + 00000012Ch]
    add eax, ebx
    mov dword ptr [edx + 8], eax
    mov ecx, dword ptr [g_101D1B9C]
    mov eax, dword ptr [ecx + 000000130h]
    mov ecx, dword ptr [esp + 20]
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [edx + 12], eax
    jmp L2
L1:
    mov ecx, dword ptr [esi + 84]
    mov dword ptr [edx + 8], ecx
    mov eax, dword ptr [esi + 88]
    mov dword ptr [edx + 12], eax
    mov ecx, dword ptr [esi + 92]
    mov dword ptr [edx + 16], ecx
L2:
    mov edx, ebp
    imul edx, edx, 52
    add edx, 010678AC4h
    xor eax, eax
    mov ecx, 13
    mov edi, edx
    rep stosd dword ptr es:[edi], eax
    mov dword ptr [edx + 12], 2
    mov eax, dword ptr [esi + 16]
    mov dword ptr [edx + 4], eax
    mov ecx, dword ptr [esi + 20]
    mov dword ptr [edx + 20], ecx
    mov eax, dword ptr [esi + 24]
    mov dword ptr [edx + 24], eax
    mov ecx, dword ptr [esi + 28]
    mov dword ptr [edx + 28], ecx
    mov eax, dword ptr [esi + 32]
    mov dword ptr [edx + 32], eax
    mov ecx, dword ptr [esi + 36]
    pop edi
    mov dword ptr [edx + 36], ecx
    mov eax, dword ptr [esi + 40]
    pop esi
    mov dword ptr [edx + 40], eax
    pop ebx
    mov eax, ebp
    pop ebp
    ret
FUN_10023b90 ENDP
END
