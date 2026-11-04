.686
.MODEL FLAT, C
EXTRN sub_100F5EB0:PROC
EXTRN sub_100F607C:PROC
EXTRN sub_100F7489:PROC
EXTRN sub_100F75D7:PROC
EXTRN sub_100F75FA:PROC
EXTRN sub_100F8553:PROC
EXTRN sub_100F85E8:PROC
EXTRN sub_100FA28A:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FC095:PROC
EXTRN sub_100FC1D2:PROC
EXTRN sub_100FC71A:PROC
EXTRN sub_100FC72A:PROC
EXTRN sub_100FC743:PROC
EXTRN sub_100FC76B:PROC
EXTRN sub_100FC774:PROC
EXTRN sub_100FC796:PROC
EXTRN sub_100FC798:PROC
EXTRN sub_100FC7A0:PROC
EXTRN sub_100FC7AD:PROC
EXTRN sub_100FC7F6:PROC
EXTRN sub_100FC7FB:PROC
EXTRN sub_100FC80E:PROC
EXTRN sub_100FC85E:PROC
EXTRN sub_100FC863:PROC
EXTRN sub_100FC876:PROC
EXTRN sub_100FC8F3:PROC
EXTRN sub_100FC8F9:PROC
EXTRN sub_100FC8FD:PROC
EXTRN sub_100FC906:PROC
EXTRN sub_100FC929:PROC
EXTRN sub_100FC92E:PROC
EXTRN sub_100FC933:PROC
EXTRN sub_100FC939:PROC
EXTRN sub_100FC93D:PROC
EXTRN sub_100FC954:PROC
EXTRN sub_100FC98E:PROC
EXTRN sub_100FC9B2:PROC
EXTRN sub_100FE937:PROC
EXTRN sub_1010040A:PROC
EXTRN sub_101012B1:PROC
EXTRN sub_10107F0A:PROC
EXTRN EXTRN fp_1010C134:DWORD:DWORD
EXTRN EXTRN g_1010C044:DWORD:DWORD
EXTRN EXTRN g_101A4DB0:DWORD:DWORD
EXTRN EXTRN g_101A4DB4:DWORD:DWORD
EXTRN EXTRN g_101A4DB8:DWORD:DWORD
EXTRN EXTRN g_101A4E40:DWORD:DWORD
EXTRN EXTRN g_101A4E44:DWORD:DWORD
EXTRN EXTRN g_101A4E48:DWORD:DWORD
EXTRN EXTRN g_101A4E54:DWORD:DWORD
EXTRN EXTRN g_101ADF28:DWORD:DWORD
EXTRN EXTRN g_101ADF6E:DWORD:DWORD
EXTRN EXTRN g_101ADF7C:DWORD:DWORD
EXTRN EXTRN g_101ADFC2:DWORD:DWORD
EXTRN EXTRN g_101ADFD0:DWORD:DWORD
EXTRN EXTRN g_101ADFD4:DWORD:DWORD
EXTRN EXTRN g_101ADFD8:DWORD:DWORD
EXTRN EXTRN g_101AE1A8:DWORD:DWORD
.CODE
__tzset_lk PROC
    push push 24
    push push 01017C920h
    call sub_100FB61C
    xor xor edi, edi
    mov mov dword ptr [ebp - 32], edi
    push push 7
    call sub_100FC095
    pop pop ecx
    mov mov dword ptr [ebp - 4], edi
    mov mov ebx, dword ptr [g_101AE1A8]
    mov mov dword ptr [ebp - 40], ebx
    mov mov dword ptr [g_101ADFD4], edi
    or or dword ptr [g_101A4E54], -1
    or or dword ptr [g_101A4E48], -1
    push push 01017C91Ch
    call sub_10107F0A
    pop pop ecx
    mov mov esi, eax
    mov mov dword ptr [ebp - 36], esi
    cmp cmp esi, edi
    je L3
    cmp cmp byte ptr [esi], 0
    je L4
    mov mov eax, dword ptr [g_101ADFD8]
    cmp cmp eax, edi
    je L1
    push push eax
    push push esi
    call sub_1010040A
    pop pop ecx
    pop pop ecx
    test test eax, eax
    je L9
    mov mov eax, dword ptr [g_101ADFD8]
    cmp cmp eax, edi
    je L2
    push push eax
    call sub_100F8553
    pop pop ecx
    push push esi
    call sub_100FA28A
    inc inc eax
    push push eax
    call L0
    pop pop ecx
    pop pop ecx
    mov mov dword ptr [g_101ADFD8], eax
    cmp cmp eax, edi
    je sub_100FC71A
    push push esi
    push push eax
    call sub_100FE937
    pop pop ecx
    pop pop ecx
    or or dword ptr [ebp - 4], -1
    call sub_100FC743
    push push 3
    push push esi
    push push dword ptr [g_101A4E40]
    call sub_100F5EB0
    add add esp, 12
    mov mov eax, dword ptr [g_101A4E40]
    mov mov byte ptr [eax + 3], 0
    add add esi, 3
    cmp cmp byte ptr [esi], 45
    jne L5
    mov mov dword ptr [ebp - 32], 1
    inc inc esi
    push push esi
    call sub_100F7489
    pop pop ecx
    imul imul eax, eax, 0E10h
    mov mov dword ptr [g_101A4DB0], eax
    mov mov bl, 48
    mov mov al, byte ptr [esi]
    cmp cmp al, 43
    je L7
    cmp cmp al, bl
    jl sub_100FC798
    cmp cmp al, 57
    jg sub_100FC7A0
    inc inc esi
    jmp L6
    mov mov eax, dword ptr [g_101ADFD8]
    cmp cmp eax, edi
    je L8
    push push eax
    call sub_100F85E8
    pop pop ecx
    mov mov dword ptr [g_101ADFD8], edi
    push push 0101ADF28h
    call dword ptr [fp_1010C134]
    cmp cmp eax, -1
    je sub_100FC7AD
    xor xor ecx, ecx
    inc inc ecx
    mov mov dword ptr [g_101ADFD4], ecx
    mov mov eax, dword ptr [g_101ADF28]
    imul imul eax, eax, 60
    mov mov dword ptr [g_101A4DB0], eax
    cmp cmp word ptr [g_101ADF6E], di
    je sub_100FC72A
    mov mov edx, dword ptr [g_101ADF7C]
    imul imul edx, edx, 60
    add add eax, edx
    mov mov dword ptr [g_101A4DB0], eax
    cmp cmp word ptr [g_101ADFC2], di
    je sub_100FC76B
    mov mov eax, dword ptr [g_101ADFD0]
    cmp cmp eax, edi
    je sub_100FC774
    mov mov dword ptr [g_101A4DB4], ecx
    sub sub eax, dword ptr [g_101ADF7C]
    imul imul eax, eax, 60
    mov mov dword ptr [g_101A4DB8], eax
    jmp sub_100FC796
    mov mov dword ptr [g_101A4DB4], edi
    mov mov dword ptr [g_101A4DB8], edi
    lea lea eax, [ebp - 28]
    push push eax
    push push edi
    push push 63
    push push dword ptr [g_101A4E40]
    push push -1
    push push 0101ADF2Ch
    push push edi
    push push ebx
    mov mov esi, dword ptr [g_1010C044]
    call call esi
    test test eax, eax
    je sub_100FC7F6
    cmp cmp dword ptr [ebp - 28], edi
    jne sub_100FC7FB
    mov mov eax, dword ptr [g_101A4E40]
    mov mov byte ptr [eax + 63], 0
    jmp sub_100FC80E
    mov mov eax, dword ptr [g_101A4E40]
    mov mov byte ptr [eax], 0
    lea lea eax, [ebp - 28]
    push push eax
    push push edi
    push push 63
    push push dword ptr [g_101A4E44]
    push push -1
    push push 0101ADF80h
    push push edi
    push push ebx
    call call esi
    test test eax, eax
    je sub_100FC85E
    cmp cmp dword ptr [ebp - 28], edi
    jne sub_100FC863
    mov mov eax, dword ptr [g_101A4E44]
    mov mov byte ptr [eax + 63], 0
    jmp sub_100FC876
L7:
    mov mov eax, dword ptr [g_101A4E44]
    mov mov byte ptr [eax], 0
    push push -1
    lea lea eax, [ebp - 16]
    push push eax
    call sub_101012B1
    pop pop ecx
    pop pop ecx
    jmp sub_100FC92E
    mov mov esi, dword ptr [ebp - 36]
    xor xor edi, edi
    push push 7
    call sub_100FC1D2
    pop pop ecx
    ret ret
    cmp cmp byte ptr [esi], 58
    jne sub_100FC906
    inc inc esi
    push push esi
    call sub_100F75D7
    pop pop ecx
L8:
    imul imul eax, eax, 60
    add add dword ptr [g_101A4DB0], eax
    jmp sub_100FC8F3
    cmp cmp al, 57
    jg sub_100FC8FD
    inc inc esi
    mov mov al, byte ptr [esi]
    cmp cmp al, bl
    jge sub_100FC8F9
    cmp cmp byte ptr [esi], 58
    jne sub_100FC929
    inc inc esi
    push push esi
    call sub_100F75FA
    pop pop ecx
    add add dword ptr [g_101A4DB0], eax
    jmp sub_100FC933
    cmp cmp al, 57
    jg sub_100FC93D
    inc inc esi
    mov mov al, byte ptr [esi]
    cmp cmp al, bl
    jge sub_100FC939
    cmp cmp dword ptr [ebp - 32], edi
    je sub_100FC954
    neg neg dword ptr [g_101A4DB0]
    movsx movsx eax, byte ptr [esi]
    mov mov dword ptr [g_101A4DB4], eax
    cmp cmp eax, edi
    je sub_100FC98E
    push push 3
    push push esi
    push push dword ptr [g_101A4E44]
    call sub_100F607C
    add add esp, 12
    mov mov eax, dword ptr [g_101A4E44]
    mov mov byte ptr [eax + 3], 0
    jmp sub_100FC9B2
__tzset_lk ENDP
END
