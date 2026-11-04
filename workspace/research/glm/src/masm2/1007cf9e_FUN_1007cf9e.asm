.686
.MODEL FLAT, C
EXTRN sub_1006387E:PROC
EXTRN sub_1006390D:PROC
EXTRN sub_10063D09:PROC
EXTRN sub_1006DCE2:PROC
EXTRN sub_1006DDC1:PROC
EXTRN sub_1006DE25:PROC
EXTRN sub_1006DFAA:PROC
EXTRN sub_1006E060:PROC
EXTRN sub_1006E075:PROC
EXTRN sub_1006E098:PROC
EXTRN sub_1006E0C2:PROC
EXTRN sub_1007AE73:PROC
EXTRN sub_1007B89C:PROC
EXTRN sub_1007D490:PROC
EXTRN sub_1007D4A2:PROC
EXTRN sub_1007D4B5:PROC
EXTRN sub_1007D4B6:PROC
EXTRN sub_1007D4BB:PROC
EXTRN sub_1007D4C6:PROC
EXTRN sub_1007D4C7:PROC
EXTRN sub_1007D4DB:PROC
EXTRN sub_1007D4E0:PROC
EXTRN sub_1007D4EE:PROC
EXTRN sub_1007D4F0:PROC
EXTRN sub_1007D4F7:PROC
EXTRN sub_1007D526:PROC
EXTRN sub_1007D534:PROC
EXTRN sub_1007D53C:PROC
EXTRN sub_1007D543:PROC
EXTRN sub_1007D547:PROC
EXTRN sub_1007D552:PROC
EXTRN sub_1007D568:PROC
EXTRN sub_1007D572:PROC
EXTRN sub_1007D580:PROC
EXTRN sub_1007D59C:PROC
EXTRN sub_1007D5EC:PROC
EXTRN sub_1007D627:PROC
EXTRN sub_1007D636:PROC
EXTRN sub_1007D64E:PROC
EXTRN sub_1007D678:PROC
EXTRN sub_1007D6BB:PROC
EXTRN sub_1007D738:PROC
EXTRN sub_1007D775:PROC
EXTRN sub_1007D77D:PROC
EXTRN sub_1007D780:PROC
EXTRN sub_1007D792:PROC
EXTRN sub_1007D7B3:PROC
EXTRN sub_1007D7BE:PROC
EXTRN sub_1007D7CF:PROC
EXTRN sub_1007D7DC:PROC
EXTRN sub_1007D810:PROC
EXTRN sub_1007D812:PROC
EXTRN sub_1007D87F:PROC
EXTRN sub_1007D89A:PROC
EXTRN sub_1007D8AC:PROC
EXTRN sub_1007D8AD:PROC
EXTRN sub_1007D8BE:PROC
EXTRN sub_1007D8C6:PROC
EXTRN sub_1007D8E3:PROC
EXTRN sub_1007D8EE:PROC
EXTRN sub_1007D8FB:PROC
EXTRN sub_1007D91E:PROC
EXTRN sub_10082665:PROC
EXTRN sub_10082B81:PROC
EXTRN sub_10085B8F:PROC
EXTRN sub_10085CBD:PROC
EXTRN sub_10086105:PROC
EXTRN sub_10086236:PROC
EXTRN sub_100996BE:PROC
EXTRN sub_1009AE20:PROC
EXTRN sub_100A4B59:PROC
EXTRN sub_100A4BC9:PROC
EXTRN sub_100A7116:PROC
EXTRN sub_100B2EAE:PROC
EXTRN sub_100B5E59:PROC
EXTRN sub_100B86D8:PROC
EXTRN sub_100B884B:PROC
EXTRN sub_100F78C8:PROC
EXTRN sub_100F7944:PROC
EXTRN sub_100F7A88:PROC
EXTRN sub_100F7AB3:PROC
EXTRN sub_100F7AFD:PROC
EXTRN sub_100F7B1E:PROC
EXTRN sub_100F7B49:PROC
EXTRN sub_100F7BFD:PROC
EXTRN sub_100F7D33:PROC
.CODE
FUN_1007cf9e PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 094h
    push push ebx
    push push esi
    push push edi
    push push 010000h
    mov mov esi, ecx
    push push 0100000h
    lea lea ecx, [ebp - 52]
    call sub_10082665
    mov mov ebx, dword ptr [ebp + 40]
    xor xor edi, edi
    test test ebx, 0FFFFF800h
    mov mov dword ptr [ebp - 8], edi
    mov mov dword ptr [ebp - 12], edi
    je L0
    mov mov ebx, 08876086Ch
    jmp sub_1007D4BB
    cmp cmp dword ptr [ebp + 12], edi
    je L3
    test test bl, 24
    jne L1
    cmp cmp dword ptr [ebp + 44], edi
    je L2
    mov mov ecx, dword ptr [esi + 8]
    cmp cmp ecx, edi
    je L4
    mov mov eax, dword ptr [ecx]
    push push 1
    call call dword ptr [eax]
    push push dword ptr [esi + 24]
    call sub_100F78C8
    mov mov eax, dword ptr [ebp + 8]
    or or dword ptr [esi + 72], -1
    cmp cmp dword ptr [ebp + 24], edi
    pop pop ecx
    mov mov ecx, dword ptr [ebp + 32]
    mov mov dword ptr [esi], eax
    mov mov eax, dword ptr [ebp + 36]
    mov mov dword ptr [esi + 4], edi
    mov mov dword ptr [esi + 8], edi
    mov mov dword ptr [esi + 24], edi
    mov mov dword ptr [esi + 28], edi
    mov mov dword ptr [esi + 76], edi
    mov mov dword ptr [esi + 80], edi
    mov mov dword ptr [esi + 84], edi
    mov mov dword ptr [esi + 88], edi
    mov mov dword ptr [esi + 92], edi
    mov mov dword ptr [esi + 96], edi
    mov mov dword ptr [esi + 100], edi
    mov mov dword ptr [esi + 12], eax
    mov mov dword ptr [esi + 20], ebx
    mov mov dword ptr [esi + 56], edi
    mov mov dword ptr [esi + 60], edi
    mov mov dword ptr [esi + 64], edi
    mov mov dword ptr [esi + 68], edi
    mov mov dword ptr [esi + 104], edi
    mov mov dword ptr [esi + 108], edi
    mov mov dword ptr [esi + 112], edi
    mov mov dword ptr [esi + 116], edi
    mov mov dword ptr [esi + 120], edi
    mov mov dword ptr [esi + 124], edi
    mov mov dword ptr [esi + 080h], edi
    mov mov dword ptr [esi + 084h], ecx
    je L6
    push push 01FCh
    mov mov dword ptr [esi + 16], 046580200h
    call sub_100F7944
    cmp cmp eax, edi
    pop pop ecx
    je L7
    mov mov ecx, eax
    call sub_100B86D8
    jmp L8
    xor xor eax, eax
    or or byte ptr [esi + 21], 1
    jmp L24
    test test bl, 0C0h
    je L10
    lea lea ecx, [ebp - 28]
    push push ecx
    push push 2
    push push eax
    call sub_1006387E
    test test eax, eax
    jge L9
    push push dword ptr [esi + 12]
    push push 01010FCA4h
    push push 0DB2h
    push push edi
    push push esi
    call sub_1006DDC1
    add add esp, 20
    jmp L5
    mov mov eax, dword ptr [ebp - 24]
    mov mov ecx, eax
    mov mov edx, 0FFFF0000h
    and and ecx, edx
    cmp cmp ecx, 0FFFE0000h
    je L11
    cmp cmp ecx, edx
    jne L14
    test test bl, bl
    jns L15
    and and eax, 0FF00h
    or or ebx, 5
    cmp cmp eax, 0300h
    jne L13
    mov mov dword ptr [esi + 12], 01010C4C0h
    jmp L17
    mov mov dword ptr [esi + 12], 01010C4D8h
    jmp L18
    test test bl, 64
    je L19
    and and eax, 0FF00h
    or or ebx, 5
    cmp cmp eax, 0300h
    jne L20
    mov mov dword ptr [esi + 12], 01010C430h
    jmp L21
    mov mov dword ptr [esi + 12], 01010C448h
    lea lea eax, [ebp - 28]
    push push eax
    push push 2
    push push dword ptr [esi + 12]
    call sub_1006390D
    test test eax, eax
    jl L12
    mov mov eax, dword ptr [ebp - 24]
    cmp cmp eax, 0FFFE0100h
    mov mov dword ptr [esi + 16], eax
    mov mov dword ptr [esi + 20], ebx
    jne L22
    mov mov dword ptr [esi + 16], 0FFFE0101h
    mov mov dword ptr [ebp - 8], 1
    cmp cmp dword ptr [esi + 16], 0FFFF0100h
    mov mov edx, 0FFFF0101h
    jne L23
    mov mov dword ptr [esi + 16], edx
    mov mov dword ptr [ebp - 12], 1
    mov mov eax, dword ptr [esi + 16]
    mov mov ecx, 0FFFE03FFh
    cmp cmp eax, ecx
    ja L30
    je L31
    cmp cmp eax, 054580100h
    je L29
    cmp cmp eax, 0FFFE0101h
    je L25
    cmp cmp eax, 0FFFE0200h
    je L26
    cmp cmp eax, 0FFFE0202h
    je L27
    cmp cmp eax, 0FFFE02FFh
    je L28
    cmp cmp eax, 0FFFE0300h
    jmp L32
    push push 01F8h
    call sub_100F7A88
    cmp cmp eax, edi
    pop pop ecx
    je sub_1007D4B5
    push push dword ptr [ebp + 32]
    mov mov ecx, eax
    call sub_100B5E59
    jmp sub_1007D4C6
    or or ebx, 0100h
    push push 01FCh
    mov mov dword ptr [esi + 20], ebx
    call sub_100F7AB3
    cmp cmp eax, edi
    pop pop ecx
    je sub_1007D4E0
    mov mov ecx, eax
    call sub_100B884B
    jmp sub_1007D4EE
    mov mov ecx, 0FFFF02FFh
    cmp cmp eax, ecx
    ja sub_1007D4C7
    je sub_1007D490
    cmp cmp eax, edx
    jb sub_1007D4DB
    cmp cmp eax, 0FFFF0104h
    jbe sub_1007D4B6
    cmp cmp eax, 0FFFF0200h
    je sub_1007D4A2
    cmp cmp eax, 0FFFF0201h
    jbe sub_1007D4F0
    cmp cmp eax, 0FFFF0203h
    ja sub_1007D4F7
    push push 022Ch
    call sub_100F7AFD
    cmp cmp eax, edi
    pop pop ecx
    je sub_1007D526
    push push dword ptr [ebp + 32]
    mov mov ecx, eax
    call sub_100B2EAE
    jmp sub_1007D534
    and and ebx, -5
    push push 0484h
    mov mov dword ptr [esi + 20], ebx
L13:
    call sub_100F7B1E
    cmp cmp eax, edi
    pop pop ecx
    je sub_1007D547
    mov mov ecx, eax
    call sub_100A7116
    jmp sub_1007D552
    cmp cmp eax, 0FFFF0300h
    je sub_1007D53C
L14:
    cmp cmp eax, 0FFFF03FFh
    je sub_1007D543
    mov mov dword ptr [esi + 8], edi
    jmp sub_1007D568
    push push 01F8h
    call sub_100F7B49
    cmp cmp eax, edi
    pop pop ecx
    je sub_1007D572
    push push dword ptr [ebp + 32]
    mov mov ecx, eax
    call sub_100A4BC9
L18:
    jmp sub_1007D580
    xor xor eax, eax
    mov mov dword ptr [esi + 8], eax
    cmp cmp dword ptr [esi + 8], edi
    jne sub_1007D59C
    mov mov ebx, 08007000Eh
    jmp sub_1007D780
    mov mov eax, dword ptr [ebp + 12]
    cmp cmp eax, edi
    jne sub_1007D5EC
L21:
    lea lea eax, [esi + 4]
    push push eax
    mov mov eax, dword ptr [esi + 20]
    or or eax, 080000000h
    push push eax
    push push dword ptr [esi]
    lea lea ecx, [ebp - 094h]
    call sub_100996BE
    mov mov ecx, eax
    call sub_100A4B59
    lea lea ecx, [ebp - 094h]
    mov mov ebx, eax
    call sub_1009AE20
    cmp cmp ebx, edi
    jl sub_1007D792
    jmp sub_1007D627
    mov mov dword ptr [esi + 4], eax
    cmp cmp dword ptr [ebp - 8], edi
    mov mov ebx, 0DB1h
    je sub_1007D64E
    push push 01010F738h
    push push ebx
    push push edi
    push push esi
    call sub_1006E060
    add add esp, 16
    cmp cmp dword ptr [ebp - 12], edi
    je sub_1007D678
    push push 01010F70Ch
    push push ebx
    push push edi
L22:
    push push esi
    call sub_1006E075
    add add esp, 16
    lea lea ebx, [esi + 088h]
    cmp cmp dword ptr [ebx], edi
    jne sub_1007D6BB
    push push 04000h
    mov mov dword ptr [esi + 08Ch], 01000h
    call sub_100F7BFD
    cmp cmp eax, edi
    pop pop ecx
    mov mov dword ptr [ebx], eax
    je sub_1007D636
    lea lea eax, [ebp - 52]
    push push eax
    call sub_10086105
    lea lea eax, [ebp - 52]
    push push eax
    call sub_10085B8F
    mov mov ecx, esi
    call sub_1007B89C
    mov mov ebx, eax
    cmp cmp ebx, edi
    jl sub_1007D812
    cmp cmp dword ptr [ebp + 24], edi
    mov mov ecx, esi
    je sub_1007D738
    push push dword ptr [ebp + 24]
    call L16
    jmp sub_1007D7B3
    cmp cmp dword ptr [ebp + 16], edi
    je sub_1007D775
    push push dword ptr [ebp + 16]
    call sub_1006DCE2
    cmp cmp eax, edi
    jne sub_1007D77D
    push push dword ptr [ebp + 16]
    push push 01010FC88h
    push push 0DADh
    push push edi
    push push esi
    call sub_1006E098
    add add esp, 20
    jmp sub_1007D7BE
    xor xor ecx, ecx
    jmp sub_1007D7CF
    lea lea eax, [ebp + 16]
    push push eax
    push push dword ptr [ebp + 20]
    call sub_1006DE25
    cmp cmp eax, edi
    jne sub_1007D7DC
L26:
    push push 01010FC68h
    push push 0DADh
    push push edi
    push push esi
    call sub_1006E0C2
    add add esp, 16
L29:
    mov mov ebx, 080004005h
    jmp sub_1007D87F
    xor xor ecx, ecx
    inc inc ecx
    push push ecx
    push push 1
    push push edi
    push push dword ptr [ebp + 28]
    mov mov ecx, esi
    push push eax
    push push dword ptr [ebp + 16]
    call sub_1007AE73
    mov mov ebx, eax
    cmp cmp ebx, edi
    jl sub_1007D89A
    cmp cmp dword ptr [esi + 76], edi
    jne sub_1007D810
    mov mov ecx, esi
    call sub_1006DFAA
    mov mov ebx, eax
    cmp cmp ebx, edi
    jl sub_1007D8AC
    mov mov ecx, dword ptr [esi + 8]
    mov mov eax, dword ptr [ecx]
    lea lea edx, [ebp - 4]
    push push edx
    call call dword ptr [eax + 8]
    mov mov ebx, eax
    cmp cmp ebx, edi
    jl sub_1007D8BE
    cmp cmp dword ptr [ebp + 48], edi
    je sub_1007D8AD
    lea lea eax, [ebp - 16]
    push push eax
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 12]
    push push eax
    call sub_10063D09
    mov mov ebx, eax
    cmp cmp ebx, edi
    jge sub_1007D8C6
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, edi
    je sub_1007D8E3
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    mov mov dword ptr [ebp - 4], edi
    jmp sub_1007D8EE
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ebp + 44]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [ebp + 48]
    cmp cmp eax, edi
    je sub_1007D8FB
    mov mov ecx, dword ptr [ebp - 16]
    mov mov dword ptr [eax], ecx
    xor xor ebx, ebx
    mov mov ecx, dword ptr [esi + 8]
    cmp cmp ecx, edi
    mov mov dword ptr [esi + 4], edi
    je sub_1007D91E
    mov mov eax, dword ptr [ecx]
    push push 1
    call call dword ptr [eax]
    push push dword ptr [esi + 24]
    mov mov dword ptr [esi + 8], edi
    call sub_100F7D33
    pop pop ecx
    push push edi
    mov mov dword ptr [esi + 24], edi
    call sub_10086236
    push push edi
    call sub_10085CBD
    lea lea ecx, [ebp - 52]
    call sub_10082B81
    pop pop edi
    pop pop esi
    mov mov eax, ebx
    pop pop ebx
    leave leave
    ret ret 44
FUN_1007cf9e ENDP
END
