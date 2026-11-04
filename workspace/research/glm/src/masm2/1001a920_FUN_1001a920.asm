.686
.MODEL FLAT, C
EXTRN sub_1001A224:PROC
EXTRN sub_1001AA15:PROC
EXTRN sub_1001AA1F:PROC
EXTRN sub_1001AA34:PROC
EXTRN sub_1005F38A:PROC
EXTRN sub_1005FB55:PROC
EXTRN sub_1005FB6A:PROC
EXTRN sub_10063898:PROC
EXTRN sub_100EFE5B:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
.CODE
FUN_1001a920 PROC
    push push ecx
    mov mov ecx, dword ptr [esi + 4]
    push push ebp
    mov mov ebp, dword ptr [esp + 20]
    lea lea eax, [esp + 4]
    push push eax
    push push ecx
    call sub_10063898
    test test eax, eax
    jge L0
    push push eax
    push push eax
    call sub_100EFE5B
    push push eax
    push push 0101950C8h
    call sub_1005F38A
    add add esp, 12
    xor xor al, al
    pop pop ebp
    pop pop ecx
    ret ret
    mov mov eax, dword ptr [esp + 4]
    mov mov edx, dword ptr [eax]
    push push ebx
    push push eax
    call call dword ptr [edx + 12]
    mov mov ecx, dword ptr [esp + 20]
    mov mov ebx, eax
    movzx movzx ax, byte ptr [ebx + 12]
    test test ax, ax
    mov mov word ptr [ecx], ax
    jne sub_1001AA15
    push push 1
    push push 010195818h
    mov mov ecx, edi
    mov mov dword ptr [ebp], 0
    call sub_1005FB55
    add add esp, 8
    test test eax, eax
    je sub_1001AA1F
    push push 1
    push push 0101950C4h
    mov mov ecx, edi
    call sub_1005FB6A
    add add esp, 8
    test test eax, eax
    je sub_1001AA34
    mov mov eax, dword ptr [esp + 8]
    mov mov ecx, dword ptr [eax]
    push push eax
    mov mov bl, 1
    call call dword ptr [ecx + 8]
    mov mov al, bl
    pop pop ebx
    pop pop ebp
    pop pop ecx
    ret ret
    mov mov eax, dword ptr [esp + 8]
    mov mov ecx, dword ptr [eax]
    push push eax
    xor xor bl, bl
    call call dword ptr [ecx + 8]
    mov mov al, bl
    pop pop ebx
    pop pop ebp
    pop pop ecx
    ret ret
    movzx movzx eax, ax
    shl shl eax, 3
    push push eax
    call dword ptr [fp_101D49D4]
    mov mov edx, dword ptr [esp + 20]
    push push eax
    mov mov dword ptr [ebp], eax
    mov mov eax, dword ptr [esi]
    push push edx
    push push eax
    push push edi
    call sub_1001A224
    mov mov bl, al
    mov mov eax, dword ptr [esp + 28]
    mov mov ecx, dword ptr [eax]
    add add esp, 20
    push push eax
    call call dword ptr [ecx + 8]
    mov mov al, bl
    pop pop ebx
    pop pop ebp
    pop pop ecx
    ret ret
FUN_1001a920 ENDP
END
