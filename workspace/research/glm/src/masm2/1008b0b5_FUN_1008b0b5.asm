.686
.MODEL FLAT, C
EXTRN sub_10067CB1:PROC
EXTRN sub_1008B13B:PROC
EXTRN sub_1008B13D:PROC
EXTRN sub_1008B140:PROC
EXTRN sub_1008B14D:PROC
EXTRN sub_1008B152:PROC
EXTRN sub_1008B15A:PROC
EXTRN sub_100F61DC:PROC
.CODE
FUN_1008b0b5 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0100h
    lea lea eax, [ebp + 24]
    push push eax
    push push dword ptr [ebp + 20]
    lea lea eax, [ebp - 0100h]
    push push 0100h
    push push eax
    call sub_100F61DC
    mov mov ecx, dword ptr [ebp + 12]
    xor xor eax, eax
    add add esp, 16
    cmp cmp ecx, eax
    mov mov byte ptr [ebp - 1], al
    je sub_1008B13B
    mov mov edx, dword ptr [ecx + 4]
    cmp cmp edx, 3
    je sub_1008B140
    cmp cmp edx, 6
    je sub_1008B13D
    cmp cmp edx, 13
    jne sub_1008B14D
    lea lea eax, [ecx + 48]
    jmp sub_1008B152
    mov mov eax, dword ptr [ecx + 20]
    add add eax, 16
    jmp sub_1008B15A
    lea lea eax, [ecx + 16]
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    lea lea ecx, [ebp - 0100h]
    push push ecx
    push push 010193358h
    push push dword ptr [ebp + 16]
    push push eax
    push push dword ptr [esi + 0C4h]
    call sub_10067CB1
    add add esp, 20
    mov mov dword ptr [esi + 0D4h], 1
    xor xor eax, eax
    pop pop esi
    leave leave
    ret ret
FUN_1008b0b5 ENDP
END
