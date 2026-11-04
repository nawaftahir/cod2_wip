.686
.MODEL FLAT, C
EXTRN sub_10023AF6:PROC
EXTRN sub_10023CFD:PROC
EXTRN sub_10023D38:PROC
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_10678510:DWORD:DWORD
.CODE
FUN_10023b90 PROC
    push push ebp
    call sub_10023AF6
    mov mov ebp, eax
    test test ebp, ebp
    jge L0
    or or eax, -1
    pop pop ebp
    ret ret
    mov mov ecx, dword ptr [g_10678510]
    mov mov eax, dword ptr [g_101D1B9C]
    mov mov edx, ebp
    imul imul edx, edx, 116
    add add edx, ecx
    push push ebx
    mov mov ebx, dword ptr [esp + 12]
    push push esi
    mov mov esi, dword ptr [eax + 0F8h]
    xor xor eax, eax
    push push edi
    lea lea ebx, [ebx + ebx*2]
    shl shl ebx, 5
    add add esi, ebx
    mov mov ecx, 29
    mov mov edi, edx
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov dword ptr [edx], 2
    mov mov ecx, dword ptr [esi + 4]
    mov mov dword ptr [edx + 60], ecx
    mov mov eax, dword ptr [esi + 8]
    mov mov dword ptr [edx + 64], eax
    mov mov ecx, dword ptr [esi + 12]
    mov mov dword ptr [edx + 68], ecx
    mov mov eax, dword ptr [esi + 44]
    mov mov dword ptr [edx + 20], eax
    mov mov ecx, dword ptr [esi + 48]
    mov mov dword ptr [edx + 24], ecx
    mov mov eax, dword ptr [esi + 52]
    mov mov dword ptr [edx + 28], eax
    mov mov ecx, dword ptr [esi + 56]
    mov mov dword ptr [edx + 32], ecx
    mov mov eax, dword ptr [esi + 60]
    mov mov dword ptr [edx + 36], eax
    mov mov ecx, dword ptr [esi + 64]
    mov mov dword ptr [edx + 40], ecx
    mov mov eax, dword ptr [esi + 68]
    mov mov dword ptr [edx + 44], eax
    mov mov ecx, dword ptr [esi + 72]
    mov mov dword ptr [edx + 48], ecx
    mov mov eax, dword ptr [esi + 76]
    mov mov dword ptr [edx + 52], eax
    mov mov ecx, dword ptr [esi + 80]
    mov mov eax, dword ptr [g_101CE708]
    mov mov dword ptr [edx + 56], ecx
    cmp cmp dword ptr [eax + 8], 2
    jne sub_10023CFD
    mov mov ecx, dword ptr [g_101D1B9C]
    mov mov eax, dword ptr [ecx + 012Ch]
    add add eax, ebx
    mov mov dword ptr [edx + 8], eax
    mov mov ecx, dword ptr [g_101D1B9C]
    mov mov eax, dword ptr [ecx + 0130h]
    mov mov ecx, dword ptr [esp + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov dword ptr [edx + 12], eax
    jmp sub_10023D38
    mov mov ecx, dword ptr [esi + 84]
    mov mov dword ptr [edx + 8], ecx
    mov mov eax, dword ptr [esi + 88]
    mov mov dword ptr [edx + 12], eax
    mov mov ecx, dword ptr [esi + 92]
    mov mov dword ptr [edx + 16], ecx
    mov mov edx, ebp
    imul imul edx, edx, 52
    add add edx, 010678AC4h
    xor xor eax, eax
    mov mov ecx, 13
    mov mov edi, edx
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov dword ptr [edx + 12], 2
    mov mov eax, dword ptr [esi + 16]
    mov mov dword ptr [edx + 4], eax
    mov mov ecx, dword ptr [esi + 20]
    mov mov dword ptr [edx + 20], ecx
    mov mov eax, dword ptr [esi + 24]
    mov mov dword ptr [edx + 24], eax
    mov mov ecx, dword ptr [esi + 28]
    mov mov dword ptr [edx + 28], ecx
    mov mov eax, dword ptr [esi + 32]
    mov mov dword ptr [edx + 32], eax
    mov mov ecx, dword ptr [esi + 36]
    pop pop edi
    mov mov dword ptr [edx + 36], ecx
    mov mov eax, dword ptr [esi + 40]
    pop pop esi
    mov mov dword ptr [edx + 40], eax
    pop pop ebx
    mov mov eax, ebp
    pop pop ebp
    ret ret
FUN_10023b90 ENDP
END
