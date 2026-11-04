.686
.MODEL FLAT, C
EXTRN sub_1001851C:PROC
EXTRN sub_100185E4:PROC
EXTRN sub_1005F48E:PROC
EXTRN sub_1005F4AD:PROC
EXTRN sub_1005F72E:PROC
EXTRN sub_1005F797:PROC
EXTRN sub_1005FB17:PROC
EXTRN g_101AAC70:DWORD
.CODE
FUN_100185b0 PROC
    push ebp
    mov ebp, dword ptr [esp + 8]
    push esi
    push edi
    mov edi, 010192F58h
    mov esi, edx
    mov ecx, 8
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L0
    push 1
    push 010195880h
    mov ecx, ebp
    call sub_1005FB17
    add esp, 8
    test eax, eax
    setne al
    xor ecx, ecx
    test al, al
    setne cl
    pop edi
    pop esi
    pop ebp
    dec ecx
    and ecx, 2
    mov eax, ecx
    ret
L0:
    mov eax, dword ptr [esp + 20]
    push ebx
    push eax
    push ebp
    call sub_1001851C
    xor ebx, ebx
    add esp, 8
    cmp eax, ebx
    jne L7
    lea esp, [esp]
L1:
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    cmp byte ptr [eax + 000000404h], bl
    je L2
    mov ecx, dword ptr [eax + 000000418h]
    mov byte ptr [eax + 000000404h], bl
    mov dword ptr [ebp], ecx
    mov edx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], edx
L2:
    push ebp
    mov eax, 1
    call sub_1005F72E
    add esp, 4
    mov edi, 010195880h
    mov esi, eax
    mov ecx, 2
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L4
    mov edi, 01019587Ch
    mov esi, eax
    mov ecx, 3
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L5
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    cmp byte ptr [eax + 000000404h], bl
    je L3
    mov ecx, dword ptr [eax + 000000418h]
    mov byte ptr [eax + 000000404h], bl
    mov dword ptr [ebp], ecx
    mov edx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], edx
L3:
    push ebp
    mov eax, 1
    call sub_1005F797
    mov ecx, dword ptr [esp + 28]
    push ecx
    push ebp
    mov edx, eax
    call sub_100185E4
    add esp, 12
    cmp eax, ebx
    je L1
    cmp eax, 1
    jne L6
    push 010195854h
    call sub_1005F48E
    add esp, 4
    pop ebx
    pop edi
    pop esi
    mov eax, 2
    pop ebp
    ret
L4:
    pop ebx
    pop edi
    pop esi
    xor eax, eax
    pop ebp
    ret
L5:
    push eax
    push 010195830h
    call sub_1005F4AD
    add esp, 8
L6:
    mov eax, 2
L7:
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
FUN_100185b0 ENDP
END
