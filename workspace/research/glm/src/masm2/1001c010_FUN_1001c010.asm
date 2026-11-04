.686
.MODEL FLAT, C
EXTRN sub_1001BF89:PROC
EXTRN sub_1001BFB4:PROC
EXTRN sub_1001C261:PROC
EXTRN sub_1001C2A8:PROC
EXTRN sub_1001C303:PROC
EXTRN sub_1001C306:PROC
EXTRN sub_1001C33B:PROC
EXTRN sub_1001C351:PROC
EXTRN sub_1001C35C:PROC
EXTRN sub_1001C361:PROC
EXTRN sub_1001C372:PROC
EXTRN sub_1001C383:PROC
EXTRN sub_1001C38A:PROC
EXTRN sub_1001C394:PROC
EXTRN sub_1001C3A7:PROC
EXTRN sub_1001C3D6:PROC
EXTRN sub_1001C409:PROC
EXTRN sub_1005F18F:PROC
EXTRN sub_1005F537:PROC
EXTRN sub_1005F547:PROC
EXTRN sub_1005F7D6:PROC
EXTRN sub_1005FC7D:PROC
EXTRN sub_10060C40:PROC
EXTRN sub_10061CD2:PROC
EXTRN sub_10061ED1:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN fp_101D4AFC:DWORD:DWORD
EXTRN EXTRN fp_101D4B00:DWORD:DWORD
EXTRN EXTRN g_101AAC70:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
.CODE
FUN_1001c010 PROC
    sub sub esp, 0D0h
    push push ebx
    mov mov ebx, eax
    mov mov eax, dword ptr [g_101CE708]
    cmp cmp dword ptr [eax + 8], 2
    push push esi
    push push edi
    mov mov eax, 010194AF0h
    je L0
    mov mov eax, 010194ACCh
    push push ebx
    push push eax
    mov mov esi, 64
    lea lea edi, [esp + 28]
    call sub_10060C40
    lea lea ecx, [esp + 24]
    push push ecx
    mov mov edx, edi
    push push edx
    call dword ptr [fp_101D4AFC]
    add add esp, 16
    test test eax, eax
    jge L1
    mov mov eax, edi
    push push eax
    push push 010194AA0h
    call sub_10061CD2
    add add esp, 8
    pop pop edi
    pop pop esi
    xor xor eax, eax
    pop pop ebx
    add add esp, 0D0h
    ret ret
    mov mov eax, ebx
    lea lea edx, [eax + 1]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne L2
    sub sub eax, edx
    lea lea esi, [eax + 1]
    lea lea ecx, [esi + 08Ch]
    push push ebp
    push push ecx
    call dword ptr [fp_101D49D4]
    mov mov ecx, esi
    mov mov edx, ecx
    mov mov ebp, eax
    shr shr ecx, 2
    lea lea edi, [ebp + 08Ch]
    mov mov dword ptr [ebp], edi
    mov mov esi, ebx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov eax, dword ptr [esp + 24]
    lea lea ecx, [esp + 28]
    push push ecx
L1:
    mov mov dword ptr [esp + 24], eax
    call sub_1005F18F
    mov mov edx, dword ptr [g_101AAC70]
    imul imul edx, edx, 045Ch
    mov mov dword ptr [edx + 0101A6AC0h], 0101956FCh
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    mov mov byte ptr [eax + 0101A6AB5h], 0
    mov mov ecx, dword ptr [g_101AAC70]
    imul imul ecx, ecx, 045Ch
    add add esp, 8
    xor xor esi, esi
    mov mov byte ptr [ecx + 0101A6AB6h], 1
    xor xor bl, bl
    jmp L3
    lea lea esp, [esp]
    lea lea ebx, [ebx]
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov cl, byte ptr [eax + 0404h]
    test test cl, cl
    je sub_1001C261
    mov mov edx, dword ptr [eax + 0418h]
    mov mov ecx, dword ptr [eax + 0414h]
    mov mov byte ptr [eax + 0404h], 0
    mov mov dword ptr [esp + 16], edx
    mov mov dword ptr [eax + 0400h], ecx
    lea lea edx, [esp + 16]
    push push edx
    mov mov eax, 1
    call sub_1005F7D6
    mov mov edi, eax
    mov mov al, byte ptr [edi]
    add add esp, 4
    test test al, al
    je sub_1001C351
    cmp cmp al, 34
    jne sub_1001C303
    cmp cmp esi, 34
    je sub_1001C33B
    push push edi
    call sub_1001BFB4
    add add esp, 4
    cmp cmp eax, 34
    mov mov dword ptr [esp + esi*4 + 88], eax
    je sub_1001C35C
    mov mov cl, byte ptr [eax + 01018EB34h]
    test test cl, cl
    je sub_1001C306
    mov mov bl, 1
    push push 1
    inc inc esi
    push push 010195880h
    lea lea ecx, [esp + 24]
    call sub_1005FC7D
    add add esp, 8
    test test eax, eax
    jne sub_1001C2A8
    jmp sub_1001C394
    test test esi, esi
    je sub_1001C38A
    test test bl, bl
    je sub_1001C372
    mov mov eax, edi
    call sub_1001BF89
    test test eax, eax
    je sub_1001C3A7
    xor xor ecx, ecx
    test test esi, esi
    jle sub_1001C383
    mov mov edx, dword ptr [esp + ecx*4 + 88]
    inc inc ecx
    cmp cmp ecx, esi
    mov mov dword ptr [ebp + edx*4 + 4], eax
    jl sub_1001C383
    push push 1
    xor xor esi, esi
    xor xor bl, bl
    push push 010195820h
    jmp sub_1001C361
    push push 010194A7Ch
    call sub_1005F537
    add add esp, 4
    jmp sub_1001C3D6
    push push edi
    push push 010194A5Ch
    call sub_1005F547
    add add esp, 8
    xor xor ebp, ebp
    mov mov eax, dword ptr [g_101AAC70]
    test test eax, eax
L3:
    jne sub_1001C409
    push push 01019B958h
    push push 0
    call sub_10061ED1
    add add esp, 8
    mov mov edx, dword ptr [g_101AAC70]
    mov mov eax, dword ptr [esp + 20]
    dec dec edx
    push push eax
    mov mov dword ptr [g_101AAC70], edx
    call dword ptr [fp_101D4B00]
    add add esp, 4
FUN_1001c010 ENDP
END
