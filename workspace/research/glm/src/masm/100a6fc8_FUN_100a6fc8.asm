.686
.MODEL FLAT, C
EXTRN sub_1008B20F:PROC
.CODE
FUN_100a6fc8 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 16
    mov eax, dword ptr [ecx + 76]
    cmp eax, dword ptr [ecx + 000000224h]
    push ebx
    push esi
    push edi
    mov dword ptr [ebp - 12], eax
    jae L8
    mov edx, dword ptr [ecx + 000000230h]
    lea eax, [edx + eax*4]
    mov dword ptr [ebp - 8], eax
L0:
    mov eax, dword ptr [ebp - 8]
    mov esi, dword ptr [eax]
    test esi, esi
    je L6
    mov eax, dword ptr [esi]
    test eax, eax
    je L6
    mov edx, dword ptr [esi + 16]
    mov edx, dword ptr [edx]
    mov edi, dword ptr [ecx + 20]
    mov edx, dword ptr [edi + edx*4]
    mov edx, dword ptr [edx + 4]
    cmp edx, dword ptr [ecx + 000000084h]
    jne L1
    and eax, 0FFF00000h
    cmp eax, 010000000h
    je L6
L1:
    and dword ptr [ebp - 4], 0
    cmp dword ptr [esi + 4], 0
    jbe L6
    mov ebx, dword ptr [esi + 8]
L2:
    mov eax, dword ptr [ebx]
    mov eax, dword ptr [edi + eax*4]
    mov edx, dword ptr [eax + 60]
    mov dword ptr [ebp - 16], edx
    jmp L4
L3:
    mov eax, dword ptr [edi + edx*4]
L4:
    mov edx, dword ptr [eax + 56]
    cmp edx, -1
    jne L3
    cmp byte ptr [eax + 108], 3
    jne L5
    mov eax, dword ptr [eax + 60]
    or eax, dword ptr [ebp - 16]
    test ah, 2
    je L7
L5:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    add ebx, 4
    cmp eax, dword ptr [esi + 4]
    jb L2
L6:
    inc dword ptr [ebp - 12]
    mov eax, dword ptr [ebp - 12]
    add dword ptr [ebp - 8], 4
    cmp eax, dword ptr [ecx + 000000224h]
    jb L0
    jmp L8
L7:
    mov eax, dword ptr [ecx + 0000000C8h]
    and eax, 0000000FFh
    push eax
    push 010116B68h
    push 000001263h
    push dword ptr [esi + 60]
    push ecx
    call sub_1008B20F
    add esp, 20
L8:
    pop edi
    pop esi
    xor eax, eax
    pop ebx
    leave
    ret
FUN_100a6fc8 ENDP
END
