.686
.MODEL FLAT, C
EXTRN sub_100637DE:PROC
EXTRN sub_1008B1E7:PROC
EXTRN sub_100C510A:PROC
EXTRN sub_100C510F:PROC
EXTRN sub_100C5113:PROC
EXTRN sub_100C5121:PROC
EXTRN sub_100C5122:PROC
EXTRN sub_100C5151:PROC
EXTRN sub_100C5158:PROC
EXTRN sub_100C51AE:PROC
EXTRN sub_100C51BC:PROC
EXTRN sub_100C51D1:PROC
EXTRN sub_100C51E0:PROC
EXTRN sub_100C51F1:PROC
EXTRN sub_100C520B:PROC
EXTRN sub_100C520C:PROC
EXTRN sub_100C5238:PROC
EXTRN sub_100F7546:PROC
EXTRN sub_100F7620:PROC
EXTRN sub_100F765C:PROC
EXTRN sub_100F768B:PROC
EXTRN sub_100F86E6:PROC
EXTRN sub_100F86FC:PROC
.CODE
FUN_100c4fb1 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 24
    push push edi
    xor xor edi, edi
    and and dword ptr [ebp - 4], edi
    and and dword ptr [ebp - 8], edi
    cmp cmp dword ptr [ecx + 0158h], edi
    mov mov dword ptr [ebp - 12], ecx
    jne L0
    xor xor eax, eax
    jmp sub_100C5121
    mov mov eax, dword ptr [ebp + 8]
    push push ebx
    mov mov ebx, dword ptr [eax + 48]
    test test ebx, ebx
    push push esi
    je L6
    mov mov eax, dword ptr [ebx + 8]
    cmp cmp dword ptr [eax + 4], 17
    jne L4
    mov mov ecx, dword ptr [eax + 16]
L0:
    test test ecx, ecx
    je L1
    mov mov ecx, dword ptr [ecx + 24]
    mov mov eax, dword ptr [eax + 20]
    test test eax, eax
    jne L2
    xor xor esi, esi
    jmp L3
    mov mov esi, dword ptr [eax + 24]
    test test ecx, ecx
    je L6
    test test esi, esi
    je L7
    lea lea eax, [ebp - 24]
    push push eax
    push push 0
    push push ecx
    call sub_100637DE
    test test eax, eax
    jl L8
    movsx movsx eax, byte ptr [esi]
    push push eax
    call sub_100F7620
    cmp cmp eax, 99
    pop pop ecx
    jne L9
    mov mov eax, dword ptr [ebp - 12]
    mov mov eax, dword ptr [eax + 0C8h]
    cmp cmp eax, dword ptr [ebp - 20]
    jne L7
L1:
    mov mov edi, esi
    jmp L10
    xor xor eax, dword ptr [ebp - 20]
    test test eax, 0FFFF0000h
    jne L11
    test test word ptr [ebp - 20], 0FFFFh
    jne sub_100C510A
    mov mov dword ptr [ebp - 4], esi
    jmp sub_100C510F
    test test esi, esi
    je sub_100C5113
    movsx movsx eax, byte ptr [esi]
    push push eax
    call sub_100F765C
    cmp cmp eax, 99
    pop pop ecx
    jne sub_100C5122
    mov mov dword ptr [ebp - 8], esi
    mov mov ebx, dword ptr [ebx + 12]
    test test ebx, ebx
    jne L5
    test test edi, edi
    jne sub_100C5151
    mov mov edi, dword ptr [ebp - 4]
    test test edi, edi
    jne sub_100C5158
    mov mov edi, dword ptr [ebp - 8]
    test test edi, edi
    je sub_100C51D1
    movsx movsx eax, byte ptr [edi]
    push push eax
    call sub_100F768B
    cmp cmp eax, 99
    pop pop ecx
    jne sub_100C51E0
    lea lea ebx, [edi + 1]
    movsx movsx eax, byte ptr [ebx]
    push push eax
    call sub_100F86E6
    test test eax, eax
    pop pop ecx
    je sub_100C51F1
    add add edi, 2
    mov mov esi, edi
L6:
    jmp sub_100C51AE
    inc inc esi
    movsx movsx eax, byte ptr [esi]
    push push eax
    call sub_100F86FC
    test test eax, eax
    pop pop ecx
    jne sub_100C51BC
    cmp cmp byte ptr [esi], al
    jne sub_100C520B
    push push ebx
    call sub_100F7546
    cmp cmp eax, 01FFFh
    pop pop ecx
    jbe sub_100C520C
    push push eax
    push push edi
    push push 010110338h
L8:
    push push 0
    push push 0
    push push dword ptr [ebp - 12]
    call sub_1008B1E7
    add add esp, 24
L9:
    mov mov eax, 080004005h
    jmp sub_100C5238
    mov mov ecx, dword ptr [ebp + 12]
    shl shl eax, 2
    or or eax, 2
    or or word ptr [ecx + 10], ax
    xor xor eax, eax
    pop pop esi
    pop pop ebx
    pop pop edi
    leave leave
    ret ret 8
FUN_100c4fb1 ENDP
END
