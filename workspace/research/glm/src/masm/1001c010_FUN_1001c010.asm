.686
.MODEL FLAT, C
EXTRN sub_1001BF89:PROC
EXTRN sub_1001BFB4:PROC
EXTRN sub_1005F18F:PROC
EXTRN sub_1005F537:PROC
EXTRN sub_1005F547:PROC
EXTRN sub_1005F7D6:PROC
EXTRN sub_1005FC7D:PROC
EXTRN sub_10060C40:PROC
EXTRN sub_10061CD2:PROC
EXTRN sub_10061ED1:PROC
EXTRN fp_101D49D4:DWORD
EXTRN fp_101D4AFC:DWORD
EXTRN fp_101D4B00:DWORD
EXTRN g_101AAC70:DWORD
EXTRN g_101CE708:DWORD
.CODE
FUN_1001c010 PROC
    sub esp, 0000000D0h
    push ebx
    mov ebx, eax
    mov eax, dword ptr [g_101CE708]
    cmp dword ptr [eax + 8], 2
    push esi
    push edi
    mov eax, 010194AF0h
    je L0
    mov eax, 010194ACCh
L0:
    push ebx
    push eax
    mov esi, 64
    lea edi, [esp + 28]
    call sub_10060C40
    lea ecx, [esp + 24]
    push ecx
    mov edx, edi
    push edx
    call dword ptr [fp_101D4AFC]
    add esp, 16
    test eax, eax
    jge L1
    mov eax, edi
    push eax
    push 010194AA0h
    call sub_10061CD2
    add esp, 8
    pop edi
    pop esi
    xor eax, eax
    pop ebx
    add esp, 0000000D0h
    ret
L1:
    mov eax, ebx
    lea edx, [eax + 1]
L2:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L2
    sub eax, edx
    lea esi, [eax + 1]
    lea ecx, [esi + 00000008Ch]
    push ebp
    push ecx
    call dword ptr [fp_101D49D4]
    mov ecx, esi
    mov edx, ecx
    mov ebp, eax
    shr ecx, 2
    lea edi, [ebp + 00000008Ch]
    mov dword ptr [ebp], edi
    mov esi, ebx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov eax, dword ptr [esp + 24]
    lea ecx, [esp + 28]
    push ecx
    mov dword ptr [esp + 24], eax
    call sub_1005F18F
    mov edx, dword ptr [g_101AAC70]
    imul edx, edx, 00000045Ch
    mov dword ptr [edx + 0101A6AC0h], 0101956FCh
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    mov byte ptr [eax + 0101A6AB5h], 0
    mov ecx, dword ptr [g_101AAC70]
    imul ecx, ecx, 00000045Ch
    add esp, 8
    xor esi, esi
    mov byte ptr [ecx + 0101A6AB6h], 1
    xor bl, bl
    jmp L3
    lea esp, [esp]
    lea ebx, [ebx]
L3:
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov cl, byte ptr [eax + 000000404h]
    test cl, cl
    je L4
    mov edx, dword ptr [eax + 000000418h]
    mov ecx, dword ptr [eax + 000000414h]
    mov byte ptr [eax + 000000404h], 0
    mov dword ptr [esp + 16], edx
    mov dword ptr [eax + 000000400h], ecx
L4:
    lea edx, [esp + 16]
    push edx
    mov eax, 1
    call sub_1005F7D6
    mov edi, eax
    mov al, byte ptr [edi]
    add esp, 4
    test al, al
    je L13
    cmp al, 34
    jne L7
    cmp esi, 34
    je L10
    push edi
    call sub_1001BFB4
    add esp, 4
    cmp eax, 34
    mov dword ptr [esp + esi*4 + 88], eax
    je L11
    mov cl, byte ptr [eax + 01018EB34h]
    test cl, cl
    je L5
    mov bl, 1
L5:
    push 1
    inc esi
    push 010195880h
L6:
    lea ecx, [esp + 24]
    call sub_1005FC7D
    add esp, 8
    test eax, eax
    jne L3
    jmp L12
L7:
    test esi, esi
    je L11
    test bl, bl
    je L9
    mov eax, edi
    call sub_1001BF89
    test eax, eax
    je L12
    xor ecx, ecx
    test esi, esi
    jle L9
L8:
    mov edx, dword ptr [esp + ecx*4 + 88]
    inc ecx
    cmp ecx, esi
    mov dword ptr [ebp + edx*4 + 4], eax
    jl L8
L9:
    push 1
    xor esi, esi
    xor bl, bl
    push 010195820h
    jmp L6
L10:
    push 010194A7Ch
    call sub_1005F537
    add esp, 4
    jmp L12
L11:
    push edi
    push 010194A5Ch
    call sub_1005F547
    add esp, 8
L12:
    xor ebp, ebp
L13:
    mov eax, dword ptr [g_101AAC70]
    test eax, eax
    jne L14
    push 01019B958h
    push 0
    call sub_10061ED1
    add esp, 8
L14:
    mov edx, dword ptr [g_101AAC70]
    mov eax, dword ptr [esp + 20]
    dec edx
    push eax
    mov dword ptr [g_101AAC70], edx
    call dword ptr [fp_101D4B00]
    add esp, 4
FUN_1001c010 ENDP
END
