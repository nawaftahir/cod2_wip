.686
.MODEL FLAT, C
EXTRN sub_1006520E:PROC
EXTRN sub_10065238:PROC
EXTRN sub_1006535A:PROC
EXTRN sub_100653CC:PROC
EXTRN sub_10082A24:PROC
EXTRN sub_10082A4E:PROC
EXTRN sub_10082BE2:PROC
EXTRN sub_1008355E:PROC
EXTRN sub_100995F3:PROC
EXTRN sub_100998E3:PROC
EXTRN sub_10099C76:PROC
EXTRN sub_1009A7EA:PROC
EXTRN sub_1009A8FF:PROC
EXTRN sub_1009AD65:PROC
EXTRN sub_1009ADB8:PROC
EXTRN sub_1009B869:PROC
EXTRN sub_1009B8B0:PROC
EXTRN sub_1009BCBB:PROC
EXTRN sub_1009E16B:PROC
EXTRN sub_1009E1C2:PROC
EXTRN sub_1009EA1B:PROC
EXTRN sub_1009EAD8:PROC
EXTRN sub_1009EB38:PROC
EXTRN sub_100A0A65:PROC
EXTRN sub_100A1097:PROC
EXTRN sub_100A2031:PROC
EXTRN sub_100A2035:PROC
EXTRN sub_100A203B:PROC
EXTRN sub_100A2079:PROC
EXTRN sub_100A20A5:PROC
EXTRN sub_100A20C3:PROC
EXTRN sub_100A20D0:PROC
EXTRN sub_100A20F8:PROC
EXTRN sub_100A2114:PROC
EXTRN sub_100A211F:PROC
EXTRN sub_100A2157:PROC
EXTRN sub_100A216C:PROC
EXTRN sub_100A217A:PROC
EXTRN sub_100A2197:PROC
EXTRN sub_100A21C4:PROC
EXTRN sub_100A21EE:PROC
EXTRN sub_100A2214:PROC
EXTRN sub_100A2233:PROC
EXTRN sub_100A2235:PROC
EXTRN sub_100A226C:PROC
EXTRN sub_100A2282:PROC
EXTRN sub_100A2287:PROC
EXTRN sub_100A2289:PROC
EXTRN sub_100A2292:PROC
EXTRN sub_100A229A:PROC
EXTRN sub_100A22CC:PROC
EXTRN sub_100A22DE:PROC
EXTRN sub_100A2323:PROC
EXTRN sub_100A2337:PROC
EXTRN sub_100A2352:PROC
EXTRN sub_100A2374:PROC
EXTRN sub_100A2378:PROC
EXTRN sub_100A2380:PROC
EXTRN sub_100A23A3:PROC
EXTRN sub_100A23A7:PROC
EXTRN sub_100A23AA:PROC
EXTRN sub_100A23B4:PROC
EXTRN sub_100A23B8:PROC
EXTRN sub_100A23CF:PROC
EXTRN sub_100A23D4:PROC
EXTRN sub_100A241C:PROC
.CODE
FUN_100a1bf8 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 48
    mov mov eax, dword ptr [ebp + 8]
    push push edi
    xor xor edi, edi
    cmp cmp eax, edi
    mov mov dword ptr [ebp - 4], ecx
    mov mov dword ptr [ebp - 16], edi
    mov mov dword ptr [ebp - 24], edi
    mov mov dword ptr [ebp - 20], edi
    mov mov dword ptr [ebp - 40], edi
    mov mov dword ptr [ebp - 44], edi
    je sub_100A2031
    cmp cmp dword ptr [eax + 4], 3
    jne sub_100A203B
    push push ebx
    lea lea ebx, [eax + 16]
    mov mov eax, dword ptr [ecx + 24]
    cmp cmp eax, edi
    push push esi
    mov mov dword ptr [ebp - 8], ebx
    je L0
    mov mov eax, dword ptr [eax + 28]
    jmp L1
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 16], edi
    push push 6
    pop pop ecx
    je L2
    push push 22
    pop pop ecx
    lea lea edx, [ebp - 20]
    push push edx
    lea lea edx, [ebp - 16]
    push push edx
    push push ecx
    mov mov ecx, dword ptr [ebp - 4]
    push push dword ptr [ecx + 16]
    xor xor esi, esi
    push push dword ptr [ebp + 12]
    push push eax
    push push ebx
    push push 2
    call sub_1009E16B
    cmp cmp eax, edi
    jl sub_100A2079
    jne L3
    inc inc esi
    cmp cmp dword ptr [ebp + 16], edi
    jne L4
    cmp cmp esi, edi
    jne L8
    mov mov ecx, dword ptr [ebp - 4]
    lea lea eax, [ebp - 20]
L1:
    push push eax
    lea lea eax, [ebp - 24]
    push push eax
    push push dword ptr [ebp + 12]
    push push ebx
    call sub_1009AD65
    cmp cmp eax, edi
    jl sub_100A20A5
    jne L5
    xor xor esi, esi
    inc inc esi
    cmp cmp esi, edi
    jne L6
    mov mov ecx, dword ptr [ebp - 4]
    lea lea eax, [ebp - 20]
    push push eax
    lea lea eax, [ebp - 16]
    push push eax
    push push 2
    push push dword ptr [ecx + 16]
    push push edi
    push push edi
    push push ebx
    push push 2
    call sub_1009E1C2
    cmp cmp eax, edi
    jl sub_100A20D0
    jne L7
    xor xor esi, esi
    inc inc esi
    cmp cmp dword ptr [ebp + 16], edi
    jne L9
    cmp cmp esi, edi
    jne L11
    mov mov ecx, dword ptr [ebp - 4]
    lea lea eax, [ebp - 20]
    push push eax
    lea lea eax, [ebp - 24]
    push push eax
    push push edi
    push push ebx
    call sub_1009ADB8
    cmp cmp eax, edi
    jl sub_100A20F8
    jne L10
    xor xor esi, esi
    inc inc esi
    cmp cmp esi, edi
    jne L12
    push push dword ptr [ebx + 8]
    push push 010114BB8h
    push push 0BBCh
    push push ebx
    push push dword ptr [ebp - 4]
    call sub_100995F3
    add add esp, 20
    jmp sub_100A211F
    mov mov eax, dword ptr [ebp - 24]
    cmp cmp eax, edi
    je L13
    mov mov dword ptr [ebp - 16], eax
    mov mov esi, dword ptr [ebp + 12]
    lea lea eax, [ebp - 40]
    mov mov dword ptr [ebp - 28], eax
    lea lea eax, [ebp - 44]
    mov mov dword ptr [ebp - 32], eax
    mov mov eax, dword ptr [ebp - 16]
    mov mov eax, dword ptr [eax + 36]
    jmp L23
    mov mov eax, dword ptr [ebp - 12]
    mov mov ecx, dword ptr [eax + 8]
    mov mov eax, dword ptr [eax + 12]
    xor xor edx, edx
    cmp cmp eax, edi
    mov mov dword ptr [ebp - 48], ecx
    je L14
    mov mov ebx, dword ptr [eax + 8]
    cmp cmp dword ptr [ebx + 4], 12
    mov mov ebx, dword ptr [ebp - 8]
    jne L15
    inc inc edx
    mov mov dword ptr [ebp - 12], eax
    cmp cmp dword ptr [ebp + 16], edi
    je L16
    mov mov eax, dword ptr [ecx + 24]
    test test byte ptr [eax + 28], 64
    je sub_100A2031
    cmp cmp esi, edi
    je sub_100A2035
    mov mov eax, dword ptr [ecx + 24]
L6:
    mov mov ebx, dword ptr [eax + 32]
    mov mov dword ptr [ebp - 36], eax
    mov mov eax, dword ptr [esi + 8]
    cmp cmp eax, edi
    je L17
    mov mov eax, dword ptr [eax + 16]
    mov mov dword ptr [ebp + 8], eax
    jmp L18
    mov mov dword ptr [ebp + 8], edi
    push push 20
    call sub_1006520E
    cmp cmp eax, edi
    je L19
    push push 010115894h
    push push edi
    push push edi
    mov mov ecx, eax
    call sub_10082A24
    jmp L20
    xor xor eax, eax
    cmp cmp eax, edi
    mov mov ecx, dword ptr [ebp - 28]
    mov mov dword ptr [ecx], eax
    je sub_100A21C4
    push push 20
    call sub_10065238
    cmp cmp eax, edi
    je L21
    push push 01011588Ch
    push push edi
    push push edi
L9:
    mov mov ecx, eax
    call sub_10082A4E
    jmp L22
    xor xor eax, eax
    cmp cmp eax, edi
    mov mov ecx, dword ptr [ebp - 32]
    mov mov dword ptr [ecx], eax
    je sub_100A21EE
    mov mov eax, dword ptr [ebp - 36]
    test test byte ptr [eax + 28], 16
    je L25
    mov mov ecx, dword ptr [ebp - 4]
L10:
    push push edi
    push push dword ptr [ebp + 8]
    push push ebx
    call sub_1009B869
    test test eax, eax
    mov mov ecx, dword ptr [ebp - 4]
    push push edi
    je sub_100A2114
    push push edi
    push push dword ptr [esi + 8]
    push push ebx
    call sub_1009EAD8
    mov mov ecx, dword ptr [ebp - 28]
    mov mov ecx, dword ptr [ecx]
L12:
    mov mov dword ptr [ecx + 8], eax
    mov mov eax, dword ptr [ebp - 36]
    test test byte ptr [eax + 28], 32
    je sub_100A20C3
    push push dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ebp - 4]
    call sub_10099C76
    test test eax, eax
    jne sub_100A2157
    mov mov ecx, dword ptr [ebp - 4]
    push push edi
    push push ebx
    push push dword ptr [ebp + 8]
    call sub_1009B8B0
    test test eax, eax
    je sub_100A216C
    push push dword ptr [ebp - 36]
    mov mov eax, dword ptr [ebp - 48]
    push push dword ptr [eax + 20]
    mov mov ecx, dword ptr [ebp - 4]
    call sub_1009EA1B
    cmp cmp eax, edi
    je sub_100A226C
    mov mov ecx, dword ptr [ebp - 4]
    push push edi
    push push edi
    push push eax
    push push dword ptr [ebp + 8]
    call sub_1009EB38
    cmp cmp eax, edi
    je sub_100A2282
    mov mov ecx, dword ptr [ebp - 4]
    push push 1
    push push eax
    push push dword ptr [esi + 8]
    push push 21
    call sub_100A1097
    cmp cmp eax, edi
    je sub_100A229A
    mov mov ecx, dword ptr [ebp - 32]
    mov mov ecx, dword ptr [ecx]
    mov mov dword ptr [ecx + 8], eax
    mov mov eax, dword ptr [ebp - 28]
    mov mov eax, dword ptr [eax]
    mov mov esi, dword ptr [esi + 12]
    mov mov ebx, dword ptr [ebp - 8]
    add add eax, 12
    mov mov dword ptr [ebp - 28], eax
    mov mov eax, dword ptr [ebp - 32]
    mov mov eax, dword ptr [eax]
    add add eax, 12
    mov mov dword ptr [ebp - 32], eax
    jmp sub_100A217A
    cmp cmp edx, edi
    je sub_100A2197
    mov mov eax, dword ptr [ebp - 12]
    mov mov eax, dword ptr [eax + 12]
    cmp cmp eax, edi
    mov mov dword ptr [ebp - 12], eax
    jne L24
    cmp cmp esi, edi
    jne sub_100A2289
    cmp cmp dword ptr [ebp - 12], edi
L16:
    jne sub_100A2292
    push push 80
    call sub_1006535A
    cmp cmp eax, edi
    je sub_100A2214
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp - 24], edi
    push push ebx
    setne setne cl
    push push 1
    push push edi
    push push edi
    add add ecx, 25
    push push ecx
    push push edi
    mov mov ecx, eax
    call sub_1008355E
    mov mov esi, eax
    jmp sub_100A2233
    push push dword ptr [ebp + 8]
    push push ebx
    mov mov eax, dword ptr [ebp - 8]
    push push dword ptr [eax + 8]
    push push eax
    call sub_1009BCBB
    jmp sub_100A2323
    mov mov ecx, dword ptr [ebp - 4]
    push push edi
    push push ebx
    push push dword ptr [ebp + 8]
    jmp sub_100A2235
    xor xor esi, esi
    cmp cmp esi, edi
    je sub_100A2337
    mov mov eax, dword ptr [ebp - 16]
    cmp cmp dword ptr [eax + 32], edi
    je sub_100A2287
    mov mov ecx, dword ptr [eax + 32]
    mov mov eax, dword ptr [ecx]
    call call dword ptr [eax + 4]
    cmp cmp eax, edi
    mov mov dword ptr [esi + 16], eax
    je sub_100A2352
    mov mov eax, dword ptr [ebp - 20]
    push push 20
    mov mov dword ptr [esi + 32], eax
    call sub_100653CC
    cmp cmp eax, edi
    je sub_100A22CC
    push push 010115880h
    push push edi
    push push edi
    mov mov ecx, eax
    call sub_10082BE2
    jmp sub_100A22DE
    xor xor eax, eax
    cmp cmp eax, edi
    mov mov dword ptr [esi + 36], eax
    je sub_100A2380
    mov mov ecx, dword ptr [ebp - 40]
    mov mov dword ptr [eax + 8], ecx
    mov mov eax, dword ptr [esi + 36]
    mov mov ecx, dword ptr [ebp - 44]
    mov mov dword ptr [eax + 12], ecx
    mov mov ecx, dword ptr [ebp - 4]
    push push esi
    call sub_1009A8FF
    mov mov ecx, dword ptr [ebp - 4]
    push push esi
    call sub_1009A7EA
    test test eax, eax
    je sub_100A23A7
    mov mov ecx, dword ptr [ebp - 4]
    push push esi
    call sub_100A0A65
    cmp cmp eax, edi
    je sub_100A23B4
    mov mov esi, eax
    jmp sub_100A23B8
    mov mov eax, dword ptr [ebp + 12]
    xor xor ecx, ecx
    jmp sub_100A2374
    mov mov eax, dword ptr [eax + 12]
    inc inc ecx
    cmp cmp eax, edi
    jne sub_100A2378
    cmp cmp dword ptr [ebp - 24], edi
    mov mov eax, 01010E8DCh
    jne sub_100A23AA
    cmp cmp ecx, 1
    jne sub_100A23A3
    mov mov eax, 01019166Eh
    push push eax
    push push ecx
    push push dword ptr [ebx + 8]
    push push 010115854h
    jmp sub_100A23D4
    cmp cmp ecx, 1
    jne sub_100A23CF
    mov mov eax, 01019166Eh
    push push eax
    push push ecx
    push push dword ptr [ebx + 8]
    push push 01011581Ch
    push push 0BC5h
    push push ebx
    push push dword ptr [ebp - 4]
    call sub_100998E3
    add add esp, 28
    xor xor esi, esi
L23:
    mov mov eax, esi
    pop pop esi
    pop pop ebx
    jmp sub_100A241C
    xor xor eax, eax
    pop pop edi
    leave leave
    ret ret 12
FUN_100a1bf8 ENDP
END
