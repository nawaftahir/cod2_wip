.686
.MODEL FLAT, C
EXTRN sub_1006777B:PROC
EXTRN sub_10067C74:PROC
EXTRN sub_10082341:PROC
.CODE
FUN_10063cf7 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push dword ptr [ebp + 16]
    mov esi, ecx
    push 0
    push dword ptr [ebp + 12]
    lea ecx, [esi + 76]
    push dword ptr [ebp + 8]
    call sub_10082341
    mov ebx, eax
    test ebx, ebx
    jge L0
    push 01010C5ACh
    push 0000005E8h
    push 0
    push dword ptr [ebp + 24]
    call sub_10067C74
    add esp, 16
    mov eax, ebx
    jmp L1
L0:
    push dword ptr [ebp + 24]
    mov ecx, dword ptr [esi + 84]
    push dword ptr [ebp + 20]
    mov eax, dword ptr [esi + 80]
    push 1
    push 0
    push ecx
    mov dword ptr [esi + 104], ecx
    push eax
    mov ecx, esi
    mov dword ptr [esi + 100], eax
    call sub_1006777B
    test eax, eax
    jl L1
    xor eax, eax
L1:
    pop esi
    pop ebx
    pop ebp
    ret 20
FUN_10063cf7 ENDP
END
