.686
.MODEL FLAT, C
EXTRN sub_10038DDA:PROC
EXTRN sub_100391B6:PROC
EXTRN sub_1005A902:PROC
EXTRN sub_1005A92E:PROC
EXTRN sub_1005A965:PROC
EXTRN sub_1005A97E:PROC
EXTRN sub_1005AA1E:PROC
EXTRN sub_1005AA4F:PROC
EXTRN sub_1005ACED:PROC
EXTRN sub_1005AD1A:PROC
EXTRN sub_1005AF5D:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_10730550:DWORD
.CODE
FUN_10038cf0 PROC
L0:
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 12]
    push esi
    push edi
    mov edi, dword ptr [g_10730550]
    imul edi, edi, 000000CD0h
    mov eax, ebp
    and eax, 0FFFFFFFCh
    add eax, 0FFFFFF44h
    add edi, 01072DEE0h
    cmp eax, 44
    ja L10
    movzx ecx, byte ptr [eax + 010038FA0h]
    mov ebx, 1
    jmp dword ptr [ecx*4 + 0x10038f6c]
    lea esi, [edi + 16]
    jmp L4
    lea esi, [edi + 000000230h]
    jmp L4
    lea esi, [edi + 000000340h]
    jmp L4
    mov al, byte ptr [edi + 000000550h]
    test al, al
    lea esi, [edi + 000000450h]
    jne L4
    lea eax, [edi + 000000230h]
    lea ecx, [edi + 16]
    mov edx, esi
    call sub_1005A902
    jmp L3
    mov al, byte ptr [edi + 000000770h]
    test al, al
    lea esi, [edi + 000000670h]
    jne L4
    lea eax, [edi + 000000340h]
    lea ecx, [edi + 000000230h]
    mov edx, esi
    call sub_1005A92E
    jmp L3
    mov al, byte ptr [edi + 000000880h]
    test al, al
    lea esi, [edi + 000000780h]
    jne L4
    mov al, byte ptr [edi + 000000550h]
    test al, al
    jne L1
    lea edx, [edi + 000000450h]
    lea eax, [edi + 000000230h]
    lea ecx, [edi + 16]
    call sub_1005A965
    mov byte ptr [edi + 000000550h], bl
L1:
    lea eax, [edi + 000000340h]
    lea ecx, [edi + 000000450h]
    mov edx, esi
    call sub_1005A97E
    jmp L3
    mov al, byte ptr [edi + 000000220h]
    test al, al
    lea esi, [edi + 000000120h]
    jne L4
    push 4
    push 0
    push 0000000BCh
    jmp L2
    mov al, byte ptr [edi + 000000660h]
    test al, al
    lea esi, [edi + 000000560h]
    jne L4
    push 4
    push 0
    push 0000000C8h
    jmp L2
    mov al, byte ptr [edi + 000000660h]
    test al, al
    lea esi, [edi + 000000560h]
    jne L4
    push 4
    push 0
    push 0000000D0h
L2:
    call L0
    fld dword ptr [g_1019BC78]
    fdiv dword ptr [edi]
    mov ecx, eax
    add esp, 8
    mov eax, esi
    fstp dword ptr [esp]
    call sub_10038DDA
    add esp, 4
    jmp L3
    mov al, byte ptr [edi + 000000AA0h]
    test al, al
    lea esi, [edi + 0000009A0h]
    jne L4
    lea ecx, [edi + 16]
    mov edx, esi
    mov eax, 010764518h
    call sub_1005AA1E
    jmp L3
    mov al, byte ptr [edi + 000000BB0h]
    test al, al
    lea esi, [edi + 000000AB0h]
    jne L4
    push 4
    push 0
    push 0000000BFh
    call L0
    mov ecx, eax
    add esp, 12
    mov edx, esi
    mov eax, 010190600h
    call sub_1005AA4F
    jmp L3
    mov al, byte ptr [edi + 000000CC0h]
    test al, al
    lea esi, [edi + 000000BC0h]
    jne L4
    call sub_100391B6
L3:
    mov byte ptr [esi + 000000100h], bl
L4:
    and ebp, 3
    mov edi, ebp
    mov al, byte ptr [edi + esi + 000000100h]
    test al, al
    jne L9
    xor ebp, 2
    mov al, byte ptr [esi + ebp + 000000100h]
    test al, al
    mov eax, edi
    je L5
    mov ecx, ebp
    shl eax, 6
    shl ecx, 6
    add eax, esi
    add ecx, esi
    call sub_1005ACED
    jmp L8
L5:
    xor eax, ebx
    mov cl, byte ptr [eax + esi + 000000100h]
    test cl, cl
    mov ecx, edi
    je L6
    shl eax, 6
    add eax, esi
    jmp L7
L6:
    xor ecx, 3
    mov edx, ebp
    shl edx, 6
    shl ecx, 6
    lea eax, [edx + esi]
    add ecx, esi
    call sub_1005AD1A
    mov byte ptr [esi + ebp + 000000100h], bl
    mov ecx, edi
L7:
    shl ecx, 6
    add ecx, esi
    call sub_1005AF5D
L8:
    mov byte ptr [edi + esi + 000000100h], bl
L9:
    mov eax, dword ptr [esp + 24]
    lea eax, [eax + edi*4]
    pop edi
    shl eax, 4
    add eax, esi
    pop esi
    pop ebp
    pop ebx
    ret
L10:
    pop edi
    pop esi
    pop ebp
    xor eax, eax
    pop ebx
    ret
FUN_10038cf0 ENDP
END
