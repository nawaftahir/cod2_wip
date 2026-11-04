.686
.MODEL FLAT, C
EXTRN sub_10063D96:PROC
EXTRN sub_10063DB9:PROC
EXTRN sub_1006777B:PROC
EXTRN sub_10067C74:PROC
EXTRN sub_10082341:PROC
.CODE
FUN_10063cf7 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ebx
    push push esi
    push push dword ptr [ebp + 16]
    mov mov esi, ecx
    push push 0
    push push dword ptr [ebp + 12]
    lea lea ecx, [esi + 76]
    push push dword ptr [ebp + 8]
    call sub_10082341
    mov mov ebx, eax
    test test ebx, ebx
    jge L0
    push push 01010C5ACh
    push push 05E8h
    push push 0
    push push dword ptr [ebp + 24]
    call sub_10067C74
    add add esp, 16
    mov mov eax, ebx
    jmp sub_10063D96
    push push dword ptr [ebp + 24]
    mov mov ecx, dword ptr [esi + 84]
    push push dword ptr [ebp + 20]
    mov mov eax, dword ptr [esi + 80]
    push push 1
    push push 0
    push push ecx
    mov mov dword ptr [esi + 104], ecx
    push push eax
    mov mov ecx, esi
    mov mov dword ptr [esi + 100], eax
    call sub_1006777B
    test test eax, eax
    jl sub_10063DB9
    xor xor eax, eax
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret 20
FUN_10063cf7 ENDP
END
