.686
.MODEL FLAT, C
EXTRN sub_10067CB5:PROC
.CODE
FUN_100c4d4d PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 32
    mov eax, dword ptr [ebp + 12]
    cmp eax, -1
    push esi
    mov esi, dword ptr [ebp + 28]
    jne L1
    mov eax, dword ptr [esi + 000000100h]
    test eax, eax
    je L0
    mov ecx, dword ptr [eax + 60]
    test ecx, ecx
    je L0
    cmp dword ptr [ecx + 4], 13
    jne L0
    mov eax, ecx
    mov ecx, dword ptr [eax + 64]
    mov eax, dword ptr [eax + 68]
    cmp eax, -1
    mov dword ptr [ebp + 8], ecx
    jne L1
L0:
    xor eax, eax
L1:
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [ebp - 12], eax
    mov eax, dword ptr [ebp + 16]
    and eax, 00000FFFFh
    dec eax
    dec eax
    mov dword ptr [ebp - 16], ecx
    je L2
    sub eax, 4
    jne L3
L2:
    push dword ptr [ebp + 24]
    mov eax, dword ptr [ebp + 20]
    push 010193358h
    add eax, 000001388h
    push eax
    lea eax, [ebp - 32]
    push eax
    push dword ptr [esi + 0000000C4h]
    call sub_10067CB5
    add esp, 20
    mov dword ptr [esi + 0000000D4h], 1
L3:
    xor eax, eax
    pop esi
    leave
    ret 24
FUN_100c4d4d ENDP
END
