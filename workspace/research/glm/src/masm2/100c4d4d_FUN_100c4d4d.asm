.686
.MODEL FLAT, C
EXTRN sub_10067CB5:PROC
EXTRN sub_100C4DF6:PROC
EXTRN sub_100C4E28:PROC
.CODE
FUN_100c4d4d PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 32
    mov mov eax, dword ptr [ebp + 12]
    cmp cmp eax, -1
    push push esi
    mov mov esi, dword ptr [ebp + 28]
    jne L0
    mov mov eax, dword ptr [esi + 0100h]
    test test eax, eax
    je L1
    mov mov ecx, dword ptr [eax + 60]
    test test ecx, ecx
    je L2
    cmp cmp dword ptr [ecx + 4], 13
    jne L3
    mov mov eax, ecx
    mov mov ecx, dword ptr [eax + 64]
    mov mov eax, dword ptr [eax + 68]
    cmp cmp eax, -1
    mov mov dword ptr [ebp + 8], ecx
    jne L4
    xor xor eax, eax
    mov mov ecx, dword ptr [ebp + 8]
    mov mov dword ptr [ebp - 12], eax
    mov mov eax, dword ptr [ebp + 16]
    and and eax, 0FFFFh
    dec dec eax
    dec dec eax
    mov mov dword ptr [ebp - 16], ecx
    je sub_100C4DF6
    sub sub eax, 4
    jne sub_100C4E28
    push push dword ptr [ebp + 24]
    mov mov eax, dword ptr [ebp + 20]
    push push 010193358h
    add add eax, 01388h
    push push eax
    lea lea eax, [ebp - 32]
    push push eax
    push push dword ptr [esi + 0C4h]
    call sub_10067CB5
    add add esp, 20
    mov mov dword ptr [esi + 0D4h], 1
    xor xor eax, eax
    pop pop esi
    leave leave
    ret ret 24
FUN_100c4d4d ENDP
END
