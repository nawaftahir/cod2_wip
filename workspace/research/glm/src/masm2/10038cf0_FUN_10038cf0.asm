.686
.MODEL FLAT, C
EXTRN sub_10038F70:PROC
EXTRN sub_10038F77:PROC
EXTRN sub_10038F89:PROC
EXTRN sub_10038F8F:PROC
EXTRN sub_10038F92:PROC
EXTRN sub_10038FA3:PROC
EXTRN sub_10038FD9:PROC
EXTRN sub_10038FF3:PROC
EXTRN sub_10039012:PROC
EXTRN sub_10039031:PROC
EXTRN sub_10039055:PROC
EXTRN sub_1003906B:PROC
EXTRN sub_10039076:PROC
EXTRN sub_1003908C:PROC
EXTRN sub_100390A7:PROC
EXTRN sub_100390BD:PROC
EXTRN sub_1003911B:PROC
EXTRN sub_10039150:PROC
EXTRN sub_10039153:PROC
EXTRN sub_1003916C:PROC
EXTRN sub_10039178:PROC
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
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_10730550:DWORD:DWORD
.CODE
FUN_10038cf0 PROC
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    push push esi
    push push edi
    mov mov edi, dword ptr [g_10730550]
    imul imul edi, edi, 0CD0h
    mov mov eax, ebp
    and and eax, -4
    add add eax, 0FFFFFF44h
    add add edi, 01072DEE0h
    cmp cmp eax, 44
    ja sub_10038F92
    movzx movzx ecx, byte ptr [eax + 010038FA0h]
    mov mov ebx, 1
    jmp jmp dword ptr [ecx*4 + 010038F6Ch]
    lea lea esi, [edi + 16]
    jmp L4
    lea lea esi, [edi + 0230h]
    jmp L5
    lea lea esi, [edi + 0340h]
    jmp L6
    mov mov al, byte ptr [edi + 0550h]
    test test al, al
    lea lea esi, [edi + 0450h]
    jne L7
    lea lea eax, [edi + 0230h]
    lea lea ecx, [edi + 16]
    mov mov edx, esi
    call sub_1005A902
    jmp L8
    mov mov al, byte ptr [edi + 0770h]
    test test al, al
    lea lea esi, [edi + 0670h]
    jne sub_10038F77
    lea lea eax, [edi + 0340h]
    lea lea ecx, [edi + 0230h]
    mov mov edx, esi
    call sub_1005A92E
    jmp sub_10038F89
    mov mov al, byte ptr [edi + 0880h]
    test test al, al
    lea lea esi, [edi + 0780h]
    jne sub_10038FA3
    mov mov al, byte ptr [edi + 0550h]
    test test al, al
    jne L2
    lea lea edx, [edi + 0450h]
    lea lea eax, [edi + 0230h]
    lea lea ecx, [edi + 16]
    call sub_1005A965
    mov mov byte ptr [edi + 0550h], bl
    lea lea eax, [edi + 0340h]
    lea lea ecx, [edi + 0450h]
    mov mov edx, esi
    call sub_1005A97E
    jmp sub_10038FD9
    mov mov al, byte ptr [edi + 0220h]
    test test al, al
    lea lea esi, [edi + 0120h]
    jne sub_10038FF3
    push push 4
    push push 0
    push push 0BCh
    jmp sub_10038F70
    mov mov al, byte ptr [edi + 0660h]
    test test al, al
    lea lea esi, [edi + 0560h]
    jne sub_10039012
    push push 4
    push push 0
    push push 0C8h
    jmp sub_10038F8F
    mov mov al, byte ptr [edi + 0660h]
    test test al, al
    lea lea esi, [edi + 0560h]
    jne sub_10039031
    push push 4
    push push 0
    push push 0D0h
    call L1
L1:
    fld fld dword ptr [g_1019BC78]
    fdiv fdiv dword ptr [edi]
    mov mov ecx, eax
    add add esp, 8
    mov mov eax, esi
    fstp fstp dword ptr [esp]
    call L0
    add add esp, 4
    jmp sub_10039055
    mov mov al, byte ptr [edi + 0AA0h]
    test test al, al
    lea lea esi, [edi + 09A0h]
    jne sub_1003906B
    lea lea ecx, [edi + 16]
    mov mov edx, esi
    mov mov eax, 010764518h
    call sub_1005AA1E
    jmp sub_10039076
    mov mov al, byte ptr [edi + 0BB0h]
    test test al, al
    lea lea esi, [edi + 0AB0h]
    jne sub_1003908C
    push push 4
    push push 0
    push push 0BFh
    call L3
L3:
    mov mov ecx, eax
    add add esp, 12
    mov mov edx, esi
    mov mov eax, 010190600h
    call sub_1005AA4F
    jmp sub_100390A7
    mov mov al, byte ptr [edi + 0CC0h]
    test test al, al
    lea lea esi, [edi + 0BC0h]
    jne sub_100390BD
    call sub_100391B6
    mov mov byte ptr [esi + 0100h], bl
    and and ebp, 3
    mov mov edi, ebp
    mov mov al, byte ptr [edi + esi + 0100h]
    test test al, al
    jne sub_10039150
    xor xor ebp, 2
    mov mov al, byte ptr [esi + ebp + 0100h]
    test test al, al
    mov mov eax, edi
    je sub_1003911B
    mov mov ecx, ebp
    shl shl eax, 6
    shl shl ecx, 6
    add add eax, esi
    add add ecx, esi
    call sub_1005ACED
    jmp sub_1003916C
    xor xor eax, ebx
    mov mov cl, byte ptr [eax + esi + 0100h]
    test test cl, cl
    mov mov ecx, edi
    je sub_10039153
    shl shl eax, 6
    add add eax, esi
    jmp sub_10039178
    xor xor ecx, 3
    mov mov edx, ebp
    shl shl edx, 6
    shl shl ecx, 6
    lea lea eax, [edx + esi]
    add add ecx, esi
    call sub_1005AD1A
L6:
    mov mov byte ptr [esi + ebp + 0100h], bl
    mov mov ecx, edi
    shl shl ecx, 6
    add add ecx, esi
    call sub_1005AF5D
    mov mov byte ptr [edi + esi + 0100h], bl
    mov mov eax, dword ptr [esp + 24]
    lea lea eax, [eax + edi*4]
    pop pop edi
    shl shl eax, 4
    add add eax, esi
    pop pop esi
    pop pop ebp
    pop pop ebx
    ret ret
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor eax, eax
    pop pop ebx
    ret ret
FUN_10038cf0 ENDP
END
