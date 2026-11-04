.686
.MODEL FLAT, C
EXTRN sub_100995D6:PROC
.CODE
FUN_10099b4f PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    xor edi, edi
    test esi, esi
    mov ebx, ecx
    je L3
L1:
    cmp dword ptr [esi + 4], 1
    jne L2
    push dword ptr [esi + 8]
    mov ecx, ebx
    call L0
    mov esi, dword ptr [esi + 12]
    add edi, eax
    test esi, esi
    jne L1
L2:
    test esi, esi
    jne L4
L3:
    mov eax, edi
    jmp L11
L4:
    mov eax, dword ptr [esi + 4]
    sub eax, 6
    je L8
    dec eax
    dec eax
    je L7
    dec eax
    je L6
    dec eax
    dec eax
    je L5
    push 01010F7B0h
    push 0
    push 0
    push ebx
    call sub_100995D6
    add esp, 16
    xor eax, eax
    jmp L11
L5:
    push dword ptr [esi + 32]
    jmp L9
L6:
    mov eax, dword ptr [esi + 28]
    imul eax, dword ptr [esi + 24]
    jmp L10
L7:
    push dword ptr [esi + 16]
    mov ecx, ebx
    call L0
    imul eax, dword ptr [esi + 20]
    jmp L10
L8:
    push dword ptr [esi + 24]
L9:
    mov ecx, ebx
    call L0
L10:
    add eax, edi
L11:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 4
FUN_10099b4f ENDP
END
