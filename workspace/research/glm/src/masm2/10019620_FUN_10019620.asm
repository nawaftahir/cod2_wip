.686
.MODEL FLAT, C
EXTRN sub_100164EF:PROC
EXTRN sub_1001955F:PROC
EXTRN sub_10019767:PROC
EXTRN sub_1001978A:PROC
EXTRN sub_1005F42A:PROC
EXTRN sub_1005F6D7:PROC
EXTRN sub_1005FAF4:PROC
EXTRN sub_1005FB86:PROC
EXTRN EXTRN g_101AAC70:DWORD:DWORD
.CODE
FUN_10019620 PROC
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    push push ebp
    mov mov ebp, dword ptr [esp + 8]
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
    call sub_1005F6D7
    add add esp, 4
    mov mov edi, 01019558Ch
    mov mov esi, eax
    mov mov ecx, 8
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L1
    push push ebp
L0:
    push push 01018EC38h
    push push edx
    push push ebx
    mov mov word ptr [ebp], 3
    call sub_1001955F
    add add esp, 16
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
    mov mov edi, 010195580h
    mov mov esi, eax
    mov mov ecx, 9
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10019767
    push push 1
    push push 010195640h
    mov mov ecx, ebx
    call sub_1005FB86
    add add esp, 8
    test test eax, eax
    je sub_1001978A
    mov mov ecx, ebx
    call sub_1005FAF4
    mov mov word ptr [ebp], 4
    call sub_100164EF
    xor xor ecx, ecx
    test test eax, eax
    pop pop edi
    mov mov dword ptr [ebp + 4], eax
    setne setne cl
    pop pop esi
    mov mov al, cl
    pop pop ebp
    ret ret
    push push eax
    push push 010195548h
    call sub_1005F42A
    add add esp, 8
    pop pop edi
    pop pop esi
    xor xor al, al
    pop pop ebp
L1:
    ret ret
FUN_10019620 ENDP
END
