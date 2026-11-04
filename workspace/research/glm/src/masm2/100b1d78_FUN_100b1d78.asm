.686
.MODEL FLAT, C
EXTRN sub_1008B3EB:PROC
EXTRN sub_1008B40E:PROC
EXTRN sub_100AF93A:PROC
EXTRN sub_100AFBA5:PROC
EXTRN sub_100AFCCF:PROC
EXTRN sub_100AFCF9:PROC
EXTRN sub_100AFDD7:PROC
EXTRN sub_100AFF84:PROC
EXTRN sub_100B20E3:PROC
EXTRN sub_100B20FF:PROC
EXTRN sub_100B210A:PROC
EXTRN sub_100B2110:PROC
EXTRN sub_100B2113:PROC
EXTRN sub_100B2119:PROC
EXTRN sub_100B211D:PROC
EXTRN sub_100B211F:PROC
EXTRN sub_100B2130:PROC
EXTRN sub_100B2138:PROC
EXTRN sub_100B215E:PROC
EXTRN sub_100B2168:PROC
EXTRN sub_100B2174:PROC
EXTRN sub_100B2180:PROC
EXTRN sub_100B2181:PROC
EXTRN sub_100B218C:PROC
EXTRN sub_100B2198:PROC
EXTRN sub_100B21A4:PROC
EXTRN sub_100B21A9:PROC
EXTRN sub_100B21AB:PROC
EXTRN sub_100B21B0:PROC
EXTRN sub_100B21BE:PROC
EXTRN sub_100B21C5:PROC
EXTRN sub_100B21F4:PROC
EXTRN sub_100B225D:PROC
EXTRN sub_100B2269:PROC
EXTRN sub_100B2270:PROC
EXTRN sub_100B2272:PROC
EXTRN sub_100B2273:PROC
EXTRN sub_100B2274:PROC
EXTRN sub_100B2276:PROC
EXTRN sub_100B2278:PROC
EXTRN sub_100B2279:PROC
EXTRN sub_100B22A3:PROC
EXTRN sub_100B22AF:PROC
EXTRN sub_100B22BB:PROC
EXTRN sub_100B22D8:PROC
EXTRN sub_100B22F8:PROC
EXTRN sub_100B22FC:PROC
EXTRN sub_100B2300:PROC
EXTRN sub_100B2304:PROC
EXTRN sub_100B2314:PROC
EXTRN sub_100B231D:PROC
EXTRN sub_100B2323:PROC
EXTRN sub_100B2326:PROC
EXTRN sub_100B2328:PROC
EXTRN sub_100B232B:PROC
EXTRN sub_100B232E:PROC
EXTRN sub_100B2331:PROC
EXTRN sub_100B2334:PROC
EXTRN sub_100B233C:PROC
EXTRN sub_100B235A:PROC
EXTRN sub_100B235D:PROC
EXTRN sub_100B235E:PROC
EXTRN sub_100B2362:PROC
EXTRN sub_100B2366:PROC
EXTRN sub_100B2395:PROC
EXTRN sub_100B2398:PROC
EXTRN sub_100B23BE:PROC
EXTRN sub_100B23CE:PROC
EXTRN sub_100B23F1:PROC
EXTRN sub_100CA55C:PROC
EXTRN sub_100CAD5C:PROC
EXTRN sub_100CAFE6:PROC
EXTRN sub_100CB22D:PROC
EXTRN sub_100CB75E:PROC
EXTRN sub_100CB92F:PROC
EXTRN sub_100CB931:PROC
EXTRN sub_100CB9EA:PROC
EXTRN sub_100CBA38:PROC
EXTRN sub_100CBBB6:PROC
.CODE
FUN_100b1d78 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ebx
    push push esi
    xor xor ebx, ebx
    cmp cmp dword ptr [ebp + 12], ebx
    push push edi
    mov mov esi, ecx
    jbe L14
    mov mov eax, dword ptr [ebp + 8]
    mov mov dword ptr [esi + 0FCh], ebx
    mov mov eax, dword ptr [eax + ebx*4]
    test test eax, eax
    mov mov dword ptr [esi + 0100h], eax
    je L16
    mov mov eax, dword ptr [eax + 60]
    test test eax, eax
    je L0
    cmp cmp dword ptr [eax + 4], 13
    jne L1
    add add eax, 48
    mov mov dword ptr [esi + 0104h], eax
    mov mov edi, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [edi]
    test test ecx, ecx
    je L20
    mov mov eax, dword ptr [edi + 8]
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax]
    mov mov eax, dword ptr [edx + eax*4]
    cmp cmp dword ptr [eax + 8], -1
    jne sub_100B20FF
    mov mov eax, ecx
    and and eax, 0FFF00000h
    cmp cmp eax, 070300000h
    ja L11
    je L13
    cmp cmp eax, 050000000h
    ja L9
    je L6
    test test eax, eax
    je sub_100B211D
    cmp cmp eax, 010000000h
    je L8
    cmp cmp eax, 010100000h
    je L5
    cmp cmp eax, 011000000h
    je L4
    cmp cmp eax, 020400000h
    je L3
    cmp cmp eax, 020500000h
    je L2
    cmp cmp eax, 030000000h
    jne sub_100B2181
    mov mov eax, dword ptr [esi + 0C8h]
    and and eax, 0FFFFh
    cmp cmp eax, 0104h
    jne L7
    mov mov ecx, esi
    call sub_100CB9EA
    jmp sub_100B215E
    mov mov eax, 080004001h
    jmp sub_100B2168
    mov mov ecx, esi
    call sub_100CB92F
    jmp sub_100B2174
    mov mov ecx, esi
    call sub_100CB931
    jmp sub_100B2180
    mov mov ecx, esi
    call sub_100CA55C
    jmp sub_100B218C
    mov mov ecx, esi
    call sub_100CAD5C
    jmp sub_100B2198
    mov mov ecx, esi
    call sub_100CB75E
    jmp sub_100B21A4
    and and ecx, 0FFFFFh
    cmp cmp ecx, 2
    je sub_100B21F4
    cmp cmp ecx, 4
    jne L10
    mov mov eax, dword ptr [esi + 0C8h]
    and and eax, 0FFFFh
    cmp cmp eax, 0101h
    je L15
    mov mov eax, dword ptr [esi + 0C8h]
    and and eax, 0FFFFh
    cmp cmp eax, 0102h
    je L12
    cmp cmp eax, 0103h
    jne L17
    cmp cmp ecx, 4
    jne L19
    mov mov eax, dword ptr [edi + 16]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [edi + 8]
    mov mov edi, dword ptr [eax]
    mov mov eax, dword ptr [eax + 16]
    mov mov edi, dword ptr [edx + edi*4]
    mov mov edx, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [ecx + 4]
    cmp cmp eax, dword ptr [esi + 084h]
    jne L17
    mov mov ecx, dword ptr [ecx + 108]
    mov mov eax, dword ptr [esi + 088h]
    and and ecx, 0FFh
    cmp cmp dword ptr [edi + 4], eax
    jne L18
    cmp cmp dword ptr [edi + 12], 0
    je sub_100B20E3
    cmp cmp dword ptr [edx + 4], eax
    jne sub_100B2113
    cmp cmp dword ptr [edx + 12], 0
L4:
    jne sub_100B2119
    cmp cmp ecx, 1
L5:
    jmp sub_100B2110
L6:
    cmp cmp dword ptr [edi + 4], eax
L8:
    jne sub_100B210A
    mov mov edi, dword ptr [edi + 12]
    cmp cmp edi, dword ptr [ecx + 12]
    je sub_100B211F
    cmp cmp dword ptr [edx + 4], eax
    jne sub_100B2130
    mov mov eax, dword ptr [edx + 12]
    cmp cmp eax, dword ptr [ecx + 12]
    jne sub_100B2138
    mov mov ecx, esi
    call sub_100AF93A
    jmp sub_100B225D
    mov mov ecx, esi
    call sub_100CBA38
    jmp sub_100B2269
    cmp cmp eax, 060000000h
    je sub_100B21A9
    cmp cmp eax, 060500000h
    je sub_100B21B0
    cmp cmp eax, 060700000h
    je sub_100B21AB
    cmp cmp eax, 060A00000h
    je sub_100B21BE
    cmp cmp eax, 060F00000h
    je sub_100B21C5
    cmp cmp eax, 070100000h
    jne sub_100B22D8
    mov mov ecx, esi
    call sub_100CAFE6
    jmp sub_100B22A3
    mov mov ecx, esi
    call sub_100AFCF9
    jmp sub_100B22AF
    mov mov ecx, esi
    call sub_100AFDD7
    jmp sub_100B22BB
    mov mov ecx, 072600000h
    cmp cmp eax, ecx
    ja sub_100B2278
    je sub_100B2276
    cmp cmp eax, 070400000h
    je sub_100B2274
    cmp cmp eax, 070F00000h
    je sub_100B2272
    cmp cmp eax, 072100000h
    je sub_100B2270
    cmp cmp eax, 072200000h
    je sub_100B2273
    cmp cmp eax, 072300000h
    je sub_100B2276
    cmp cmp eax, 072400000h
    je sub_100B2279
    cmp cmp eax, 072500000h
    jne sub_100B233C
    push push 74
    jmp sub_100B22F8
    push push 73
    jmp sub_100B22FC
    push push 72
    jmp sub_100B2300
    push push 71
    jmp sub_100B2304
    mov mov ecx, esi
    call sub_100AFF84
    jmp sub_100B2314
    mov mov ecx, esi
    call sub_100CBBB6
    jmp sub_100B231D
    mov mov ecx, esi
    call sub_100CB22D
    jmp sub_100B2326
    push push 82
    jmp sub_100B2323
    cmp cmp eax, 072700000h
    je sub_100B2328
    cmp cmp eax, 072800000h
    je sub_100B232B
    cmp cmp eax, 072900000h
    je sub_100B232E
    cmp cmp eax, 072A00000h
    je sub_100B2331
    cmp cmp eax, 072B00000h
    je sub_100B2334
    cmp cmp eax, 072E00000h
    jne sub_100B2395
    mov mov ecx, esi
    call sub_100AFCCF
    jmp sub_100B235D
    push push 83
    jmp sub_100B235A
    push push 76
    jmp sub_100B235E
    push push 77
    jmp sub_100B2362
    push push 70
    jmp sub_100B2366
    push push 69
    mov mov ecx, esi
    call sub_100AFBA5
    cmp cmp eax, 080004001h
    je sub_100B23BE
    test test eax, eax
    jl sub_100B2398
    inc inc ebx
    cmp cmp ebx, dword ptr [ebp + 12]
    jb L14
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret 8
    mov mov eax, dword ptr [esi + 0100h]
    push push 0101179B4h
L13:
    push push 0119Fh
    push push dword ptr [eax + 60]
    push push esi
L15:
    call sub_1008B3EB
    add add esp, 16
L16:
    mov mov eax, 080004005h
    jmp sub_100B23CE
    mov mov eax, dword ptr [esi + 0100h]
    push push 010115D38h
    push push 011B4h
    push push dword ptr [eax + 60]
    push push esi
    call sub_1008B40E
    add add esp, 16
    mov mov eax, 080004001h
    jmp sub_100B23F1
FUN_100b1d78 ENDP
END
