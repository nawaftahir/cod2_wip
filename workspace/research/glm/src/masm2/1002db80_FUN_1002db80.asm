.686
.MODEL FLAT, C
EXTRN sub_1000517A:PROC
EXTRN sub_1002DB3C:PROC
EXTRN sub_1002DC37:PROC
EXTRN sub_1002DC6D:PROC
EXTRN sub_1002DC99:PROC
EXTRN sub_1002DCD0:PROC
EXTRN sub_1005EB65:PROC
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
.CODE
FUN_1002db80 PROC
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 16]
    mov mov eax, dword ptr [ebp + 20]
    test test eax, eax
    lea lea ebx, [ebp + 20]
    push push esi
    push push edi
    jne L0
    movsx movsx eax, word ptr [ebp + 4]
    push push 0
    push push ebx
    lea lea esi, [eax + eax*2]
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push 0
    push push 101
    shl shl esi, 1
    lea lea edi, [esi + 31]
    push push 8
    and and edi, -32
    push push edi
    push push eax
    call call dword ptr [ecx + 108]
    test test eax, eax
    jl sub_1002DC6D
    mov mov eax, dword ptr [ebx]
    mov mov edx, dword ptr [eax]
    push push 0
    lea lea ecx, [esp + 28]
    push push ecx
    push push 0
    push push 0
    push push eax
    call call dword ptr [edx + 44]
    test test eax, eax
    jge sub_1002DC37
    mov mov ebx, dword ptr [ebx]
    mov mov edx, dword ptr [ebx]
    push push ebx
    call call dword ptr [edx + 8]
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    ret ret
    mov mov eax, dword ptr [esp + 24]
    test test eax, eax
    je sub_1002DC99
    mov mov ecx, dword ptr [ebp + 8]
    push push esi
    push push ecx
    push push eax
    call sub_1005EB65
    mov mov edx, dword ptr [esp + 36]
    mov mov ecx, edi
    sub sub ecx, esi
    lea lea edi, [edx + esi]
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    mov mov esi, dword ptr [ebx]
    add add esp, 12
    call sub_1000517A
    cmp cmp word ptr [ebp + 6], -1
    je sub_1002DCD0
    mov mov eax, dword ptr [ebp + 12]
    push push eax
    mov mov edi, ebp
    call sub_1002DB3C
    add add esp, 4
    pop pop edi
L0:
    pop pop esi
    pop pop ebp
    pop pop ebx
    ret ret
FUN_1002db80 ENDP
END
