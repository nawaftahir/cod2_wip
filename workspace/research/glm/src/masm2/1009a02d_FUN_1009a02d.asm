.686
.MODEL FLAT, C
EXTRN sub_1009A1E8:PROC
EXTRN sub_1009A1F3:PROC
EXTRN sub_1009A1FD:PROC
EXTRN sub_1009A20A:PROC
EXTRN sub_1009A20F:PROC
EXTRN sub_1009A218:PROC
EXTRN sub_1009A21D:PROC
EXTRN sub_1009A222:PROC
EXTRN sub_1009A256:PROC
EXTRN sub_1009A27B:PROC
EXTRN sub_1009A285:PROC
EXTRN sub_1009A293:PROC
EXTRN sub_1009A2A1:PROC
EXTRN sub_1009A2A2:PROC
EXTRN sub_1009A2A7:PROC
EXTRN sub_1009A2A9:PROC
EXTRN sub_1009A2AF:PROC
EXTRN sub_1009A2B0:PROC
EXTRN sub_1009A2CF:PROC
EXTRN sub_1009A2D9:PROC
EXTRN sub_1009A2E7:PROC
EXTRN sub_1009A2F5:PROC
EXTRN sub_1009A313:PROC
EXTRN sub_1009A31E:PROC
EXTRN sub_1009A322:PROC
EXTRN sub_1009A329:PROC
EXTRN sub_1009A32A:PROC
EXTRN sub_1009A332:PROC
EXTRN sub_1009A334:PROC
EXTRN sub_1009A33F:PROC
EXTRN sub_1009A346:PROC
EXTRN sub_1009A349:PROC
EXTRN sub_1009A34F:PROC
EXTRN sub_1009A354:PROC
EXTRN sub_1009A358:PROC
EXTRN sub_1009A36F:PROC
EXTRN sub_1009A383:PROC
.CODE
FUN_1009a02d PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov ecx, dword ptr [ebp + 8]
    test test ecx, ecx
    push push ebx
    push push esi
    push push edi
    je L9
    cmp cmp dword ptr [ecx + 4], 9
    jne sub_1009A1E8
    mov mov eax, dword ptr [ebp + 12]
    test test eax, eax
    je sub_1009A1F3
    cmp cmp dword ptr [eax + 4], 9
    jne sub_1009A1FD
    mov mov esi, dword ptr [ecx + 20]
    mov mov edi, dword ptr [eax + 20]
    cmp cmp esi, edi
    jne L0
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [eax], esi
    jmp sub_1009A222
    mov mov eax, dword ptr [esi*8 + 010114878h]
    mov mov ecx, dword ptr [edi*8 + 010114878h]
    cmp cmp eax, ecx
    jbe L1
    mov mov ecx, eax
    mov mov eax, dword ptr [esi*8 + 01011487Ch]
    and and eax, dword ptr [edi*8 + 01011487Ch]
    xor xor edx, edx
    inc inc edx
    test test dl, al
    je L2
    mov mov eax, dword ptr [ebp + 16]
    and and dword ptr [eax], 0
    jmp sub_1009A256
    push push 4
    pop pop ebx
    test test bl, al
    je L7
    test test ecx, ecx
    je L6
    push push 8
    pop pop edx
    cmp cmp ecx, edx
    je L5
    cmp cmp ecx, 16
    je L4
    cmp cmp ecx, 32
    je L3
    cmp cmp ecx, 64
    jne sub_1009A27B
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [eax], edx
    jmp sub_1009A285
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [eax], 7
L1:
    jmp sub_1009A293
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [eax], 6
    jmp sub_1009A2A1
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [eax], 5
    jmp sub_1009A2AF
    test test al, 2
    je sub_1009A21D
    test test ecx, ecx
    je L8
    cmp cmp ecx, 8
    je sub_1009A218
    cmp cmp ecx, 16
    je sub_1009A20F
    cmp cmp ecx, 32
    je sub_1009A20A
    cmp cmp ecx, 64
    jne sub_1009A2CF
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [eax], ebx
    jmp sub_1009A2D9
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [eax], 3
    jmp sub_1009A2E7
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [eax], 2
    jmp sub_1009A2F5
    push push 8
    pop pop edx
    test test dl, al
    je sub_1009A2B0
    test test ecx, ecx
    je sub_1009A2A9
    cmp cmp ecx, edx
    je sub_1009A2A2
    cmp cmp ecx, 16
    je sub_1009A2A7
    cmp cmp ecx, 32
    je sub_1009A2A1
    cmp cmp ecx, 64
L3:
    jne sub_1009A313
    mov mov eax, dword ptr [ebp + 16]
L4:
    mov mov dword ptr [eax], 12
    jmp sub_1009A31E
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [eax], 11
    jmp sub_1009A329
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [eax], 10
    jmp sub_1009A334
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [eax], 9
    jmp sub_1009A33F
    test test al, 16
    je sub_1009A332
    xor xor edx, edx
    test test edx, edx
    mov mov ecx, esi
    jne sub_1009A322
    mov mov ecx, edi
    mov mov eax, esi
    cmp cmp ecx, 13
    je sub_1009A34F
    cmp cmp ecx, 15
    jne sub_1009A334
    cmp cmp eax, ecx
    jl sub_1009A346
    cmp cmp eax, 19
    jmp sub_1009A349
    mov mov eax, edi
    jmp sub_1009A32A
    cmp cmp ecx, 20
    jne sub_1009A354
    cmp cmp eax, ecx
    jl sub_1009A358
    cmp cmp eax, 24
    jle sub_1009A36F
    inc inc edx
    cmp cmp edx, 2
    jb sub_1009A334
    mov mov eax, 080004005h
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret 12
    mov mov ecx, dword ptr [ebp + 16]
    mov mov dword ptr [ecx], eax
    xor xor eax, eax
L9:
    jmp sub_1009A383
FUN_1009a02d ENDP
END
