.686
.MODEL FLAT, C
EXTRN sub_1004C93A:PROC
EXTRN sub_10050926:PROC
.CODE
FUN_10050e10 PROC
    sub esp, 20
    push esi
    mov esi, dword ptr [esp + 28]
    mov ecx, dword ptr [esi + 000000180h]
    mov eax, 1
    shl eax, cl
    push edi
    mov edi, dword ptr [esi + 0000001A0h]
    mov dword ptr [esp + 32], eax
    mov eax, dword ptr [esi + 000000104h]
    test eax, eax
    je L0
    mov eax, dword ptr [edi + 40]
    test eax, eax
    jne L0
    call sub_10050926
    test al, al
    jne L0
    pop edi
    pop esi
    add esp, 20
    ret
L0:
    mov eax, dword ptr [esi + 32]
    mov edx, dword ptr [eax + 4]
    mov ecx, dword ptr [eax]
    mov eax, dword ptr [edi + 12]
    push ebx
    mov dword ptr [esp + 16], edx
    mov edx, dword ptr [esi + 000000148h]
    push ebp
    xor ebp, ebp
    test edx, edx
    mov dword ptr [esp + 16], ecx
    mov ecx, dword ptr [edi + 16]
    mov dword ptr [esp + 32], esi
    jle L4
    jmp L1
    lea ebx, [ebx]
L1:
    cmp ecx, 1
    mov edx, dword ptr [esp + 44]
    mov ebx, dword ptr [edx + ebp*4]
    jge L2
    push 1
    push ecx
    push eax
    lea eax, [esp + 28]
    push eax
    call sub_1004C93A
    add esp, 16
    test al, al
    je L5
    mov eax, dword ptr [esp + 24]
    mov ecx, dword ptr [esp + 28]
L2:
    dec ecx
    mov edx, eax
    sar edx, cl
    test dl, 1
    je L3
    mov dx, word ptr [esp + 40]
    or word ptr [ebx], dx
L3:
    mov edx, dword ptr [esi + 000000148h]
    inc ebp
    cmp ebp, edx
    jl L1
L4:
    mov edx, dword ptr [esi + 32]
    mov ebx, dword ptr [esp + 16]
    mov dword ptr [edx], ebx
    mov edx, dword ptr [esi + 32]
    mov esi, dword ptr [esp + 20]
    mov dword ptr [edx + 4], esi
    mov dword ptr [edi + 12], eax
    mov eax, dword ptr [edi + 40]
    pop ebp
    dec eax
    pop ebx
    mov dword ptr [edi + 40], eax
    mov dword ptr [edi + 16], ecx
    pop edi
    mov al, 1
    pop esi
    add esp, 20
    ret
L5:
    pop ebp
    pop ebx
    pop edi
FUN_10050e10 ENDP
END
