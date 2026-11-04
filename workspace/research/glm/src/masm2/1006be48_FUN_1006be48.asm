.686
.MODEL FLAT, C
EXTRN sub_10063852:PROC
EXTRN sub_10063EEB:PROC
EXTRN sub_10063F13:PROC
EXTRN sub_10063F54:PROC
EXTRN sub_1006429F:PROC
EXTRN sub_10067893:PROC
EXTRN sub_10067B70:PROC
EXTRN sub_10067D41:PROC
EXTRN sub_10067E34:PROC
EXTRN sub_10067E58:PROC
EXTRN sub_10067F87:PROC
EXTRN sub_10069BB8:PROC
EXTRN sub_10069C50:PROC
EXTRN sub_10069C89:PROC
EXTRN sub_10069D25:PROC
EXTRN sub_1006A56C:PROC
EXTRN sub_1006A817:PROC
EXTRN sub_1006AAE9:PROC
EXTRN sub_1006ABA4:PROC
EXTRN sub_1006AC80:PROC
EXTRN sub_1006AD1E:PROC
EXTRN sub_1006BC35:PROC
EXTRN sub_1006C307:PROC
EXTRN sub_1006C313:PROC
EXTRN sub_1006C319:PROC
EXTRN sub_1006C31D:PROC
EXTRN sub_1006C31F:PROC
EXTRN sub_1006C32B:PROC
EXTRN sub_1006C32C:PROC
EXTRN sub_1006C32D:PROC
EXTRN sub_1006C32F:PROC
EXTRN sub_1006C331:PROC
EXTRN sub_1006C333:PROC
EXTRN sub_1006C336:PROC
EXTRN sub_1006C338:PROC
EXTRN sub_1006C33A:PROC
EXTRN sub_1006C33C:PROC
EXTRN sub_1006C382:PROC
EXTRN sub_1006C38B:PROC
EXTRN sub_1006C394:PROC
EXTRN sub_1006C39D:PROC
EXTRN sub_1006C3A6:PROC
EXTRN sub_1006C3AF:PROC
EXTRN sub_1006C3BA:PROC
EXTRN sub_1006C3CA:PROC
EXTRN sub_1006C3E4:PROC
EXTRN sub_1006C404:PROC
EXTRN sub_1006C412:PROC
EXTRN sub_1006C42C:PROC
EXTRN sub_1006C456:PROC
EXTRN sub_1006C465:PROC
EXTRN sub_1006C46A:PROC
EXTRN sub_1006C488:PROC
EXTRN sub_1006C4A0:PROC
EXTRN sub_1006C4A5:PROC
EXTRN sub_1006C4B3:PROC
EXTRN sub_1006C517:PROC
EXTRN sub_1006C537:PROC
EXTRN sub_1006C552:PROC
EXTRN sub_1006C562:PROC
EXTRN sub_1006C56B:PROC
EXTRN sub_1006C5F0:PROC
EXTRN sub_1006C5FF:PROC
EXTRN sub_1006C647:PROC
EXTRN sub_1006C65E:PROC
EXTRN sub_1006C667:PROC
EXTRN sub_1006C671:PROC
EXTRN sub_1006C683:PROC
EXTRN sub_1006C685:PROC
EXTRN sub_1006C69A:PROC
EXTRN sub_1006C6A9:PROC
EXTRN sub_1006C6F8:PROC
EXTRN sub_1006C70B:PROC
EXTRN sub_1006C716:PROC
EXTRN sub_1006C71D:PROC
EXTRN sub_1006C72E:PROC
EXTRN sub_1006C741:PROC
EXTRN sub_1006C769:PROC
EXTRN sub_1006C774:PROC
EXTRN sub_1006C78D:PROC
EXTRN sub_100F78A1:PROC
EXTRN sub_100F7B3D:PROC
EXTRN EXTRN fp_1010C04C:DWORD:DWORD
EXTRN EXTRN fp_1010C050:DWORD:DWORD
EXTRN EXTRN fp_1010C07C:DWORD:DWORD
EXTRN EXTRN g_101AC958:DWORD:DWORD
.CODE
FUN_1006be48 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 16
    test test dword ptr [ebp + 12], 0FFFFFF3Ch
    push push esi
    mov mov esi, ecx
    je L0
    mov mov eax, 08876086Ch
    jmp sub_1006C319
    mov mov eax, dword ptr [ebp + 20]
    push push ebx
    xor xor ebx, ebx
    cmp cmp eax, ebx
    jne L1
    mov mov eax, 08876086Ch
    jmp sub_1006C32C
L0:
    mov mov dword ptr [eax], ebx
    push push dword ptr [esi + 88]
    call sub_100F78A1
    pop pop ecx
    mov mov ecx, dword ptr [esi + 120]
    cmp cmp ecx, ebx
    je L2
    push push 1
    call sub_1006AC80
    mov mov ecx, dword ptr [ebp + 8]
    mov mov dword ptr [g_101AC958], esi
    or or dword ptr [esi + 56], -1
    lea lea eax, [ecx + 24]
    mov mov dword ptr [esi], eax
    mov mov eax, dword ptr [ebp + 12]
    push push edi
    mov mov dword ptr [esi + 60], eax
    push push ebx
    lea lea eax, [ebp - 4]
    lea lea edi, [esi + 108]
    push push eax
    mov mov dword ptr [esi + 4], ecx
    mov mov dword ptr [esi + 8], ebx
    mov mov dword ptr [esi + 48], ebx
    mov mov dword ptr [esi + 52], ebx
    mov mov dword ptr [esi + 88], ebx
    mov mov dword ptr [esi + 92], ebx
    mov mov dword ptr [esi + 96], ebx
    mov mov dword ptr [esi + 100], ebx
    mov mov dword ptr [esi + 104], ebx
    mov mov dword ptr [esi + 76], ebx
    mov mov dword ptr [esi + 80], ebx
    mov mov dword ptr [esi + 84], ebx
    mov mov dword ptr [edi], ebx
    mov mov dword ptr [esi + 112], ebx
    mov mov dword ptr [esi + 116], ebx
    call sub_10063F13
    cmp cmp dword ptr [ebp - 4], ebx
    jne L3
    mov mov ecx, dword ptr [esi + 4]
    lea lea eax, [esi + 112]
    push push eax
    push push edi
    call sub_10063F54
    mov mov ecx, dword ptr [esi + 4]
    push push 2
    call sub_10063EEB
    cmp cmp eax, ebx
    jl sub_1006C3BA
    mov mov ecx, esi
    call sub_1006AD1E
    cmp cmp dword ptr [esi + 16], 9
    jne L4
    lea lea eax, [ebp - 16]
    push push eax
    push push 1
    push push dword ptr [esi + 24]
    call sub_10063852
    test test eax, eax
    jl L5
    mov mov eax, dword ptr [ebp - 12]
    mov mov dword ptr [esi + 16], ebx
    mov mov dword ptr [esi + 24], eax
    cmp cmp dword ptr [esi + 16], ebx
    je L6
    push push 01010F764h
    push push 07D1h
    lea lea eax, [esi + 16]
    push push eax
    push push dword ptr [esi]
    call sub_10067D41
    add add esp, 16
    mov mov edi, 088760B59h
    jmp sub_1006C3E4
    cmp cmp dword ptr [esi + 24], 0FFFE0100h
    mov mov edi, 07DFh
    jne L7
    push push 01010F738h
    push push edi
    lea lea eax, [esi + 16]
    push push eax
    push push dword ptr [esi]
    call sub_10067E34
    add add esp, 16
    mov mov dword ptr [esi + 24], 0FFFE0101h
    cmp cmp dword ptr [esi + 24], 0FFFF0100h
    jne L8
    push push 01010F70Ch
    push push edi
    lea lea eax, [esi + 16]
    push push eax
    push push dword ptr [esi]
    call sub_10067E58
    add add esp, 16
    mov mov dword ptr [esi + 24], 0FFFF0101h
    cmp cmp dword ptr [esi + 24], 0FFFF0202h
    mov mov edi, 0FFFF0201h
    jne L9
    mov mov dword ptr [esi + 24], edi
    test test byte ptr [ebp + 12], 64
    mov mov eax, 0FFFF0000h
    je L10
    mov mov ecx, dword ptr [esi + 24]
    and and ecx, eax
    cmp cmp ecx, 0FFFE0000h
    je L11
    test test byte ptr [ebp + 12], 080h
    je L12
    mov mov ecx, dword ptr [esi + 24]
    and and ecx, eax
    cmp cmp ecx, eax
    jne L13
    or or dword ptr [esi + 60], 1
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, 0FFFF0102h
    cmp cmp eax, ecx
    ja L22
    je L21
    cmp cmp eax, 0FFFE0101h
    je L20
    cmp cmp eax, 0FFFE0200h
    je L19
    cmp cmp eax, 0FFFE0201h
    je L18
    cmp cmp eax, 0FFFE02FFh
L5:
    je L17
    cmp cmp eax, 0FFFE0300h
    je L16
    cmp cmp eax, 0FFFE03FFh
    je L15
    cmp cmp eax, 0FFFF0101h
    jne L23
    mov mov dword ptr [esi + 56], 6
    jmp L24
    mov mov dword ptr [esi + 56], 5
    jmp L25
    mov mov dword ptr [esi + 56], 4
    jmp sub_1006C307
    mov mov dword ptr [esi + 56], 3
    jmp sub_1006C313
    mov mov dword ptr [esi + 56], 2
    jmp sub_1006C31F
    mov mov dword ptr [esi + 56], 1
    jmp sub_1006C32B
    mov mov dword ptr [esi + 56], ebx
    jmp sub_1006C333
    mov mov dword ptr [esi + 56], 7
    jmp sub_1006C33C
    cmp cmp eax, 0FFFF0103h
    je sub_1006C33C
    cmp cmp eax, 0FFFF0104h
    je sub_1006C33A
    cmp cmp eax, 0FFFF0200h
    je sub_1006C338
    cmp cmp eax, edi
    je sub_1006C333
    cmp cmp eax, 0FFFF02FFh
    je sub_1006C331
    cmp cmp eax, 0FFFF0300h
    je sub_1006C32F
    cmp cmp eax, 0FFFF03FFh
    je sub_1006C32D
    push push 01010F6F0h
    push push 07D2h
    jmp L14
    mov mov dword ptr [esi + 56], 14
    jmp sub_1006C382
    mov mov dword ptr [esi + 56], 13
    jmp sub_1006C38B
    mov mov dword ptr [esi + 56], 12
    jmp sub_1006C394
    mov mov dword ptr [esi + 56], 11
    jmp sub_1006C39D
    mov mov dword ptr [esi + 56], 10
    jmp sub_1006C3A6
    mov mov dword ptr [esi + 56], 9
    jmp sub_1006C3AF
    mov mov dword ptr [esi + 56], 8
    mov mov eax, dword ptr [ebp + 16]
    cmp cmp eax, ebx
    je sub_1006C456
    or or dword ptr [esi + 60], 2
    push push 0B8h
    mov mov dword ptr [esi + 124], eax
    call sub_100F7B3D
    cmp cmp eax, ebx
    pop pop ecx
    je sub_1006C404
    push push dword ptr [esi + 56]
    mov mov ecx, eax
    call sub_1006AAE9
    jmp sub_1006C412
    xor xor eax, eax
    cmp cmp eax, ebx
    mov mov dword ptr [esi + 120], eax
    jne sub_1006C42C
    mov mov eax, 08007000Eh
    jmp sub_1006C5F0
    mov mov eax, dword ptr [esi + 56]
    cmp cmp eax, ebx
    jl sub_1006C465
    cmp cmp eax, 5
    jg sub_1006C46A
    movzx movzx eax, byte ptr [esi + 25]
    or or eax, 07FFE00h
    mov mov ecx, dword ptr [esi + 24]
    shl shl eax, 8
    and and ecx, 0FFh
    or or eax, ecx
    mov mov dword ptr [esi + 24], eax
    jmp sub_1006C4B3
    cmp cmp eax, 10
    jl sub_1006C4A0
    cmp cmp eax, 14
    jg sub_1006C4A5
    movzx movzx eax, byte ptr [esi + 25]
    or or eax, 07FFF00h
    jmp sub_1006C488
    push push 01010F688h
    push push 07D1h
    lea lea eax, [esi + 16]
    push push eax
    push push dword ptr [esi]
    call sub_10067F87
    add add esp, 16
    test test byte ptr [esi + 60], 2
    jne sub_1006C537
    mov mov edi, 01010F67Ch
    push push edi
    call dword ptr [fp_1010C07C]
    cmp cmp eax, ebx
    jne sub_1006C517
    push push edi
    call dword ptr [fp_1010C050]
    cmp cmp eax, ebx
    je sub_1006C552
    push push 01010F65Ch
L14:
    push push eax
    call dword ptr [fp_1010C04C]
    cmp cmp eax, ebx
    je sub_1006C562
    call call eax
    cmp cmp eax, ebx
    mov mov dword ptr [esi + 8], eax
    je sub_1006C56B
    mov mov ecx, dword ptr [eax]
    push push ebx
    push push esi
    push push 010068D02h
    push push eax
    call call dword ptr [ecx + 12]
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_1006C671
    push push dword ptr [esi + 24]
    mov mov ecx, esi
    call sub_10069C89
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_1006C685
    lea lea eax, [esi + 16]
    push push eax
    mov mov ecx, esi
    call sub_10069BB8
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_1006C69A
    cmp cmp dword ptr [esi + 76], ebx
L15:
    jne sub_1006C31D
    call sub_1006BC35
    test test eax, eax
    je sub_1006C5FF
L18:
    mov mov dword ptr [esi + 76], 1
    cmp cmp dword ptr [esi + 76], ebx
L20:
    jne sub_1006C336
    cmp cmp dword ptr [esi + 108], ebx
    je sub_1006C647
    mov mov ecx, dword ptr [esi + 4]
    push push ebx
    lea lea eax, [ebp + 12]
    push push eax
    call sub_1006429F
    mov mov ecx, dword ptr [esi + 108]
    mov mov eax, dword ptr [ebp + 12]
    cmp cmp ecx, eax
    jae sub_1006C65E
    mov mov edx, dword ptr [esi + 112]
    add add edx, ecx
    cmp cmp edx, eax
    jbe sub_1006C667
    sub sub eax, ecx
    mov mov dword ptr [esi + 112], eax
    cmp cmp dword ptr [esi + 120], ebx
    je sub_1006C683
    mov mov ecx, esi
    call sub_1006A56C
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_1006C6F8
    test test byte ptr [esi + 60], 1
    je sub_1006C6A9
    mov mov ecx, esi
    call sub_1006A817
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_1006C70B
    push push 0FFFFh
    mov mov ecx, esi
    call sub_10069D25
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_1006C71D
    lea lea eax, [esi + 16]
    push push eax
    mov mov ecx, esi
L23:
    call sub_10069C50
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_1006C72E
    mov mov eax, dword ptr [esi + 8]
    cmp cmp eax, ebx
    je sub_1006C716
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 20]
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_1006C741
    mov mov ecx, dword ptr [esi]
    call sub_10067B70
    test test eax, eax
    jne sub_1006C3CA
    push push dword ptr [ebp + 20]
    mov mov ecx, esi
    call sub_1006ABA4
    mov mov edi, eax
    cmp cmp edi, ebx
    jge sub_1006C769
    mov mov dword ptr [esi + 76], 1
    jmp sub_1006C774
    xor xor edi, edi
    mov mov eax, dword ptr [esi + 8]
    cmp cmp eax, ebx
    je sub_1006C78D
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    mov mov dword ptr [esi + 8], ebx
L24:
    mov mov ecx, dword ptr [esi + 4]
    call sub_10067893
    mov mov eax, edi
    pop pop edi
    pop pop ebx
L25:
    pop pop esi
    leave leave
    ret ret 16
FUN_1006be48 ENDP
END
