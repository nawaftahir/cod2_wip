.686
.MODEL FLAT, C
EXTRN sub_1000517A:PROC
EXTRN sub_1002DB3C:PROC
EXTRN sub_1005EB65:PROC
EXTRN g_101D1BF8:DWORD
.CODE
FUN_1002db80 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 16]
    mov eax, dword ptr [ebp + 20]
    test eax, eax
    lea ebx, [ebp + 20]
    push esi
    push edi
    jne L1
    movsx eax, word ptr [ebp + 4]
    push 0
    push ebx
    lea esi, [eax + eax*2]
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push 0
    push 101
    shl esi, 1
    lea edi, [esi + 31]
    push 8
    and edi, 0FFFFFFE0h
    push edi
    push eax
    call dword ptr [ecx + 0x6c]
    test eax, eax
    jl L2
    mov eax, dword ptr [ebx]
    mov edx, dword ptr [eax]
    push 0
    lea ecx, [esp + 28]
    push ecx
    push 0
    push 0
    push eax
    call dword ptr [edx + 0x2c]
    test eax, eax
    jge L0
    mov ebx, dword ptr [ebx]
    mov edx, dword ptr [ebx]
    push ebx
    call dword ptr [edx + 8]
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
L0:
    mov eax, dword ptr [esp + 24]
    test eax, eax
    je L2
    mov ecx, dword ptr [ebp + 8]
    push esi
    push ecx
    push eax
    call sub_1005EB65
    mov edx, dword ptr [esp + 36]
    mov ecx, edi
    sub ecx, esi
    lea edi, [edx + esi]
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov esi, dword ptr [ebx]
    add esp, 12
    call sub_1000517A
L1:
    cmp word ptr [ebp + 6], -1
    je L2
    mov eax, dword ptr [ebp + 12]
    push eax
    mov edi, ebp
    call sub_1002DB3C
    add esp, 4
L2:
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_1002db80 ENDP
END
