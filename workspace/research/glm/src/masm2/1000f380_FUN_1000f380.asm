.686
.MODEL FLAT, C
EXTRN sub_1000EBEF:PROC
EXTRN sub_1000EDAA:PROC
EXTRN sub_1000EE65:PROC
EXTRN sub_1000F599:PROC
EXTRN sub_1000F5CE:PROC
EXTRN sub_1000F5F7:PROC
EXTRN sub_1000F684:PROC
EXTRN sub_1000F686:PROC
EXTRN sub_1000F6B3:PROC
EXTRN sub_1000F6B5:PROC
EXTRN sub_1000F6C9:PROC
EXTRN sub_1000F6F5:PROC
EXTRN sub_1000F6F9:PROC
EXTRN sub_1000F701:PROC
EXTRN sub_1000F713:PROC
EXTRN sub_1000F791:PROC
EXTRN sub_10010EBC:PROC
EXTRN EXTRN fp_101D49D8:DWORD:DWORD
EXTRN EXTRN fp_101D49F8:DWORD:DWORD
EXTRN EXTRN g_101D496B:DWORD:DWORD
.CODE
FUN_1000f380 PROC
    sub sub esp, 116
    push push ebx
    push push ebp
    push push esi
    mov mov esi, ecx
    movsx movsx ecx, word ptr [esi + 10]
    movsx movsx edx, word ptr [esi + 8]
    push push edi
    mov mov ebx, eax
    movzx movzx eax, byte ptr [esi + 5]
    xor xor edi, edi
    push push edi
    push push eax
    movsx movsx eax, word ptr [esi + 6]
    push push ecx
    mov mov ecx, dword ptr [esp + 094h]
    push push edx
    push push eax
    mov mov eax, dword ptr [esp + 0A4h]
    call sub_1000EE65
    movsx movsx eax, word ptr [esi + 6]
    movsx movsx ecx, word ptr [esi + 8]
    mov mov dl, byte ptr [esi + 5]
    add add esp, 20
    test test dl, 2
    mov mov word ptr [esp + 100], di
    mov mov word ptr [esp + 102], di
    mov mov dword ptr [esp + 108], eax
    mov mov dword ptr [esp + 112], ecx
    mov mov edi, 1
    jne L0
    mov mov edx, edi
    cmp cmp edx, eax
    jl L1
    cmp cmp edx, ecx
    jl L3
    movsx movsx ebp, word ptr [esi + 10]
    cmp cmp edx, ebp
    jge L4
    shl shl edx, 1
    inc inc edi
    jmp L2
    dec dec edi
    cmp cmp ebx, 3
    mov mov dword ptr [esp + 124], edi
    mov mov dword ptr [esp + 116], ebx
    mov mov dword ptr [esp + 120], ebx
    mov mov byte ptr [esp + 080h], 0
    jne L5
    mov mov dword ptr [esp + 120], 4
    mov mov esi, dword ptr [esp + 088h]
    mov mov ebx, dword ptr [esi]
    xor xor edx, edx
    cmp cmp ebx, 5
    setne setne dl
    imul imul eax, ecx
    imul imul eax, dword ptr [esp + 120]
    dec dec edx
    and and edx, 5
    inc inc edx
    mov mov ebp, edx
    mov mov ebx, eax
    xor xor esi, esi
    test test ebp, ebp
    mov mov dword ptr [esp + 16], ebp
    mov mov dword ptr [esp + 24], ebx
    jle L6
    mov mov ecx, ebp
    xor xor eax, eax
    lea lea edi, [esp + 28]
    rep stosd rep stosd dword ptr es:[edi], eax
    push push ebx
    call dword ptr [fp_101D49D8]
    add add esp, 4
    mov mov dword ptr [esp + esi*4 + 52], eax
    inc inc esi
    cmp cmp esi, ebp
    jl L7
    mov mov edi, dword ptr [esp + 124]
    mov mov ecx, dword ptr [esp + 088h]
    movzx movzx edx, byte ptr [ecx + 8]
    cmp cmp edi, edx
    mov mov eax, dword ptr [esp + 08Ch]
    mov mov dword ptr [esp + 104], eax
    jl sub_1000F684
    jmp sub_1000F599
    mov mov edi, dword ptr [esp + 124]
    lea lea ecx, [ecx]
    mov mov eax, dword ptr [esp + 108]
    mov mov ecx, edi
    sar sar eax, cl
    mov mov ecx, 1
    mov mov edx, 1
    sub sub ecx, eax
    jns sub_1000F5CE
    mov mov edx, eax
L5:
    mov mov eax, dword ptr [esp + 112]
    mov mov ecx, edi
    sar sar eax, cl
    mov mov ecx, 1
    sub sub ecx, eax
    js sub_1000F5F7
    mov mov eax, 1
    imul imul eax, edx
    imul imul eax, dword ptr [esp + 120]
    xor xor ebx, ebx
    test test ebp, ebp
    mov mov dword ptr [esp + 20], eax
    jle sub_1000F6B5
    mov mov ecx, dword ptr [esp + 20]
    mov mov eax, dword ptr [esp + ebx*4 + 52]
    mov mov edx, dword ptr [esp + ebx*4 + 28]
    sub sub eax, ecx
    mov mov ecx, dword ptr [esp + 24]
    lea lea ebp, [eax + ecx]
    push push ebp
    push push edx
    lea lea esi, [esp + 108]
    mov mov dword ptr [esp + ebx*4 + 84], edx
    mov mov dword ptr [esp + ebx*4 + 36], ebp
    call sub_10010EBC
    mov mov esi, dword ptr [esp + 090h]
    movzx movzx eax, byte ptr [esi + 8]
    mov mov edi, dword ptr [esp + 084h]
    sub sub edi, eax
    mov mov eax, dword ptr [esi]
    add add esp, 8
    cmp cmp eax, 4
    jne sub_1000F6C9
    mov mov ecx, dword ptr [esp + 090h]
    push push ebp
    push push edi
    push push ecx
    push push esi
    call sub_1000EDAA
    add add esp, 16
    jmp sub_1000F701
    cmp cmp eax, 5
    jne sub_1000F6F5
    test test edi, edi
    je sub_1000F6F9
    mov mov al, byte ptr [g_101D496B]
    test test al, al
    je sub_1000F713
    mov mov edx, dword ptr [esp + 090h]
    push push ebp
    push push edx
    call sub_1000EBEF
    add add esp, 8
    mov mov eax, dword ptr [esp + 16]
    inc inc ebx
    cmp cmp ebx, eax
    jl sub_1000F6B3
    mov mov ebp, eax
    mov mov ecx, dword ptr [esp + 088h]
    mov mov eax, dword ptr [esp + 124]
    movzx movzx edx, byte ptr [ecx + 8]
    dec dec eax
    cmp cmp eax, edx
    mov mov dword ptr [esp + 124], eax
    jge sub_1000F686
    dec dec ebp
    js sub_1000F791
    mov mov eax, dword ptr [esp + ebp*4 + 52]
    push push eax
    call dword ptr [fp_101D49F8]
    add add esp, 4
    dec dec ebp
    jns sub_1000F791
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 116
    ret ret
FUN_1000f380 ENDP
END
