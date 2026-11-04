.686
.MODEL FLAT, C
EXTRN sub_100995B5:PROC
.CODE
FUN_1009991f PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 8]
    test esi, esi
    push edi
    mov edi, ecx
    je L9
    mov eax, dword ptr [esi + 4]
    dec eax
    je L6
    sub eax, 5
    je L5
    dec eax
    dec eax
    je L4
    dec eax
    je L2
    dec eax
    dec eax
    je L1
    push 01010F7B0h
    push 0
    push 0
    push edi
    call sub_100995B5
    add esp, 16
    jmp L9
L1:
    push dword ptr [ebp + 12]
    push dword ptr [esi + 32]
    jmp L8
L2:
    cmp dword ptr [ebp + 12], 0
    je L3
    or byte ptr [esi + 33], 2
    jmp L9
L3:
    and byte ptr [esi + 33], 0000000FDh
    jmp L9
L4:
    push dword ptr [ebp + 12]
    push dword ptr [esi + 16]
    jmp L8
L5:
    push dword ptr [ebp + 12]
    push dword ptr [esi + 24]
    jmp L8
L6:
    cmp dword ptr [esi + 4], 1
    jne L7
    push dword ptr [ebp + 12]
    mov ecx, edi
    push dword ptr [esi + 8]
    call L0
    mov esi, dword ptr [esi + 12]
    test esi, esi
    jne L6
L7:
    test esi, esi
    je L9
    push dword ptr [ebp + 12]
    push esi
L8:
    mov ecx, edi
    call L0
L9:
    pop edi
    xor eax, eax
    pop esi
    pop ebp
    ret 8
FUN_1009991f ENDP
END
