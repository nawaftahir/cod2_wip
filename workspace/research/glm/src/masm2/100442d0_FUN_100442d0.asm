.686
.MODEL FLAT, C
EXTRN sub_10044034:PROC
EXTRN sub_100443AC:PROC
EXTRN sub_100443CD:PROC
EXTRN sub_100443E4:PROC
EXTRN sub_10044414:PROC
EXTRN sub_10044422:PROC
EXTRN sub_10044427:PROC
.CODE
FUN_100442d0 PROC
    push push ebx
    mov mov bl, byte ptr [esp + 8]
    push push esi
    mov mov esi, eax
    push push 127
    mov mov eax, 7
    call sub_10044034
    add add esp, 4
    test test al, al
    je sub_100443AC
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [esi + 8], 0
    mov mov dword ptr [esi + 12], 0
    mov mov byte ptr [eax], 0FFh
    mov mov ecx, dword ptr [esi]
    mov mov eax, dword ptr [esi + 4]
    inc inc ecx
    dec dec eax
    push push edi
    mov mov dword ptr [esi], ecx
    mov mov dword ptr [esi + 4], eax
    jne L0
    mov mov eax, dword ptr [esi + 32]
    mov mov edi, dword ptr [eax + 32]
    push push eax
    call call dword ptr [edi + 12]
    add add esp, 4
    test test al, al
    je sub_100443E4
    mov mov ecx, dword ptr [edi]
    mov mov dword ptr [esi], ecx
    mov mov edx, dword ptr [edi + 4]
    mov mov dword ptr [esi + 4], edx
    mov mov eax, dword ptr [esi]
    sub sub bl, 48
    mov mov byte ptr [eax], bl
    mov mov ecx, dword ptr [esi]
    mov mov eax, dword ptr [esi + 4]
    inc inc ecx
    dec dec eax
    mov mov dword ptr [esi], ecx
    mov mov dword ptr [esi + 4], eax
    jne sub_100443CD
    mov mov eax, dword ptr [esi + 32]
    mov mov edi, dword ptr [eax + 32]
    push push eax
    call call dword ptr [edi + 12]
    add add esp, 4
    test test al, al
    je sub_10044414
    mov mov ecx, dword ptr [edi]
    mov mov dword ptr [esi], ecx
    mov mov edx, dword ptr [edi + 4]
    mov mov dword ptr [esi + 4], edx
    mov mov ecx, dword ptr [esi + 32]
    mov mov edx, dword ptr [ecx + 0ECh]
    xor xor eax, eax
    test test edx, edx
    jle sub_10044422
    lea lea ecx, [esi + 16]
    mov mov edi, edi
    mov mov dword ptr [ecx], 0
    mov mov edx, dword ptr [esi + 32]
    mov mov edi, dword ptr [edx + 0ECh]
    inc inc eax
    add add ecx, 4
    cmp cmp eax, edi
    jl sub_10044427
    pop pop edi
    pop pop esi
    mov mov al, 1
    pop pop ebx
    ret ret
    pop pop esi
    xor xor al, al
    pop pop ebx
    ret ret
    pop pop edi
    pop pop esi
    xor xor al, al
    pop pop ebx
    ret ret
FUN_100442d0 ENDP
END
