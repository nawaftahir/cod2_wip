.686
.MODEL FLAT, C
EXTRN sub_100164EF:PROC
EXTRN sub_1001955F:PROC
EXTRN sub_1005F42A:PROC
EXTRN sub_1005F6D7:PROC
EXTRN sub_1005FAF4:PROC
EXTRN sub_1005FB86:PROC
EXTRN g_101AAC70:DWORD
.CODE
FUN_10019620 PROC
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    push ebp
    mov ebp, dword ptr [esp + 8]
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
    call sub_1005F6D7
    add esp, 4
    mov edi, 01019558Ch
    mov esi, eax
    mov ecx, 8
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L1
    push ebp
    push 01018EC38h
    push edx
    push ebx
    mov word ptr [ebp], 3
    call sub_1001955F
    add esp, 16
    pop edi
    pop esi
    pop ebp
    ret
L1:
    mov edi, 010195580h
    mov esi, eax
    mov ecx, 9
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L2
    push 1
    push 010195640h
    mov ecx, ebx
    call sub_1005FB86
    add esp, 8
    test eax, eax
    je L3
    mov ecx, ebx
    call sub_1005FAF4
    mov word ptr [ebp], 4
    call sub_100164EF
    xor ecx, ecx
    test eax, eax
    pop edi
    mov dword ptr [ebp + 4], eax
    setne cl
    pop esi
    mov al, cl
    pop ebp
    ret
L2:
    push eax
    push 010195548h
    call sub_1005F42A
    add esp, 8
L3:
    pop edi
    pop esi
    xor al, al
    pop ebp
    ret
FUN_10019620 ENDP
END
