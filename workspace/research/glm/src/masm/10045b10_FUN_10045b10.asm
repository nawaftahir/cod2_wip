.686
.MODEL FLAT, C
EXTRN sub_10044F48:PROC
EXTRN sub_10045403:PROC
EXTRN sub_1004541A:PROC
EXTRN sub_1004542E:PROC
.CODE
FUN_10045b10 PROC
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [esp + 16]
    mov eax, dword ptr [esi + 68]
    mov ebx, dword ptr [esi + 76]
    push edi
    xor ebp, ebp
    xor edi, edi
    test eax, eax
    jle L1
    add ebx, 16
    lea esp, [esp]
L0:
    mov eax, dword ptr [ebx]
    push eax
    call sub_10044F48
    add ebp, eax
    mov eax, dword ptr [esi + 68]
    add esp, 4
    inc edi
    add ebx, 84
    cmp edi, eax
    jl L0
L1:
    mov al, byte ptr [esi + 0000000B9h]
    test al, al
    jne L6
    mov al, byte ptr [esi + 0000000DCh]
    test al, al
    jne L6
    cmp dword ptr [esi + 64], 8
    jne L6
    mov ecx, dword ptr [esi + 68]
    test ecx, ecx
    mov eax, dword ptr [esi + 76]
    mov edx, 1
    mov bl, dl
    jle L5
    add eax, 24
L2:
    cmp dword ptr [eax - 4], edx
    jg L3
    cmp dword ptr [eax], edx
    jle L4
L3:
    xor bl, bl
L4:
    add eax, 84
    dec ecx
    jne L2
L5:
    test ebp, ebp
    je L7
    test bl, bl
    je L7
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 75
    mov edx, dword ptr [esi]
    push 0
    push esi
    xor bl, bl
    call dword ptr [edx + 4]
    add esp, 8
    jmp L7
L6:
    xor bl, bl
L7:
    mov al, byte ptr [esi + 0000000B9h]
    test al, al
    pop edi
    mov ecx, esi
    je L8
    pop esi
    pop ebp
    mov eax, 0000000C9h
    pop ebx
    jmp sub_10045403
L8:
    mov al, byte ptr [esi + 0000000DCh]
    test al, al
    pop esi
    pop ebp
    je L9
    mov eax, 0000000C2h
    pop ebx
    jmp sub_1004541A
L9:
    test bl, bl
    pop ebx
    mov eax, 0000000C0h
    jne L10
    mov eax, 0000000C1h
L10:
    jmp sub_1004542E
FUN_10045b10 ENDP
END
