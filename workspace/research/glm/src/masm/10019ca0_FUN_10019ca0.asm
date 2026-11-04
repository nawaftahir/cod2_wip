.686
.MODEL FLAT, C
EXTRN sub_10016425:PROC
EXTRN sub_1001657A:PROC
EXTRN sub_10019921:PROC
EXTRN sub_10019B51:PROC
EXTRN sub_1005F3D9:PROC
EXTRN sub_1005F466:PROC
EXTRN sub_1005F4B9:PROC
EXTRN sub_1005F6DD:PROC
EXTRN sub_1005FB7F:PROC
EXTRN sub_1005FC11:PROC
EXTRN g_101AAC70:DWORD
.CODE
FUN_10019ca0 PROC
    sub esp, 20
    push ebx
    mov ebx, eax
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    push ebp
    mov ebp, dword ptr [esp + 36]
    add eax, 0101A66B0h
    mov cl, byte ptr [eax + 000000404h]
    test cl, cl
    push esi
    push edi
    je L0
    mov ecx, dword ptr [eax + 000000418h]
    mov byte ptr [eax + 000000404h], 0
    mov dword ptr [ebx], ecx
    mov edx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], edx
L0:
    push ebx
    mov eax, 1
    call sub_1005F6DD
    mov esi, eax
    add esp, 4
    lea eax, [esp + 20]
    mov edx, esi
    mov dword ptr [esp + 16], esi
    call sub_10019921
    test al, al
    je L2
    mov eax, dword ptr [esp + 40]
    cmp byte ptr [eax + 5], 1
    jbe L1
    push 0101953D8h
    call sub_1005F3D9
    add esp, 4
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    add esp, 20
    ret
L1:
    lea edi, [esp + 20]
    mov word ptr [ebp], 0
    call sub_10016425
    pop edi
    xor ecx, ecx
    test eax, eax
    pop esi
    mov dword ptr [ebp + 4], eax
    setne cl
    pop ebp
    mov al, cl
    pop ebx
    add esp, 20
    ret
L2:
    mov edi, 0101953CCh
    mov ecx, 9
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L3
    mov eax, dword ptr [esp + 40]
    push ebp
    push 01018F040h
    push edx
    push eax
    push ebx
    mov word ptr [ebp], 1
    call sub_10019B51
    add esp, 20
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 20
    ret
L3:
    mov eax, dword ptr [esp + 16]
    mov edi, 010195580h
    mov esi, eax
    mov ecx, 9
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L5
    mov eax, dword ptr [esp + 40]
    cmp byte ptr [eax + 5], 1
    jbe L4
    push 010195380h
    call sub_1005F466
    add esp, 4
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    add esp, 20
    ret
L4:
    push 1
    push 010195640h
    mov ecx, ebx
    call sub_1005FC11
    add esp, 8
    test eax, eax
    je L6
    mov ecx, ebx
    call sub_1005FB7F
    mov word ptr [ebp], 2
    call sub_1001657A
    pop edi
    xor ecx, ecx
    test eax, eax
    pop esi
    mov dword ptr [ebp + 4], eax
    setne cl
    pop ebp
    mov al, cl
    pop ebx
    add esp, 20
    ret
L5:
    push eax
    push 010195548h
    call sub_1005F4B9
    add esp, 8
L6:
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    add esp, 20
    ret
FUN_10019ca0 ENDP
END
