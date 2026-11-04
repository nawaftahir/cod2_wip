.686
.MODEL FLAT, C
EXTRN sub_10044F48:PROC
EXTRN sub_10045403:PROC
EXTRN sub_1004541A:PROC
EXTRN sub_1004542E:PROC
EXTRN sub_10045BF0:PROC
EXTRN sub_10045BF3:PROC
EXTRN sub_10045BF9:PROC
EXTRN sub_10045C24:PROC
EXTRN sub_10045C28:PROC
EXTRN sub_10045C40:PROC
EXTRN sub_10045C69:PROC
EXTRN sub_10045C99:PROC
EXTRN sub_10045CBD:PROC
.CODE
FUN_10045b10 PROC
    push push ebx
    push push ebp
    push push esi
    mov mov esi, dword ptr [esp + 16]
    mov mov eax, dword ptr [esi + 68]
    mov mov ebx, dword ptr [esi + 76]
    push push edi
    xor xor ebp, ebp
    xor xor edi, edi
    test test eax, eax
    jle L0
    add add ebx, 16
    lea lea esp, [esp]
    mov mov eax, dword ptr [ebx]
    push push eax
    call sub_10044F48
    add add ebp, eax
    mov mov eax, dword ptr [esi + 68]
    add add esp, 4
    inc inc edi
    add add ebx, 84
    cmp cmp edi, eax
    jl L1
    mov mov al, byte ptr [esi + 0B9h]
    test test al, al
    jne L2
    mov mov al, byte ptr [esi + 0DCh]
    test test al, al
    jne sub_10045BF3
    cmp cmp dword ptr [esi + 64], 8
    jne sub_10045BF9
    mov mov ecx, dword ptr [esi + 68]
    test test ecx, ecx
    mov mov eax, dword ptr [esi + 76]
    mov mov edx, 1
    mov mov bl, dl
    jle L3
    add add eax, 24
    cmp cmp dword ptr [eax - 4], edx
    jg L3
    cmp cmp dword ptr [eax], edx
    jle sub_10045BF0
    xor xor bl, bl
    add add eax, 84
    dec dec ecx
    jne L4
    test test ebp, ebp
    je sub_10045C24
    test test bl, bl
    je sub_10045C28
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 20], 75
    mov mov edx, dword ptr [esi]
    push push 0
    push push esi
    xor xor bl, bl
    call call dword ptr [edx + 4]
    add add esp, 8
    jmp sub_10045C40
    xor xor bl, bl
    mov mov al, byte ptr [esi + 0B9h]
    test test al, al
    pop pop edi
    mov mov ecx, esi
    je sub_10045C69
    pop pop esi
    pop pop ebp
    mov mov eax, 0C9h
    pop pop ebx
    jmp sub_10045403
    mov mov al, byte ptr [esi + 0DCh]
    test test al, al
    pop pop esi
    pop pop ebp
    je sub_10045C99
    mov mov eax, 0C2h
    pop pop ebx
    jmp sub_1004541A
    test test bl, bl
    pop pop ebx
    mov mov eax, 0C0h
    jne sub_10045CBD
    mov mov eax, 0C1h
L2:
    jmp sub_1004542E
FUN_10045b10 ENDP
END
