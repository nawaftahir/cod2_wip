.686
.MODEL FLAT, C
EXTRN sub_10068CE7:PROC
EXTRN sub_1006A889:PROC
EXTRN sub_100C4DA1:PROC
EXTRN sub_100C7BCF:PROC
EXTRN sub_100C7BE1:PROC
EXTRN sub_100C7BF3:PROC
EXTRN sub_100C7C01:PROC
EXTRN sub_100C991B:PROC
EXTRN sub_100F600B:PROC
.CODE
FUN_100c9c78 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 32
    push ebx
    mov ebx, ecx
    cmp dword ptr [ebx + 000000158h], 0
    push esi
    jne L4
    mov eax, dword ptr [ebp + 8]
    cmp eax, 000000800h
    jae L0
    and eax, 0000007FFh
    or eax, 0A0000000h
    jmp L3
L0:
    cmp eax, 000001000h
    jae L1
    and eax, 0000007FFh
    or eax, 0B0000800h
    jmp L3
L1:
    cmp eax, 000001800h
    jae L2
    and eax, 0000007FFh
    or eax, 0C0000800h
    jmp L3
L2:
    and eax, 0000007FFh
    or eax, 0D0000800h
L3:
    push 81
    mov ecx, ebx
    mov esi, eax
    call sub_100C991B
    test eax, eax
    jl L6
    mov eax, dword ptr [ebx]
    push 0
    push 0000F0000h
    push esi
    mov ecx, ebx
    call dword ptr [eax + 0x64]
    test eax, eax
    jl L6
    mov esi, dword ptr [ebp + 12]
    push dword ptr [esi]
    mov ecx, ebx
    call sub_100C7BCF
    test eax, eax
    jl L6
    push dword ptr [esi + 4]
    mov ecx, ebx
    call sub_100C7BE1
    test eax, eax
    jl L6
    push dword ptr [esi + 8]
    mov ecx, ebx
    call sub_100C7BF3
    test eax, eax
    jl L6
    push dword ptr [esi + 12]
    mov ecx, ebx
    call sub_100C7C01
    test eax, eax
    jl L6
    mov eax, dword ptr [ebx]
    mov ecx, ebx
    call dword ptr [eax + 0x60]
    test eax, eax
    jl L6
    mov ecx, ebx
    call sub_100C4DA1
    test eax, eax
    jl L6
    xor eax, eax
    jmp L6
L4:
    push edi
    push dword ptr [ebp + 8]
    lea eax, [ebp - 32]
    push 01011A7CCh
    push eax
    call sub_100F600B
    add esp, 12
    xor edi, edi
    inc edi
    push edi
    push dword ptr [ebp + 8]
    lea eax, [ebp - 32]
    lea esi, [ebx + 0000001B4h]
    push eax
    mov ecx, esi
    call sub_1006A889
    test eax, eax
    jl L5
    lea eax, [ebp - 32]
    push eax
    mov ecx, esi
    call sub_10068CE7
    mov esi, dword ptr [ebp + 12]
    mov dword ptr [eax + 12], edi
    lea edi, [eax + 16]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    inc dword ptr [ebx + 0000001F4h]
    xor eax, eax
L5:
    pop edi
L6:
    pop esi
    pop ebx
    leave
    ret 8
FUN_100c9c78 ENDP
END
