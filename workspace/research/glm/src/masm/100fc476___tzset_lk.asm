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
EXTRN sub_100FC4F5:PROC
EXTRN sub_100FC92E:PROC
EXTRN sub_100FC98E:PROC
EXTRN sub_100FC9B2:PROC
EXTRN sub_100FE937:PROC
EXTRN sub_1010040A:PROC
EXTRN sub_101012B1:PROC
EXTRN sub_10107F0A:PROC
EXTRN fp_1010C134:DWORD
EXTRN g_1010C044:DWORD
EXTRN g_101A4DB0:DWORD
EXTRN g_101A4DB4:DWORD
EXTRN g_101A4DB8:DWORD
EXTRN g_101A4E40:DWORD
EXTRN g_101A4E44:DWORD
EXTRN g_101A4E48:DWORD
EXTRN g_101A4E54:DWORD
EXTRN g_101ADF28:DWORD
EXTRN g_101ADF6E:DWORD
EXTRN g_101ADF7C:DWORD
EXTRN g_101ADFC2:DWORD
EXTRN g_101ADFD0:DWORD
EXTRN g_101ADFD4:DWORD
EXTRN g_101ADFD8:DWORD
EXTRN g_101AE1A8:DWORD
.CODE
__tzset_lk PROC
    push 24
    push 01017C920h
    call sub_100FB61C
    xor edi, edi
    mov dword ptr [ebp - 32], edi
    push 7
    call sub_100FC095
    pop ecx
    mov dword ptr [ebp - 4], edi
    mov ebx, dword ptr [g_101AE1A8]
    mov dword ptr [ebp - 40], ebx
    mov dword ptr [g_101ADFD4], edi
    or dword ptr [g_101A4E54], 0FFFFFFFFh
    or dword ptr [g_101A4E48], 0FFFFFFFFh
    push 01017C91Ch
    call sub_10107F0A
    pop ecx
    mov esi, eax
    mov dword ptr [ebp - 36], esi
    cmp esi, edi
    je L4
    cmp byte ptr [esi], 0
    je L4
    mov eax, dword ptr [g_101ADFD8]
    cmp eax, edi
    je L0
    push eax
    push esi
    call sub_1010040A
    pop ecx
    pop ecx
    test eax, eax
    je L12
    mov eax, dword ptr [g_101ADFD8]
    cmp eax, edi
    je L0
    push eax
    call sub_100F8553
    pop ecx
L0:
    push esi
    call sub_100FA28A
    inc eax
    push eax
    call sub_100FC4F5
    pop ecx
    pop ecx
    mov dword ptr [g_101ADFD8], eax
    cmp eax, edi
    je L12
    push esi
    push eax
    call sub_100FE937
    pop ecx
    pop ecx
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call L13
    push 3
    push esi
    push dword ptr [g_101A4E40]
    call sub_100F5EB0
    add esp, 12
    mov eax, dword ptr [g_101A4E40]
    mov byte ptr [eax + 3], 0
    add esi, 3
    cmp byte ptr [esi], 45
    jne L1
    mov dword ptr [ebp - 32], 1
    inc esi
L1:
    push esi
    call sub_100F7489
    pop ecx
    imul eax, eax, 000000E10h
    mov dword ptr [g_101A4DB0], eax
    mov bl, 48
L2:
    mov al, byte ptr [esi]
    cmp al, 43
    je L3
    cmp al, bl
    jl L14
    cmp al, 57
    jg L14
L3:
    inc esi
    jmp L2
L4:
    mov eax, dword ptr [g_101ADFD8]
    cmp eax, edi
    je L5
    push eax
    call sub_100F85E8
    pop ecx
    mov dword ptr [g_101ADFD8], edi
L5:
    push 0101ADF28h
    call dword ptr [fp_1010C134]
    cmp eax, -1
    je L12
    xor ecx, ecx
    inc ecx
    mov dword ptr [g_101ADFD4], ecx
    mov eax, dword ptr [g_101ADF28]
    imul eax, eax, 60
    mov dword ptr [g_101A4DB0], eax
    cmp word ptr [g_101ADF6E], di
    je L6
    mov edx, dword ptr [g_101ADF7C]
    imul edx, edx, 60
    add eax, edx
    mov dword ptr [g_101A4DB0], eax
L6:
    cmp word ptr [g_101ADFC2], di
    je L7
    mov eax, dword ptr [g_101ADFD0]
    cmp eax, edi
    je L7
    mov dword ptr [g_101A4DB4], ecx
    sub eax, dword ptr [g_101ADF7C]
    imul eax, eax, 60
    mov dword ptr [g_101A4DB8], eax
    jmp L8
L7:
    mov dword ptr [g_101A4DB4], edi
    mov dword ptr [g_101A4DB8], edi
L8:
    lea eax, [ebp - 28]
    push eax
    push edi
    push 63
    push dword ptr [g_101A4E40]
    push -1
    push 0101ADF2Ch
    push edi
    push ebx
    mov esi, dword ptr [g_1010C044]
    call esi
    test eax, eax
    je L9
    cmp dword ptr [ebp - 28], edi
    jne L9
    mov eax, dword ptr [g_101A4E40]
    mov byte ptr [eax + 63], 0
    jmp L10
L9:
    mov eax, dword ptr [g_101A4E40]
    mov byte ptr [eax], 0
L10:
    lea eax, [ebp - 28]
    push eax
    push edi
    push 63
    push dword ptr [g_101A4E44]
    push -1
    push 0101ADF80h
    push edi
    push ebx
    call esi
    test eax, eax
    je L11
    cmp dword ptr [ebp - 28], edi
    jne L11
    mov eax, dword ptr [g_101A4E44]
    mov byte ptr [eax + 63], 0
    jmp L12
L11:
    mov eax, dword ptr [g_101A4E44]
    mov byte ptr [eax], 0
L12:
    push -1
    lea eax, [ebp - 16]
    push eax
    call sub_101012B1
    pop ecx
    pop ecx
    jmp sub_100FC92E
    mov esi, dword ptr [ebp - 36]
    xor edi, edi
L13:
    push 7
    call sub_100FC1D2
    pop ecx
    ret
L14:
    cmp byte ptr [esi], 58
    jne L20
    inc esi
    push esi
    call sub_100F75D7
    pop ecx
    imul eax, eax, 60
    add dword ptr [g_101A4DB0], eax
    jmp L16
L15:
    cmp al, 57
    jg L17
    inc esi
L16:
    mov al, byte ptr [esi]
    cmp al, bl
    jge L15
L17:
    cmp byte ptr [esi], 58
    jne L20
    inc esi
    push esi
    call sub_100F75FA
    pop ecx
    add dword ptr [g_101A4DB0], eax
    jmp L19
L18:
    cmp al, 57
    jg L20
    inc esi
L19:
    mov al, byte ptr [esi]
    cmp al, bl
    jge L18
L20:
    cmp dword ptr [ebp - 32], edi
    je L21
    neg dword ptr [g_101A4DB0]
L21:
    movsx eax, byte ptr [esi]
    mov dword ptr [g_101A4DB4], eax
    cmp eax, edi
    je sub_100FC98E
    push 3
    push esi
    push dword ptr [g_101A4E44]
    call sub_100F607C
    add esp, 12
    mov eax, dword ptr [g_101A4E44]
    mov byte ptr [eax + 3], 0
    jmp sub_100FC9B2
__tzset_lk ENDP
END
