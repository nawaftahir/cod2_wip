.686
.MODEL FLAT, C
EXTRN sub_10067D77:PROC
EXTRN sub_1008B1C0:PROC
EXTRN sub_1008B1C2:PROC
EXTRN sub_1008B1C5:PROC
EXTRN sub_1008B1D2:PROC
EXTRN sub_1008B1D7:PROC
EXTRN sub_1008B1DF:PROC
EXTRN sub_100F61DC:PROC
.CODE
FUN_1008b13a PROC
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
    je sub_1008B1C0
    mov mov edx, dword ptr [ecx + 4]
    cmp cmp edx, 3
    je sub_1008B1C5
    cmp cmp edx, 6
    je sub_1008B1C2
    cmp cmp edx, 13
    jne sub_1008B1D2
    lea lea eax, [ecx + 48]
    jmp sub_1008B1D7
    mov mov eax, dword ptr [ecx + 20]
    add add eax, 16
    jmp sub_1008B1DF
    lea lea eax, [ecx + 16]
    lea lea ecx, [ebp - 0100h]
    push push ecx
    push push 010193358h
    push push dword ptr [ebp + 16]
    push push eax
    mov mov eax, dword ptr [ebp + 8]
    push push dword ptr [eax + 0C4h]
    call sub_10067D77
    add add esp, 20
    xor xor eax, eax
    leave leave
    ret ret
FUN_1008b13a ENDP
END
