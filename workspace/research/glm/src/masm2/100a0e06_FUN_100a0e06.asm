.686
.MODEL FLAT, C
EXTRN sub_100650C9:PROC
EXTRN sub_100832CA:PROC
EXTRN sub_100998E8:PROC
EXTRN sub_10099BF6:PROC
EXTRN sub_10099C37:PROC
EXTRN sub_10099C5A:PROC
EXTRN sub_10099CC3:PROC
EXTRN sub_10099F51:PROC
EXTRN sub_10099F89:PROC
EXTRN sub_1009A598:PROC
EXTRN sub_1009A82B:PROC
EXTRN sub_1009A940:PROC
EXTRN sub_1009B98F:PROC
EXTRN sub_1009BCDC:PROC
EXTRN sub_1009BF87:PROC
EXTRN sub_1009BFA9:PROC
EXTRN sub_1009EC45:PROC
EXTRN sub_1009EC7D:PROC
EXTRN sub_100A0AA6:PROC
EXTRN sub_100A121F:PROC
EXTRN sub_100A1255:PROC
EXTRN sub_100A1273:PROC
EXTRN sub_100A129E:PROC
EXTRN sub_100A12B0:PROC
EXTRN sub_100A12F0:PROC
EXTRN sub_100A133A:PROC
EXTRN sub_100A1343:PROC
EXTRN sub_100A1345:PROC
EXTRN sub_100A134A:PROC
EXTRN sub_100A134B:PROC
EXTRN sub_100A134F:PROC
EXTRN sub_100A1353:PROC
EXTRN sub_100A1354:PROC
EXTRN sub_100A1359:PROC
EXTRN sub_100A135C:PROC
EXTRN sub_100A135E:PROC
EXTRN sub_100A1363:PROC
EXTRN sub_100A1365:PROC
EXTRN sub_100A1368:PROC
EXTRN sub_100A136E:PROC
EXTRN sub_100A1373:PROC
EXTRN sub_100A1391:PROC
EXTRN sub_100A139B:PROC
EXTRN sub_100A13A6:PROC
EXTRN sub_100A13A8:PROC
EXTRN sub_100A13B9:PROC
EXTRN sub_100A13CE:PROC
EXTRN sub_100A13D1:PROC
EXTRN sub_100A1404:PROC
EXTRN sub_100A140A:PROC
EXTRN sub_100A1422:PROC
EXTRN sub_100A1455:PROC
EXTRN sub_100A1457:PROC
EXTRN sub_100A1476:PROC
EXTRN sub_100A147C:PROC
EXTRN sub_100A14A6:PROC
EXTRN sub_100A14F3:PROC
EXTRN sub_100A14FA:PROC
EXTRN sub_100A14FF:PROC
EXTRN sub_100A150F:PROC
EXTRN sub_100A151F:PROC
EXTRN sub_100A1557:PROC
EXTRN sub_100A1563:PROC
EXTRN sub_100A156B:PROC
EXTRN sub_100A156D:PROC
EXTRN sub_100A157B:PROC
EXTRN sub_100A15A0:PROC
EXTRN sub_100A15A2:PROC
EXTRN sub_100A15D6:PROC
EXTRN sub_100A15FB:PROC
EXTRN sub_100A1608:PROC
EXTRN sub_100A160C:PROC
.CODE
FUN_100a0e06 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 20
    push push ebx
    mov mov ebx, dword ptr [ebp + 12]
    push push esi
    xor xor esi, esi
    cmp cmp ebx, esi
    mov mov dword ptr [ebp - 4], ecx
    mov mov dword ptr [ebp - 16], esi
    mov mov dword ptr [ebp - 20], esi
    mov mov dword ptr [ebp - 8], esi
    mov mov dword ptr [ebp - 12], esi
    je L0
    cmp cmp dword ptr [ebx + 4], 13
    jne L1
    mov mov eax, dword ptr [ebp + 16]
    cmp cmp eax, esi
    je L3
    cmp cmp dword ptr [eax + 4], 13
    je L2
    xor xor eax, eax
    jmp sub_100A1255
    add add eax, 48
    mov mov dword ptr [ebp + 12], eax
    jmp L6
    cmp cmp ebx, esi
    je L5
    lea lea eax, [ebx + 48]
    jmp L4
    add add ecx, 32
    mov mov dword ptr [ebp + 12], ecx
    push push edi
    push push 80
    call sub_100650C9
    cmp cmp eax, esi
L1:
    mov mov edi, dword ptr [ebp + 8]
    je L7
    push push dword ptr [ebp + 12]
    xor xor ecx, ecx
    push push dword ptr [ebp + 20]
    push push ecx
    push push ecx
    push push edi
    push push ecx
    mov mov ecx, eax
    call sub_100832CA
    mov mov esi, eax
    jmp L8
    xor xor esi, esi
    test test esi, esi
    jne L9
    xor xor eax, eax
    jmp sub_100A129E
    test test ebx, ebx
    je L10
    mov mov eax, dword ptr [ebx]
L4:
    mov mov ecx, ebx
    call call dword ptr [eax + 4]
    test test eax, eax
    mov mov dword ptr [esi + 32], eax
    je sub_100A12B0
    cmp cmp edi, 28
    push push 21
    pop pop ecx
    je L12
    cmp cmp edi, 29
    je L13
    cmp cmp edi, 30
    je L14
    cmp cmp edi, 31
    je L15
    cmp cmp edi, 32
    je L16
    cmp cmp edi, 33
    je L17
    cmp cmp edi, 34
    je L18
    cmp cmp dword ptr [ebp + 16], 0
    je L25
    mov mov ecx, dword ptr [ebp + 16]
    mov mov eax, dword ptr [ecx]
    call call dword ptr [eax + 4]
    test test eax, eax
    mov mov dword ptr [esi + 36], eax
    jne L27
    jmp sub_100A12F0
    mov mov eax, edi
    sub sub eax, 28
    je L24
    dec dec eax
    je L23
    dec dec eax
    je L22
    dec dec eax
    je L21
    dec dec eax
    je L20
    dec dec eax
    je L19
    dec dec eax
    jne L26
    xor xor edi, edi
    inc inc edi
    push push 3
    jmp L28
    xor xor edi, edi
    inc inc edi
    push push 2
    jmp L29
    push push 11
L9:
    jmp L30
    push push 10
    jmp L31
    push push 9
    jmp L32
    push push 8
    jmp L33
    push push 7
    mov mov edi, ecx
    pop pop eax
    jmp L34
    mov mov eax, dword ptr [ebp + 16]
    mov mov ecx, dword ptr [ebp - 4]
    push push 0
    push push dword ptr [ebp + 16]
    push push ebx
L10:
    push push eax
    call L11
L11:
    test test eax, eax
    mov mov dword ptr [esi + 36], eax
    je sub_100A134B
    mov mov dword ptr [esi + 28], edi
    mov mov eax, dword ptr [esi + 32]
    test test eax, eax
    je L35
    mov mov eax, dword ptr [eax + 16]
    mov mov dword ptr [ebp - 16], eax
    mov mov dword ptr [ebp - 20], eax
    jmp L36
    mov mov eax, dword ptr [ebp - 16]
    test test edi, edi
    je L37
    cmp cmp edi, 1
    je L38
    cmp cmp edi, 20
    je L39
    cmp cmp edi, 21
    je L41
    cmp cmp edi, 16
    je L42
    cmp cmp edi, 17
    je L44
    test test eax, eax
    je L40
    mov mov eax, dword ptr [ebp - 16]
    cmp cmp dword ptr [eax + 4], 9
    jne L43
    mov mov ecx, dword ptr [ebp - 4]
    push push eax
    call sub_10099C5A
    test test eax, eax
    jne L45
    push push 01011536Ch
    push push 0BCEh
    jmp sub_100A139B
    cmp cmp edi, 2
    je L46
    cmp cmp edi, 3
    je L47
    cmp cmp edi, 20
    je L48
    cmp cmp edi, 21
    jne L49
    mov mov ebx, dword ptr [ebp - 16]
    mov mov ecx, dword ptr [ebp - 4]
    push push ebx
    call sub_10099BF6
    test test eax, eax
    jne sub_100A13B9
    mov mov edx, dword ptr [ebp - 4]
    push push dword ptr [esi + 32]
    mov mov ecx, edx
    call sub_1009A598
    test test eax, eax
    jne sub_100A13CE
    mov mov eax, dword ptr [edx + 16]
    mov mov eax, dword ptr [eax + 16]
    cmp cmp eax, 3
    je L50
    cmp cmp eax, 4
    jne L51
    mov mov ecx, dword ptr [ebp - 4]
    push push ebx
    call sub_10099CC3
    test test eax, eax
    jne L52
    push push 010115338h
L22:
    push push 0BF9h
    jmp sub_100A1404
    mov mov ebx, dword ptr [ebp - 16]
    mov mov eax, dword ptr [esi + 36]
    test test eax, eax
    je sub_100A121F
    mov mov eax, dword ptr [eax + 16]
    mov mov dword ptr [ebp - 8], eax
    mov mov dword ptr [ebp - 12], eax
L27:
    cmp cmp edi, 20
    je sub_100A133A
L29:
    cmp cmp edi, 21
    je sub_100A1343
    test test edi, edi
    jne sub_100A1273
    test test ebx, ebx
    je sub_100A1391
    mov mov eax, dword ptr [ebx]
    mov mov ecx, ebx
    call call dword ptr [eax + 4]
    test test eax, eax
    mov mov dword ptr [esi + 16], eax
    je sub_100A1455
    jmp sub_100A13A8
    cmp cmp edi, 4
    je sub_100A134A
    cmp cmp edi, 5
    je sub_100A1353
    cmp cmp edi, 6
    je sub_100A135C
    cmp cmp edi, 2
    je sub_100A1365
    cmp cmp edi, 3
    je sub_100A136E
    cmp cmp edi, 1
    je sub_100A1373
    cmp cmp edi, 12
    je sub_100A1345
    cmp cmp edi, 13
    je sub_100A134A
    cmp cmp edi, 14
    je sub_100A134F
    cmp cmp edi, 15
    je sub_100A1354
    cmp cmp edi, 16
    je sub_100A1359
    cmp cmp edi, 17
    je sub_100A135E
    cmp cmp edi, 18
    je sub_100A1363
L36:
    cmp cmp edi, 19
    je sub_100A1368
    mov mov ecx, dword ptr [ebp - 4]
    lea lea eax, [esi + 16]
    push push eax
    lea lea eax, [ebp - 12]
    push push eax
    lea lea eax, [ebp - 20]
    push push eax
    push push dword ptr [ebp - 8]
    push push ebx
    call sub_1009BF87
    test test eax, eax
    jge sub_100A1422
    jmp sub_100A13A6
    mov mov ecx, dword ptr [ebp - 4]
    lea lea edi, [esi + 16]
    push push edi
    lea lea eax, [ebp - 12]
    push push eax
    lea lea eax, [ebp - 20]
    push push eax
    push push dword ptr [ebp - 8]
    push push ebx
    call sub_1009BFA9
    test test eax, eax
    jge sub_100A13D1
    push push 010115328h
    push push 0BCCh
L37:
    jmp sub_100A14F3
L38:
    mov mov eax, dword ptr [edi]
    and and dword ptr [eax + 20], 0
    jmp sub_100A1457
    test test ebx, ebx
L41:
    je sub_100A140A
    mov mov eax, dword ptr [ebx]
    mov mov ecx, ebx
    call call dword ptr [eax + 4]
    test test eax, eax
    mov mov dword ptr [esi + 16], eax
    je sub_100A151F
    mov mov ecx, dword ptr [ebp - 4]
    push push 1
    push push dword ptr [esi + 16]
    call sub_10099C37
    jmp sub_100A147C
    mov mov ecx, dword ptr [ebp - 4]
    xor xor edi, edi
    push push edi
    push push dword ptr [ebp - 8]
    push push ebx
    call sub_1009B98F
    test test eax, eax
    jne sub_100A1476
    mov mov ecx, dword ptr [ebp - 4]
    push push edi
    push push dword ptr [ebp - 8]
    push push ebx
    push push edi
    push push dword ptr [ebp + 12]
    call sub_1009BCDC
    jmp sub_100A1557
L46:
    cmp cmp ebx, edi
    je sub_100A14A6
    mov mov eax, dword ptr [ebx]
    mov mov ecx, ebx
    call call dword ptr [eax + 4]
    cmp cmp eax, edi
    mov mov dword ptr [esi + 16], eax
    je sub_100A156D
    mov mov dword ptr [ebp - 12], ebx
    mov mov edx, dword ptr [esi + 32]
    test test edx, edx
    je sub_100A14FA
    cmp cmp ebx, dword ptr [ebp - 20]
    je sub_100A14FF
    push push dword ptr [ebp - 20]
    mov mov ecx, dword ptr [ebp - 4]
    push push ebx
    call sub_10099F51
    test test eax, eax
    jne sub_100A150F
    mov mov ecx, dword ptr [ebp - 4]
    push push eax
    push push eax
    push push edx
    push push dword ptr [ebp - 20]
    call sub_1009EC45
    test test eax, eax
    je sub_100A15A2
    mov mov dword ptr [esi + 32], eax
    mov mov edx, dword ptr [esi + 36]
    test test edx, edx
    je sub_100A1563
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp dword ptr [ebp - 8], eax
    je sub_100A156B
    mov mov ecx, dword ptr [ebp - 4]
    push push eax
    push push dword ptr [ebp - 8]
L49:
    call sub_10099F89
    test test eax, eax
    jne sub_100A157B
    mov mov ecx, dword ptr [ebp - 4]
    push push eax
    push push eax
    push push edx
    push push dword ptr [ebp - 12]
    call sub_1009EC7D
    test test eax, eax
    je sub_100A15D6
    mov mov dword ptr [esi + 36], eax
    cmp cmp dword ptr [esi + 16], 0
    jne sub_100A15A0
    and and dword ptr [esi + 16], 0
    mov mov ecx, dword ptr [ebp - 4]
    push push esi
    call sub_1009A940
    mov mov ecx, dword ptr [ebp - 4]
    push push esi
    call sub_1009A82B
    test test eax, eax
L51:
    je sub_100A15FB
    mov mov ecx, dword ptr [ebp - 4]
    push push esi
    call sub_100A0AA6
    test test eax, eax
L52:
    je sub_100A1608
    mov mov esi, eax
    jmp sub_100A160C
    push push 010115308h
    push push 0BD1h
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp - 4]
    call sub_100998E8
    add add esp, 16
    xor xor esi, esi
    mov mov eax, esi
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 16
FUN_100a0e06 ENDP
END
