.686
.MODEL FLAT, C
EXTRN sub_100A7541:PROC
EXTRN sub_100A7567:PROC
EXTRN sub_100B9A0D:PROC
.CODE
FUN_100a748f PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0F4h
    and and dword ptr [ebp - 4], 0
    and and dword ptr [ebp - 20], 0
    push push esi
    push push edi
    mov mov esi, ecx
    mov mov edx, dword ptr [esi + 0100h]
    xor xor eax, eax
    push push 3
    inc inc eax
    pop pop edi
    mov mov dword ptr [ebp - 16], eax
    mov mov dword ptr [ebp - 12], 2
    mov mov dword ptr [ebp - 8], edi
    mov mov ecx, dword ptr [edx]
    and and ecx, 0FFFFFh
    cmp cmp ecx, edi
    jne sub_100A7541
    push push eax
    push push edi
    lea lea eax, [ebp - 20]
    push push eax
    lea lea eax, [ebp - 0F4h]
    push push eax
    lea lea eax, [ebp - 4]
    push push eax
    lea lea eax, [ebp - 84]
    push push eax
    push push 010116A70h
    push push edx
    mov mov ecx, esi
    call sub_100B9A0D
    test test eax, eax
    jne sub_100A7567
    mov mov eax, dword ptr [esi + 0100h]
    mov mov edi, dword ptr [eax + 8]
    lea lea esi, [ebp - 0F4h]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    xor xor eax, eax
    pop pop edi
    pop pop esi
    leave leave
    ret ret
FUN_100a748f ENDP
END
