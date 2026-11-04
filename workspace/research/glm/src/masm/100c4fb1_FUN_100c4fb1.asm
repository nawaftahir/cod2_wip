.686
.MODEL FLAT, C
EXTRN sub_100637DE:PROC
EXTRN sub_1008B1E7:PROC
EXTRN sub_100F7546:PROC
EXTRN sub_100F7620:PROC
EXTRN sub_100F765C:PROC
EXTRN sub_100F768B:PROC
EXTRN sub_100F86E6:PROC
EXTRN sub_100F86FC:PROC
.CODE
FUN_100c4fb1 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 24
    push edi
    xor edi, edi
    and dword ptr [ebp - 4], edi
    and dword ptr [ebp - 8], edi
    cmp dword ptr [ecx + 000000158h], edi
    mov dword ptr [ebp - 12], ecx
    jne L0
    xor eax, eax
    jmp L15
L0:
    mov eax, dword ptr [ebp + 8]
    push ebx
    mov ebx, dword ptr [eax + 48]
    test ebx, ebx
    push esi
    je L8
L1:
    mov eax, dword ptr [ebx + 8]
    cmp dword ptr [eax + 4], 17
    jne L7
    mov ecx, dword ptr [eax + 16]
    test ecx, ecx
    je L2
    mov ecx, dword ptr [ecx + 24]
L2:
    mov eax, dword ptr [eax + 20]
    test eax, eax
    jne L3
    xor esi, esi
    jmp L4
L3:
    mov esi, dword ptr [eax + 24]
L4:
    test ecx, ecx
    je L6
    test esi, esi
    je L7
    lea eax, [ebp - 24]
    push eax
    push 0
    push ecx
    call sub_100637DE
    test eax, eax
    jl L7
    movsx eax, byte ptr [esi]
    push eax
    call sub_100F7620
    cmp eax, 99
    pop ecx
    jne L7
    mov eax, dword ptr [ebp - 12]
    mov eax, dword ptr [eax + 0000000C8h]
    cmp eax, dword ptr [ebp - 20]
    jne L5
    mov edi, esi
    jmp L7
L5:
    xor eax, dword ptr [ebp - 20]
    test eax, 0FFFF0000h
    jne L7
    test word ptr [ebp - 20], 00000FFFFh
    jne L7
    mov dword ptr [ebp - 4], esi
    jmp L7
L6:
    test esi, esi
    je L7
    movsx eax, byte ptr [esi]
    push eax
    call sub_100F765C
    cmp eax, 99
    pop ecx
    jne L7
    mov dword ptr [ebp - 8], esi
L7:
    mov ebx, dword ptr [ebx + 12]
    test ebx, ebx
    jne L1
    test edi, edi
    jne L9
L8:
    mov edi, dword ptr [ebp - 4]
    test edi, edi
    jne L9
    mov edi, dword ptr [ebp - 8]
    test edi, edi
    je L13
L9:
    movsx eax, byte ptr [edi]
    push eax
    call sub_100F768B
    cmp eax, 99
    pop ecx
    jne L13
    lea ebx, [edi + 1]
    movsx eax, byte ptr [ebx]
    push eax
    call sub_100F86E6
    test eax, eax
    pop ecx
    je L13
    add edi, 2
    mov esi, edi
    jmp L11
L10:
    inc esi
L11:
    movsx eax, byte ptr [esi]
    push eax
    call sub_100F86FC
    test eax, eax
    pop ecx
    jne L10
    cmp byte ptr [esi], al
    jne L13
    push ebx
    call sub_100F7546
    cmp eax, 000001FFFh
    pop ecx
    jbe L12
    push eax
    push edi
    push 010110338h
    push 0
    push 0
    push dword ptr [ebp - 12]
    call sub_1008B1E7
    add esp, 24
    mov eax, 080004005h
    jmp L14
L12:
    mov ecx, dword ptr [ebp + 12]
    shl eax, 2
    or eax, 2
    or word ptr [ecx + 10], ax
L13:
    xor eax, eax
L14:
    pop esi
    pop ebx
L15:
    pop edi
    leave
    ret 8
FUN_100c4fb1 ENDP
END
