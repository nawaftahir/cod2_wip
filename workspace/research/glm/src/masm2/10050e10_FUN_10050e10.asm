.686
.MODEL FLAT, C
EXTRN sub_1004C93A:PROC
EXTRN sub_10050926:PROC
EXTRN sub_10050F25:PROC
EXTRN sub_10050F2E:PROC
EXTRN sub_10050F36:PROC
EXTRN sub_10050F5E:PROC
EXTRN sub_10050F81:PROC
.CODE
FUN_10050e10 PROC
    sub sub esp, 20
    push push esi
    mov mov esi, dword ptr [esp + 28]
    mov mov ecx, dword ptr [esi + 0180h]
    mov mov eax, 1
    shl shl eax, cl
    push push edi
    mov mov edi, dword ptr [esi + 01A0h]
    mov mov dword ptr [esp + 32], eax
    mov mov eax, dword ptr [esi + 0104h]
    test test eax, eax
    je L0
    mov mov eax, dword ptr [edi + 40]
    test test eax, eax
    jne L1
    call sub_10050926
    test test al, al
    jne L2
    pop pop edi
    pop pop esi
    add add esp, 20
    ret ret
    mov mov eax, dword ptr [esi + 32]
    mov mov edx, dword ptr [eax + 4]
    mov mov ecx, dword ptr [eax]
    mov mov eax, dword ptr [edi + 12]
    push push ebx
    mov mov dword ptr [esp + 16], edx
    mov mov edx, dword ptr [esi + 0148h]
    push push ebp
    xor xor ebp, ebp
    test test edx, edx
    mov mov dword ptr [esp + 16], ecx
    mov mov ecx, dword ptr [edi + 16]
    mov mov dword ptr [esp + 32], esi
    jle sub_10050F2E
    jmp L3
L0:
    lea lea ebx, [ebx]
    cmp cmp ecx, 1
    mov mov edx, dword ptr [esp + 44]
    mov mov ebx, dword ptr [edx + ebp*4]
L2:
    jge sub_10050F25
    push push 1
    push push ecx
    push push eax
    lea lea eax, [esp + 28]
    push push eax
    call sub_1004C93A
    add add esp, 16
    test test al, al
    je sub_10050F81
    mov mov eax, dword ptr [esp + 24]
    mov mov ecx, dword ptr [esp + 28]
    dec dec ecx
    mov mov edx, eax
    sar sar edx, cl
    test test dl, 1
    je sub_10050F5E
    mov mov dx, word ptr [esp + 40]
    or or word ptr [ebx], dx
    mov mov edx, dword ptr [esi + 0148h]
    inc inc ebp
    cmp cmp ebp, edx
    jl sub_10050F36
    mov mov edx, dword ptr [esi + 32]
    mov mov ebx, dword ptr [esp + 16]
    mov mov dword ptr [edx], ebx
    mov mov edx, dword ptr [esi + 32]
    mov mov esi, dword ptr [esp + 20]
    mov mov dword ptr [edx + 4], esi
    mov mov dword ptr [edi + 12], eax
    mov mov eax, dword ptr [edi + 40]
    pop pop ebp
    dec dec eax
    pop pop ebx
    mov mov dword ptr [edi + 40], eax
    mov mov dword ptr [edi + 16], ecx
    pop pop edi
    mov mov al, 1
    pop pop esi
    add add esp, 20
    ret ret
    pop pop ebp
    pop pop ebx
    pop pop edi
FUN_10050e10 ENDP
END
