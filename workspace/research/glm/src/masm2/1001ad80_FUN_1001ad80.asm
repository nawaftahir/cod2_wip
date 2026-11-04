.686
.MODEL FLAT, C
EXTRN sub_10018463:PROC
EXTRN sub_100184B1:PROC
EXTRN sub_1001AF72:PROC
EXTRN sub_1001AFB1:PROC
EXTRN sub_1001AFCA:PROC
EXTRN sub_1001AFDB:PROC
EXTRN sub_1001AFF0:PROC
EXTRN sub_1001AFFE:PROC
EXTRN sub_1001B048:PROC
EXTRN sub_1001B05B:PROC
EXTRN sub_1005F48E:PROC
EXTRN sub_1005F4E0:PROC
EXTRN sub_1005F6E0:PROC
EXTRN sub_1005FB93:PROC
EXTRN sub_1005FBAC:PROC
EXTRN EXTRN g_101AAC70:DWORD:DWORD
.CODE
FUN_1001ad80 PROC
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    push push esi
    push push edi
    mov mov dword ptr [ebp], 0
    mov mov edi, edi
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov cl, byte ptr [eax + 0404h]
    test test cl, cl
    je L0
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov byte ptr [eax + 0404h], 0
    mov mov dword ptr [ebx], ecx
    mov mov edx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], edx
    push push ebx
    mov mov eax, 1
    call sub_1005F6E0
    add add esp, 4
    mov mov edi, 010195094h
    mov mov esi, eax
    mov mov ecx, 11
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L3
    or or dword ptr [ebp], 8
    jmp L1
    mov mov edi, 010195084h
    mov mov esi, eax
    mov mov ecx, 15
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
L1:
    jne L4
    or or dword ptr [ebp], 16
    jmp L2
    mov mov edi, 010195644h
    mov mov esi, eax
    mov mov ecx, 7
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
L2:
    jne L5
    push push 1
    push push 010195640h
    mov mov ecx, ebx
    call sub_1005FB93
    add add esp, 8
    test test eax, eax
    je sub_1001AFB1
    push push 1
    push push 0101966D4h
    mov mov ecx, ebx
    call sub_1005FBAC
    add add esp, 8
    test test eax, eax
    je sub_1001AFCA
    mov mov eax, dword ptr [ebp]
    pop pop edi
    or or eax, 2
    mov mov dword ptr [ebp], eax
    pop pop esi
    mov mov al, 1
    pop pop ebp
    ret ret
    mov mov edi, 0101950A0h
    mov mov esi, eax
    mov mov ecx, 8
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_1001AF72
    mov mov edi, dword ptr [esp + 16]
    mov mov esi, ebx
    call sub_10018463
    test test al, al
    je sub_1001AFFE
    mov mov eax, dword ptr [ebp]
    pop pop edi
    or or eax, 5
    mov mov dword ptr [ebp], eax
    pop pop esi
    mov mov al, 1
    pop pop ebp
    ret ret
    mov mov edi, 01019507Ch
    mov mov esi, eax
    mov mov ecx, 6
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_1001AFF0
    mov mov eax, dword ptr [esp + 16]
    test test eax, eax
    jne sub_1001AFDB
    push push 010195030h
    call sub_1005F48E
    add add esp, 4
    pop pop edi
    pop pop esi
    xor xor al, al
    pop pop ebp
    ret ret
    lea lea edi, [eax - 1]
    mov mov esi, ebx
    call sub_100184B1
    test test al, al
    je sub_1001B048
    mov mov eax, dword ptr [ebp]
    pop pop edi
    or or eax, 1
    mov mov dword ptr [ebp], eax
    pop pop esi
    mov mov al, 1
    pop pop ebp
    ret ret
    mov mov edi, 0101953CCh
    mov mov esi, eax
    mov mov ecx, 9
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_1001B05B
    mov mov eax, dword ptr [ebp]
    pop pop edi
    or or eax, 6
    mov mov dword ptr [ebp], eax
    pop pop esi
    mov mov al, 1
    pop pop ebp
    ret ret
    push push eax
    push push 010195008h
    call sub_1005F4E0
    add add esp, 8
    pop pop edi
    pop pop esi
    xor xor al, al
    pop pop ebp
    ret ret
FUN_1001ad80 ENDP
END
