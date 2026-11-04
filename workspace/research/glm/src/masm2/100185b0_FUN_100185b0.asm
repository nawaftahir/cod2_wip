.686
.MODEL FLAT, C
EXTRN sub_1001851C:PROC
EXTRN sub_1001872F:PROC
EXTRN sub_1001875E:PROC
EXTRN sub_1001878D:PROC
EXTRN sub_100187A2:PROC
EXTRN sub_100187BB:PROC
EXTRN sub_10018824:PROC
EXTRN sub_1005F48E:PROC
EXTRN sub_1005F4AD:PROC
EXTRN sub_1005F72E:PROC
EXTRN sub_1005F797:PROC
EXTRN sub_1005FB17:PROC
EXTRN EXTRN g_101AAC70:DWORD:DWORD
.CODE
FUN_100185b0 PROC
    push push ebp
    mov mov ebp, dword ptr [esp + 8]
    push push esi
    push push edi
    mov mov edi, 010192F58h
    mov mov esi, edx
    mov mov ecx, 8
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L1
    push push 1
    push push 010195880h
    mov mov ecx, ebp
    call sub_1005FB17
    add add esp, 8
    test test eax, eax
    setne setne al
    xor xor ecx, ecx
    test test al, al
    setne setne cl
    pop pop edi
    pop pop esi
    pop pop ebp
    dec dec ecx
    and and ecx, 2
    mov mov eax, ecx
    ret ret
    mov mov eax, dword ptr [esp + 20]
    push push ebx
    push push eax
    push push ebp
    call sub_1001851C
    xor xor ebx, ebx
    add add esp, 8
    cmp cmp eax, ebx
    jne sub_1001875E
L1:
    lea lea esp, [esp]
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    cmp cmp byte ptr [eax + 0404h], bl
    je L2
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov byte ptr [eax + 0404h], bl
    mov mov dword ptr [ebp], ecx
    mov mov edx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], edx
    push push ebp
    mov mov eax, 1
    call sub_1005F72E
    add add esp, 4
    mov mov edi, 010195880h
    mov mov esi, eax
    mov mov ecx, 2
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100187A2
    mov mov edi, 01019587Ch
    mov mov esi, eax
    mov mov ecx, 3
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100187BB
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    cmp cmp byte ptr [eax + 0404h], bl
    je sub_1001878D
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov byte ptr [eax + 0404h], bl
    mov mov dword ptr [ebp], ecx
    mov mov edx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], edx
    push push ebp
    mov mov eax, 1
    call sub_1005F797
    mov mov ecx, dword ptr [esp + 28]
L2:
    push push ecx
    push push ebp
    mov mov edx, eax
    call L0
    add add esp, 12
    cmp cmp eax, ebx
    je sub_1001872F
    cmp cmp eax, 1
    jne sub_10018824
    push push 010195854h
    call sub_1005F48E
    add add esp, 4
    pop pop ebx
    pop pop edi
    pop pop esi
    mov mov eax, 2
    pop pop ebp
    ret ret
    pop pop ebx
    pop pop edi
    pop pop esi
    xor xor eax, eax
    pop pop ebp
    ret ret
    push push eax
    push push 010195830h
    call sub_1005F4AD
    add add esp, 8
    mov mov eax, 2
    pop pop ebx
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
FUN_100185b0 ENDP
END
