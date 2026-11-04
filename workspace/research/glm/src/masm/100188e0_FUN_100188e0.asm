.686
.MODEL FLAT, C
EXTRN sub_10018680:PROC
EXTRN sub_10018825:PROC
EXTRN sub_10018A6A:PROC
EXTRN sub_1005F4E2:PROC
EXTRN sub_1005F504:PROC
EXTRN sub_1005F524:PROC
EXTRN sub_1005F559:PROC
EXTRN sub_1005F740:PROC
EXTRN sub_1005FB13:PROC
EXTRN sub_1005FB2C:PROC
EXTRN sub_100F8840:PROC
EXTRN g_101AAC70:DWORD
.CODE
FUN_100188e0 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF8h
    mov eax, 00000202Ch
    call sub_100F8840
    mov eax, dword ptr [ebp + 12]
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push esi
    push edi
    push 1
    push eax
    mov ecx, ebx
    call sub_1005FB13
    add esp, 8
    test eax, eax
    je L6
    push 1
    push 010195818h
    mov ecx, ebx
    call sub_1005FB2C
    add esp, 8
    test eax, eax
    je L6
    xor eax, eax
    mov ecx, 000000808h
    lea edi, [esp + 24]
    rep stosd dword ptr es:[edi], eax
    xor edi, edi
    mov dword ptr [esp + 20], edi
    mov dword ptr [esp + 12], edi
    mov dword ptr [esp + 16], edi
    jmp L0
    lea esp, [esp]
    jmp L0
    lea ecx, [ecx]
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
    call sub_1005F740
    mov esi, eax
    mov al, byte ptr [esi]
    add esp, 4
    cmp al, 125
    je L7
    mov eax, dword ptr [esp + 16]
    lea ecx, [esp + eax + 24]
    push ecx
    push ebx
    mov edx, esi
    call sub_10018680
    add esp, 8
    test eax, eax
    jne L2
    mov ecx, dword ptr [esp + 12]
    mov eax, dword ptr [esp + 16]
    inc ecx
    add eax, 32
    mov dword ptr [esp + 12], ecx
    mov dword ptr [esp + 16], eax
    jmp L5
L2:
    cmp eax, 2
    je L6
    mov edx, dword ptr [esp + 12]
    cmp dword ptr [esp + 20], edx
    je L10
    mov ecx, dword ptr [ebp + 16]
    lea eax, [esp + edi + 24]
    push eax
    push ecx
    push ebx
    mov eax, esi
    call sub_10018825
    add esp, 12
    test al, al
    je L6
    mov ebx, dword ptr [esp + 20]
    mov ecx, dword ptr [esp + 12]
    inc ebx
    cmp ebx, ecx
    jge L4
    lea edx, [esp + edi + 40]
    lea esi, [esp + edi + 48]
    lea eax, [esp + edi + 80]
    sub ecx, ebx
L3:
    mov edi, dword ptr [edx]
    mov dword ptr [eax - 8], edi
    mov edi, dword ptr [edx + 4]
    mov dword ptr [eax - 4], edi
    mov edi, dword ptr [esi]
    mov dword ptr [eax], edi
    mov edi, dword ptr [esi + 4]
    mov dword ptr [eax + 4], edi
    add eax, 32
    dec ecx
    jne L3
    mov ecx, dword ptr [esp + 12]
L4:
    mov edi, dword ptr [esp + 16]
    mov ebx, dword ptr [ebp + 8]
    mov dword ptr [esp + 20], ecx
L5:
    cmp dword ptr [esp + 16], 000002000h
    jle L0
    mov ecx, dword ptr [ebp + 12]
    push 000000100h
    push ecx
    push 010195768h
    call sub_1005F4E2
    add esp, 12
L6:
    xor al, al
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
L7:
    mov eax, dword ptr [esp + 12]
    test eax, eax
    jne L8
    mov edx, dword ptr [ebp + 12]
    push edx
    push 0101957D0h
    call sub_1005F504
    add esp, 8
    xor al, al
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
L8:
    cmp dword ptr [esp + 20], eax
    je L9
    mov eax, dword ptr [ebp + 12]
    push eax
    push 0101957B4h
    call sub_1005F524
    add esp, 8
    xor al, al
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
L9:
    lea ecx, [esp + 24]
    push ecx
    call sub_10018A6A
    mov edx, dword ptr [ebp + 20]
    mov dword ptr [edx], eax
    add esp, 4
    mov al, 1
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
L10:
    mov eax, dword ptr [ebp + 12]
    push eax
    push 01019578Ch
    call sub_1005F559
FUN_100188e0 ENDP
END
