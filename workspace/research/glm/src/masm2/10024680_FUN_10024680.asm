.686
.MODEL FLAT, C
EXTRN sub_10005827:PROC
EXTRN sub_100243E2:PROC
EXTRN sub_100247A3:PROC
EXTRN sub_1002480E:PROC
EXTRN sub_10024832:PROC
EXTRN sub_10024835:PROC
EXTRN sub_10024847:PROC
EXTRN sub_10024882:PROC
EXTRN sub_10060D66:PROC
EXTRN EXTRN g_101CE63C:DWORD:DWORD
EXTRN EXTRN g_101CE774:DWORD:DWORD
EXTRN EXTRN g_101CE808:DWORD:DWORD
EXTRN EXTRN g_101D7E90:DWORD:DWORD
EXTRN EXTRN g_101DA9C8:DWORD:DWORD
EXTRN EXTRN g_10678510:DWORD:DWORD
.CODE
FUN_10024680 PROC
    sub sub esp, 12
    mov mov edx, dword ptr [esp + 16]
    mov mov ecx, dword ptr [g_10678510]
    push push ebx
    push push ebp
    push push edi
    mov mov edi, edx
    imul imul edi, edi, 52
    mov mov ebx, edx
    imul imul ebx, ebx, 116
    add add edi, 010678AC4h
    mov mov eax, dword ptr [edi + 16]
    mov mov ebp, dword ptr [edi + 48]
    add add ebx, ecx
    xor xor ecx, ecx
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 12], ecx
    mov mov dword ptr [esp + 16], ecx
    mov mov dword ptr [esp + 20], ecx
    jle L3
    push push esi
    jmp L0
    lea lea ecx, [ecx]
    mov mov eax, dword ptr [edi + 44]
    mov mov eax, dword ptr [eax + ecx*4]
    test test eax, eax
    je L4
    cmp cmp dword ptr [ebp], 5
    mov mov ecx, 07FFh
    je L1
    mov mov ecx, edx
    push push ebp
    mov mov esi, 31
    call sub_100243E2
    mov mov ecx, dword ptr [g_101CE63C]
    mov mov al, byte ptr [ecx + 8]
    add add esp, 4
    test test al, al
    je L2
    mov mov edx, dword ptr [ebp + 4]
    movsx movsx eax, word ptr [edx + 4]
    add add dword ptr [esp + 16], eax
L0:
    jmp L6
    mov mov ecx, dword ptr [g_101CE808]
    mov mov al, byte ptr [ecx + 8]
    test test al, al
    je sub_100247A3
    mov mov edx, dword ptr [ebp + 4]
    movsx movsx eax, word ptr [edx + 2]
    add add dword ptr [esp + 20], eax
    mov mov ecx, dword ptr [ebp]
    movzx movzx edx, byte ptr [ecx + 0101A5A30h]
    mov mov ecx, dword ptr [esp + 24]
    add add ebp, edx
    mov mov edx, dword ptr [esp + 32]
    mov mov eax, dword ptr [edi + 16]
    inc inc ecx
    cmp cmp ecx, eax
    mov mov dword ptr [esp + 24], ecx
    jl L5
    pop pop esi
    mov mov eax, dword ptr [g_101CE63C]
    mov mov cl, byte ptr [eax + 8]
    test test cl, cl
    je sub_1002480E
    mov mov ecx, dword ptr [esp + 12]
    jmp sub_10024835
    mov mov eax, dword ptr [g_101CE808]
    mov mov cl, byte ptr [eax + 8]
    test test cl, cl
    je sub_10024832
    mov mov ecx, dword ptr [esp + 16]
    jmp sub_10024847
    mov mov eax, dword ptr [g_101CE774]
    mov mov cl, byte ptr [eax + 8]
    test test cl, cl
    je sub_10024882
    mov mov ecx, dword ptr [edi + 16]
    push push ecx
    push push 010196CCCh
L2:
    call sub_10060D66
    mov mov edx, dword ptr [g_101DA9C8]
    mov mov ecx, dword ptr [g_101D7E90]
    push push eax
    add add edx, 0249D18h
    push push 010191448h
    lea lea eax, [ebx + 60]
    push push edx
    call sub_10005827
    add add esp, 20
    pop pop edi
    pop pop ebp
    pop pop ebx
FUN_10024680 ENDP
END
