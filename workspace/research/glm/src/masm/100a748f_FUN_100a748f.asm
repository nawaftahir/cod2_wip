.686
.MODEL FLAT, C
EXTRN sub_100B9A0D:PROC
.CODE
FUN_100a748f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0000000F4h
    and dword ptr [ebp - 4], 0
    and dword ptr [ebp - 20], 0
    push esi
    push edi
    mov esi, ecx
    mov edx, dword ptr [esi + 000000100h]
    xor eax, eax
    push 3
    inc eax
    pop edi
    mov dword ptr [ebp - 16], eax
    mov dword ptr [ebp - 12], 2
    mov dword ptr [ebp - 8], edi
    mov ecx, dword ptr [edx]
    and ecx, 0000FFFFFh
    cmp ecx, edi
    jne L0
    push eax
    push edi
    lea eax, [ebp - 20]
    push eax
    lea eax, [ebp - 0000000F4h]
    push eax
    lea eax, [ebp - 4]
    push eax
    lea eax, [ebp - 84]
    push eax
    push 010116A70h
    push edx
    mov ecx, esi
    call sub_100B9A0D
    test eax, eax
    jne L0
    mov eax, dword ptr [esi + 000000100h]
    mov edi, dword ptr [eax + 8]
    lea esi, [ebp - 0000000F4h]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    xor eax, eax
L0:
    pop edi
    pop esi
    leave
    ret
FUN_100a748f ENDP
END
