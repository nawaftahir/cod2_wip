.686
.MODEL FLAT, C
EXTRN sub_10016425:PROC
EXTRN sub_1001657A:PROC
EXTRN sub_10019921:PROC
EXTRN sub_10019B51:PROC
EXTRN sub_10019E35:PROC
EXTRN sub_10019EAF:PROC
EXTRN sub_10019EE0:PROC
EXTRN sub_10019F24:PROC
EXTRN sub_1005F3D9:PROC
EXTRN sub_1005F466:PROC
EXTRN sub_1005F4B9:PROC
EXTRN sub_1005F6DD:PROC
EXTRN sub_1005FB7F:PROC
EXTRN sub_1005FC11:PROC
EXTRN EXTRN g_101AAC70:DWORD:DWORD
.CODE
FUN_10019ca0 PROC
    sub sub esp, 20
    push push ebx
    mov mov ebx, eax
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    push push ebp
    mov mov ebp, dword ptr [esp + 36]
    add add eax, 0101A66B0h
    mov mov cl, byte ptr [eax + 0404h]
    test test cl, cl
    push push esi
    push push edi
    je L0
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov byte ptr [eax + 0404h], 0
    mov mov dword ptr [ebx], ecx
    mov mov edx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], edx
    push push ebx
    mov mov eax, 1
    call sub_1005F6DD
    mov mov esi, eax
    add add esp, 4
    lea lea eax, [esp + 20]
    mov mov edx, esi
    mov mov dword ptr [esp + 16], esi
    call sub_10019921
    test test al, al
    je L2
    mov mov eax, dword ptr [esp + 40]
L0:
    cmp cmp byte ptr [eax + 5], 1
    jbe L1
    push push 0101953D8h
    call sub_1005F3D9
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor al, al
    pop pop ebx
    add add esp, 20
    ret ret
    lea lea edi, [esp + 20]
    mov mov word ptr [ebp], 0
    call sub_10016425
    pop pop edi
    xor xor ecx, ecx
    test test eax, eax
    pop pop esi
    mov mov dword ptr [ebp + 4], eax
    setne setne cl
    pop pop ebp
    mov mov al, cl
    pop pop ebx
    add add esp, 20
    ret ret
    mov mov edi, 0101953CCh
    mov mov ecx, 9
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10019E35
    mov mov eax, dword ptr [esp + 40]
    push push ebp
    push push 01018F040h
    push push edx
    push push eax
    push push ebx
    mov mov word ptr [ebp], 1
    call sub_10019B51
    add add esp, 20
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 20
    ret ret
    mov mov eax, dword ptr [esp + 16]
    mov mov edi, 010195580h
    mov mov esi, eax
    mov mov ecx, 9
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10019EE0
    mov mov eax, dword ptr [esp + 40]
    cmp cmp byte ptr [eax + 5], 1
    jbe sub_10019EAF
    push push 010195380h
    call sub_1005F466
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor al, al
L2:
    pop pop ebx
    add add esp, 20
    ret ret
    push push 1
    push push 010195640h
    mov mov ecx, ebx
    call sub_1005FC11
    add add esp, 8
    test test eax, eax
    je sub_10019F24
    mov mov ecx, ebx
    call sub_1005FB7F
    mov mov word ptr [ebp], 2
    call sub_1001657A
    pop pop edi
    xor xor ecx, ecx
    test test eax, eax
    pop pop esi
    mov mov dword ptr [ebp + 4], eax
    setne setne cl
    pop pop ebp
    mov mov al, cl
    pop pop ebx
    add add esp, 20
    ret ret
    push push eax
    push push 010195548h
    call sub_1005F4B9
    add add esp, 8
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor al, al
    pop pop ebx
    add add esp, 20
    ret ret
FUN_10019ca0 ENDP
END
