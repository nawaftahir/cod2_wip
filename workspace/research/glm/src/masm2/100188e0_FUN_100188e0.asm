.686
.MODEL FLAT, C
EXTRN sub_10018680:PROC
EXTRN sub_10018825:PROC
EXTRN sub_10018B2D:PROC
EXTRN sub_10018B2E:PROC
EXTRN sub_10018B5B:PROC
EXTRN sub_10018B5F:PROC
EXTRN sub_10018B69:PROC
EXTRN sub_10018B81:PROC
EXTRN sub_10018BCF:PROC
EXTRN sub_10018C26:PROC
EXTRN sub_10018C66:PROC
EXTRN sub_1005F4E2:PROC
EXTRN sub_1005F504:PROC
EXTRN sub_1005F524:PROC
EXTRN sub_1005F559:PROC
EXTRN sub_1005F740:PROC
EXTRN sub_1005FB13:PROC
EXTRN sub_1005FB2C:PROC
EXTRN sub_100F8840:PROC
EXTRN EXTRN g_101AAC70:DWORD:DWORD
.CODE
FUN_100188e0 PROC
    push push ebp
    mov mov ebp, esp
    and and esp, -8
    mov mov eax, 0202Ch
    call sub_100F8840
    mov mov eax, dword ptr [ebp + 12]
    push push ebx
    mov mov ebx, dword ptr [ebp + 8]
    push push esi
    push push edi
    push push 1
    push push eax
    mov mov ecx, ebx
    call sub_1005FB13
    add add esp, 8
    test test eax, eax
    je L4
    push push 1
    push push 010195818h
    mov mov ecx, ebx
    call sub_1005FB2C
    add add esp, 8
    test test eax, eax
    je L6
    xor xor eax, eax
    mov mov ecx, 0808h
    lea lea edi, [esp + 24]
    rep stosd rep stosd dword ptr es:[edi], eax
    xor xor edi, edi
    mov mov dword ptr [esp + 20], edi
    mov mov dword ptr [esp + 12], edi
    mov mov dword ptr [esp + 16], edi
    jmp L0
    lea lea esp, [esp]
    jmp L1
    lea lea ecx, [ecx]
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov cl, byte ptr [eax + 0404h]
    test test cl, cl
    je L2
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov byte ptr [eax + 0404h], 0
    mov mov dword ptr [ebx], ecx
    mov mov edx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], edx
    push push ebx
    mov mov eax, 1
    call sub_1005F740
    mov mov esi, eax
    mov mov al, byte ptr [esi]
    add add esp, 4
    cmp cmp al, 125
    je sub_10018B2D
    mov mov eax, dword ptr [esp + 16]
    lea lea ecx, [esp + eax + 24]
    push push ecx
    push push ebx
    mov mov edx, esi
    call sub_10018680
    add add esp, 8
    test test eax, eax
    jne L5
    mov mov ecx, dword ptr [esp + 12]
    mov mov eax, dword ptr [esp + 16]
    inc inc ecx
    add add eax, 32
    mov mov dword ptr [esp + 12], ecx
    mov mov dword ptr [esp + 16], eax
    jmp sub_10018B2E
    cmp cmp eax, 2
    je sub_10018B5B
    mov mov edx, dword ptr [esp + 12]
    cmp cmp dword ptr [esp + 20], edx
    je sub_10018BCF
    mov mov ecx, dword ptr [ebp + 16]
    lea lea eax, [esp + edi + 24]
    push push eax
    push push ecx
    push push ebx
    mov mov eax, esi
    call sub_10018825
    add add esp, 12
    test test al, al
    je sub_10018B81
    mov mov ebx, dword ptr [esp + 20]
    mov mov ecx, dword ptr [esp + 12]
    inc inc ebx
    cmp cmp ebx, ecx
    jge sub_10018B5F
    lea lea edx, [esp + edi + 40]
    lea lea esi, [esp + edi + 48]
    lea lea eax, [esp + edi + 80]
    sub sub ecx, ebx
    mov mov edi, dword ptr [edx]
    mov mov dword ptr [eax - 8], edi
    mov mov edi, dword ptr [edx + 4]
    mov mov dword ptr [eax - 4], edi
    mov mov edi, dword ptr [esi]
    mov mov dword ptr [eax], edi
    mov mov edi, dword ptr [esi + 4]
    mov mov dword ptr [eax + 4], edi
    add add eax, 32
    dec dec ecx
    jne sub_10018B69
    mov mov ecx, dword ptr [esp + 12]
    mov mov edi, dword ptr [esp + 16]
    mov mov ebx, dword ptr [ebp + 8]
    mov mov dword ptr [esp + 20], ecx
    cmp cmp dword ptr [esp + 16], 02000h
    jle L7
    mov mov ecx, dword ptr [ebp + 12]
    push push 0100h
    push push ecx
    push push 010195768h
    call sub_1005F4E2
    add add esp, 12
    xor xor al, al
    pop pop edi
    pop pop esi
    pop pop ebx
L3:
    mov mov esp, ebp
    pop pop ebp
    ret ret
    mov mov eax, dword ptr [esp + 12]
    test test eax, eax
    jne sub_10018C26
    mov mov edx, dword ptr [ebp + 12]
    push push edx
    push push 0101957D0h
    call sub_1005F504
    add add esp, 8
    xor xor al, al
    pop pop edi
    pop pop esi
    pop pop ebx
    mov mov esp, ebp
    pop pop ebp
    ret ret
    cmp cmp dword ptr [esp + 20], eax
    je sub_10018C66
    mov mov eax, dword ptr [ebp + 12]
    push push eax
    push push 0101957B4h
    call sub_1005F524
L5:
    add add esp, 8
    xor xor al, al
    pop pop edi
    pop pop esi
    pop pop ebx
L6:
    mov mov esp, ebp
    pop pop ebp
    ret ret
    lea lea ecx, [esp + 24]
    push push ecx
    call L3
    mov mov edx, dword ptr [ebp + 20]
    mov mov dword ptr [edx], eax
L7:
    add add esp, 4
    mov mov al, 1
    pop pop edi
    pop pop esi
    pop pop ebx
    mov mov esp, ebp
    pop pop ebp
    ret ret
    mov mov eax, dword ptr [ebp + 12]
    push push eax
    push push 01019578Ch
    call sub_1005F559
FUN_100188e0 ENDP
END
