.686
.MODEL FLAT, C
EXTRN sub_1001A224:PROC
EXTRN sub_1005F38A:PROC
EXTRN sub_1005FB55:PROC
EXTRN sub_1005FB6A:PROC
EXTRN sub_10063898:PROC
EXTRN sub_100EFE5B:PROC
EXTRN fp_101D49D4:DWORD
.CODE
FUN_1001a920 PROC
    push ecx
    mov ecx, dword ptr [esi + 4]
    push ebp
    mov ebp, dword ptr [esp + 20]
    lea eax, [esp + 4]
    push eax
    push ecx
    call sub_10063898
    test eax, eax
    jge L0
    push eax
    push eax
    call sub_100EFE5B
    push eax
    push 0101950C8h
    call sub_1005F38A
    add esp, 12
    xor al, al
    pop ebp
    pop ecx
    ret
L0:
    mov eax, dword ptr [esp + 4]
    mov edx, dword ptr [eax]
    push ebx
    push eax
    call dword ptr [edx + 0xc]
    mov ecx, dword ptr [esp + 20]
    mov ebx, eax
    movzx ax, byte ptr [ebx + 12]
    test ax, ax
    mov word ptr [ecx], ax
    jne L2
    push 1
    push 010195818h
    mov ecx, edi
    mov dword ptr [ebp], 0
    call sub_1005FB55
    add esp, 8
    test eax, eax
    je L1
    push 1
    push 0101950C4h
    mov ecx, edi
    call sub_1005FB6A
    add esp, 8
    test eax, eax
    je L1
    mov eax, dword ptr [esp + 8]
    mov ecx, dword ptr [eax]
    push eax
    mov bl, 1
    call dword ptr [ecx + 8]
    mov al, bl
    pop ebx
    pop ebp
    pop ecx
    ret
L1:
    mov eax, dword ptr [esp + 8]
    mov ecx, dword ptr [eax]
    push eax
    xor bl, bl
    call dword ptr [ecx + 8]
    mov al, bl
    pop ebx
    pop ebp
    pop ecx
    ret
L2:
    movzx eax, ax
    shl eax, 3
    push eax
    call dword ptr [fp_101D49D4]
    mov edx, dword ptr [esp + 20]
    push eax
    mov dword ptr [ebp], eax
    mov eax, dword ptr [esi]
    push edx
    push eax
    push edi
    call sub_1001A224
    mov bl, al
    mov eax, dword ptr [esp + 28]
    mov ecx, dword ptr [eax]
    add esp, 20
    push eax
    call dword ptr [ecx + 8]
    mov al, bl
    pop ebx
    pop ebp
    pop ecx
    ret
FUN_1001a920 ENDP
END
