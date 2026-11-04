.686
.MODEL FLAT, C
EXTRN sub_10005827:PROC
EXTRN sub_100243E2:PROC
EXTRN sub_10060D66:PROC
EXTRN g_101CE63C:DWORD
EXTRN g_101CE774:DWORD
EXTRN g_101CE808:DWORD
EXTRN g_101D7E90:DWORD
EXTRN g_101DA9C8:DWORD
EXTRN g_10678510:DWORD
.CODE
FUN_10024680 PROC
    sub esp, 12
    mov edx, dword ptr [esp + 16]
    mov ecx, dword ptr [g_10678510]
    push ebx
    push ebp
    push edi
    mov edi, edx
    imul edi, edi, 52
    mov ebx, edx
    imul ebx, ebx, 116
    add edi, 010678AC4h
    mov eax, dword ptr [edi + 16]
    mov ebp, dword ptr [edi + 48]
    add ebx, ecx
    xor ecx, ecx
    cmp eax, ecx
    mov dword ptr [esp + 12], ecx
    mov dword ptr [esp + 16], ecx
    mov dword ptr [esp + 20], ecx
    jle L5
    push esi
    jmp L0
    lea ecx, [ecx]
L0:
    mov eax, dword ptr [edi + 44]
    mov eax, dword ptr [eax + ecx*4]
    test eax, eax
    je L4
    cmp dword ptr [ebp], 5
    mov ecx, 0000007FFh
    je L1
    mov ecx, edx
L1:
    push ebp
    mov esi, 31
    call sub_100243E2
    mov ecx, dword ptr [g_101CE63C]
    mov al, byte ptr [ecx + 8]
    add esp, 4
    test al, al
    je L2
    mov edx, dword ptr [ebp + 4]
    movsx eax, word ptr [edx + 4]
    add dword ptr [esp + 16], eax
    jmp L3
L2:
    mov ecx, dword ptr [g_101CE808]
    mov al, byte ptr [ecx + 8]
    test al, al
    je L3
    mov edx, dword ptr [ebp + 4]
    movsx eax, word ptr [edx + 2]
    add dword ptr [esp + 20], eax
L3:
    mov ecx, dword ptr [ebp]
    movzx edx, byte ptr [ecx + 0101A5A30h]
    mov ecx, dword ptr [esp + 24]
    add ebp, edx
    mov edx, dword ptr [esp + 32]
L4:
    mov eax, dword ptr [edi + 16]
    inc ecx
    cmp ecx, eax
    mov dword ptr [esp + 24], ecx
    jl L0
    pop esi
L5:
    mov eax, dword ptr [g_101CE63C]
    mov cl, byte ptr [eax + 8]
    test cl, cl
    je L6
    mov ecx, dword ptr [esp + 12]
    jmp L8
L6:
    mov eax, dword ptr [g_101CE808]
    mov cl, byte ptr [eax + 8]
    test cl, cl
    je L7
    mov ecx, dword ptr [esp + 16]
    jmp L8
L7:
    mov eax, dword ptr [g_101CE774]
    mov cl, byte ptr [eax + 8]
    test cl, cl
    je L9
    mov ecx, dword ptr [edi + 16]
L8:
    push ecx
    push 010196CCCh
    call sub_10060D66
    mov edx, dword ptr [g_101DA9C8]
    mov ecx, dword ptr [g_101D7E90]
    push eax
    add edx, 000249D18h
    push 010191448h
    lea eax, [ebx + 60]
    push edx
    call sub_10005827
    add esp, 20
L9:
    pop edi
    pop ebp
    pop ebx
FUN_10024680 ENDP
END
