.686
.MODEL FLAT, C
EXTRN sub_100055E2:PROC
EXTRN sub_10006402:PROC
EXTRN sub_1000949F:PROC
EXTRN sub_100094E3:PROC
EXTRN sub_100094F4:PROC
EXTRN sub_1002443A:PROC
EXTRN EXTRN g_101CE6E0:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_101D7E98:DWORD:DWORD
EXTRN EXTRN g_101D7E9C:DWORD:DWORD
EXTRN EXTRN g_101DA9C8:DWORD:DWORD
EXTRN EXTRN g_10678500:DWORD:DWORD
.CODE
FUN_100093a0 PROC
    push push ecx
    push push ebx
    mov mov ebx, eax
    mov mov eax, dword ptr [g_101D1B9C]
    mov mov edx, dword ptr [eax + 0F0h]
    mov mov eax, dword ptr [esp + 12]
    push push edi
    mov mov edi, ebx
    shl shl edi, 5
    add add edi, edx
    mov mov edx, edi
    call sub_10006402
    test test al, al
    jne sub_1000949F
    mov mov ecx, dword ptr [g_101CE6E0]
    test test byte ptr [ecx + 8], 1
    push push esi
    je L0
    mov mov esi, dword ptr [g_101DA9C8]
    push push 010191418h
    lea lea edx, [edi + 12]
    add add esi, 0249D18h
    mov mov eax, edi
    call sub_100055E2
    add add esp, 4
    mov mov eax, dword ptr [g_10678500]
    mov mov edx, dword ptr [g_101D7E9C]
    mov mov dword ptr [edx + ebx*4], eax
    mov mov ecx, dword ptr [edi + 24]
    mov mov eax, dword ptr [edi + 28]
    push push ebp
    xor xor ebp, ebp
    test test ecx, ecx
    jle sub_100094E3
    lea lea ebx, [eax + eax*2]
    lea lea ecx, [eax*4]
    shl shl ebx, 2
    mov mov dword ptr [esp + 16], ecx
    mov mov edx, dword ptr [g_101D7E98]
    mov mov eax, dword ptr [g_10678500]
L0:
    mov mov ecx, dword ptr [esp + 16]
    mov mov dword ptr [ecx + edx], eax
    mov mov edx, dword ptr [g_101D1B9C]
    mov mov eax, dword ptr [edx + 20]
    movzx movzx ecx, word ptr [eax + ebx + 6]
    mov mov edx, dword ptr [eax + ebx + 8]
    movzx movzx esi, word ptr [eax + ebx + 4]
    add add eax, ebx
    mov mov eax, dword ptr [eax]
    add add ecx, 0800h
    push push edx
    call sub_1002443A
    mov mov edx, dword ptr [esp + 20]
    mov mov eax, dword ptr [edi + 24]
    add add esp, 4
    inc inc ebp
    add add edx, 4
    add add ebx, 12
    cmp cmp ebp, eax
    mov mov dword ptr [esp + 16], edx
    jl sub_100094F4
    pop pop ebp
    pop pop esi
    pop pop edi
    pop pop ebx
    pop pop ecx
    ret ret
FUN_100093a0 ENDP
END
