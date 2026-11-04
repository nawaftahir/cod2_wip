.686
.MODEL FLAT, C
EXTRN sub_1000EBEF:PROC
EXTRN sub_1000EDAA:PROC
EXTRN sub_1000EE65:PROC
EXTRN sub_10010EBC:PROC
EXTRN fp_101D49D8:DWORD
EXTRN fp_101D49F8:DWORD
EXTRN g_101D496B:DWORD
.CODE
FUN_1000f380 PROC
    sub esp, 116
    push ebx
    push ebp
    push esi
    mov esi, ecx
    movsx ecx, word ptr [esi + 10]
    movsx edx, word ptr [esi + 8]
    push edi
    mov ebx, eax
    movzx eax, byte ptr [esi + 5]
    xor edi, edi
    push edi
    push eax
    movsx eax, word ptr [esi + 6]
    push ecx
    mov ecx, dword ptr [esp + 000000094h]
    push edx
    push eax
    mov eax, dword ptr [esp + 0000000A4h]
    call sub_1000EE65
    movsx eax, word ptr [esi + 6]
    movsx ecx, word ptr [esi + 8]
    mov dl, byte ptr [esi + 5]
    add esp, 20
    test dl, 2
    mov word ptr [esp + 100], di
    mov word ptr [esp + 102], di
    mov dword ptr [esp + 108], eax
    mov dword ptr [esp + 112], ecx
    mov edi, 1
    jne L2
    mov edx, edi
L0:
    cmp edx, eax
    jl L1
    cmp edx, ecx
    jl L1
    movsx ebp, word ptr [esi + 10]
    cmp edx, ebp
    jge L2
L1:
    shl edx, 1
    inc edi
    jmp L0
L2:
    dec edi
    cmp ebx, 3
    mov dword ptr [esp + 124], edi
    mov dword ptr [esp + 116], ebx
    mov dword ptr [esp + 120], ebx
    mov byte ptr [esp + 000000080h], 0
    jne L3
    mov dword ptr [esp + 120], 4
L3:
    mov esi, dword ptr [esp + 000000088h]
    mov ebx, dword ptr [esi]
    xor edx, edx
    cmp ebx, 5
    setne dl
    imul eax, ecx
    imul eax, dword ptr [esp + 120]
    dec edx
    and edx, 5
    inc edx
    mov ebp, edx
    mov ebx, eax
    xor esi, esi
    test ebp, ebp
    mov dword ptr [esp + 16], ebp
    mov dword ptr [esp + 24], ebx
    jle L5
    mov ecx, ebp
    xor eax, eax
    lea edi, [esp + 28]
    rep stosd dword ptr es:[edi], eax
L4:
    push ebx
    call dword ptr [fp_101D49D8]
    add esp, 4
    mov dword ptr [esp + esi*4 + 52], eax
    inc esi
    cmp esi, ebp
    jl L4
    mov edi, dword ptr [esp + 124]
L5:
    mov ecx, dword ptr [esp + 000000088h]
    movzx edx, byte ptr [ecx + 8]
    cmp edi, edx
    mov eax, dword ptr [esp + 00000008Ch]
    mov dword ptr [esp + 104], eax
    jl L15
    jmp L7
L6:
    mov edi, dword ptr [esp + 124]
    lea ecx, [ecx]
L7:
    mov eax, dword ptr [esp + 108]
    mov ecx, edi
    sar eax, cl
    mov ecx, 1
    mov edx, 1
    sub ecx, eax
    jns L8
    mov edx, eax
L8:
    mov eax, dword ptr [esp + 112]
    mov ecx, edi
    sar eax, cl
    mov ecx, 1
    sub ecx, eax
    js L9
    mov eax, 1
L9:
    imul eax, edx
    imul eax, dword ptr [esp + 120]
    xor ebx, ebx
    test ebp, ebp
    mov dword ptr [esp + 20], eax
    jle L14
L10:
    mov ecx, dword ptr [esp + 20]
    mov eax, dword ptr [esp + ebx*4 + 52]
    mov edx, dword ptr [esp + ebx*4 + 28]
    sub eax, ecx
    mov ecx, dword ptr [esp + 24]
    lea ebp, [eax + ecx]
    push ebp
    push edx
    lea esi, [esp + 108]
    mov dword ptr [esp + ebx*4 + 84], edx
    mov dword ptr [esp + ebx*4 + 36], ebp
    call sub_10010EBC
    mov esi, dword ptr [esp + 000000090h]
    movzx eax, byte ptr [esi + 8]
    mov edi, dword ptr [esp + 000000084h]
    sub edi, eax
    mov eax, dword ptr [esi]
    add esp, 8
    cmp eax, 4
    jne L11
    mov ecx, dword ptr [esp + 000000090h]
    push ebp
    push edi
    push ecx
    push esi
    call sub_1000EDAA
    add esp, 16
    jmp L13
L11:
    cmp eax, 5
    jne L12
    test edi, edi
    je L12
    mov al, byte ptr [g_101D496B]
    test al, al
    je L13
L12:
    mov edx, dword ptr [esp + 000000090h]
    push ebp
    push edx
    call sub_1000EBEF
    add esp, 8
L13:
    mov eax, dword ptr [esp + 16]
    inc ebx
    cmp ebx, eax
    jl L10
    mov ebp, eax
L14:
    mov ecx, dword ptr [esp + 000000088h]
    mov eax, dword ptr [esp + 124]
    movzx edx, byte ptr [ecx + 8]
    dec eax
    cmp eax, edx
    mov dword ptr [esp + 124], eax
    jge L6
L15:
    dec ebp
    js L17
L16:
    mov eax, dword ptr [esp + ebp*4 + 52]
    push eax
    call dword ptr [fp_101D49F8]
    add esp, 4
    dec ebp
    jns L16
L17:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 116
    ret
FUN_1000f380 ENDP
END
