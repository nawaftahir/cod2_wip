.686
.MODEL FLAT, C
EXTRN sub_10018463:PROC
EXTRN sub_100184B1:PROC
EXTRN sub_1005F48E:PROC
EXTRN sub_1005F4E0:PROC
EXTRN sub_1005F6E0:PROC
EXTRN sub_1005FB93:PROC
EXTRN sub_1005FBAC:PROC
EXTRN g_101AAC70:DWORD
.CODE
FUN_1001ad80 PROC
    push ebp
    mov ebp, dword ptr [esp + 12]
    push esi
    push edi
    mov dword ptr [ebp], 0
    mov edi, edi
L0:
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov cl, byte ptr [eax + 000000404h]
    test cl, cl
    je L1
    mov ecx, dword ptr [eax + 000000418h]
    mov byte ptr [eax + 000000404h], 0
    mov dword ptr [ebx], ecx
    mov edx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], edx
L1:
    push ebx
    mov eax, 1
    call sub_1005F6E0
    add esp, 4
    mov edi, 010195094h
    mov esi, eax
    mov ecx, 11
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L2
    or dword ptr [ebp], 8
    jmp L0
L2:
    mov edi, 010195084h
    mov esi, eax
    mov ecx, 15
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L3
    or dword ptr [ebp], 16
    jmp L0
L3:
    mov edi, 010195644h
    mov esi, eax
    mov ecx, 7
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L4
    push 1
    push 010195640h
    mov ecx, ebx
    call sub_1005FB93
    add esp, 8
    test eax, eax
    je L9
    push 1
    push 0101966D4h
    mov ecx, ebx
    call sub_1005FBAC
    add esp, 8
    test eax, eax
    je L9
    mov eax, dword ptr [ebp]
    pop edi
    or eax, 2
    mov dword ptr [ebp], eax
    pop esi
    mov al, 1
    pop ebp
    ret
L4:
    mov edi, 0101950A0h
    mov esi, eax
    mov ecx, 8
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L5
    mov edi, dword ptr [esp + 16]
    mov esi, ebx
    call sub_10018463
    test al, al
    je L9
    mov eax, dword ptr [ebp]
    pop edi
    or eax, 5
    mov dword ptr [ebp], eax
    pop esi
    mov al, 1
    pop ebp
    ret
L5:
    mov edi, 01019507Ch
    mov esi, eax
    mov ecx, 6
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L7
    mov eax, dword ptr [esp + 16]
    test eax, eax
    jne L6
    push 010195030h
    call sub_1005F48E
    add esp, 4
    pop edi
    pop esi
    xor al, al
    pop ebp
    ret
L6:
    lea edi, [eax - 1]
    mov esi, ebx
    call sub_100184B1
    test al, al
    je L9
    mov eax, dword ptr [ebp]
    pop edi
    or eax, 1
    mov dword ptr [ebp], eax
    pop esi
    mov al, 1
    pop ebp
    ret
L7:
    mov edi, 0101953CCh
    mov esi, eax
    mov ecx, 9
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L8
    mov eax, dword ptr [ebp]
    pop edi
    or eax, 6
    mov dword ptr [ebp], eax
    pop esi
    mov al, 1
    pop ebp
    ret
L8:
    push eax
    push 010195008h
    call sub_1005F4E0
    add esp, 8
L9:
    pop edi
    pop esi
    xor al, al
    pop ebp
    ret
FUN_1001ad80 ENDP
END
