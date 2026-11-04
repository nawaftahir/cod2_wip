.686
.MODEL FLAT, C
EXTRN sub_10082E47:PROC
EXTRN sub_10082E4F:PROC
EXTRN sub_1009962B:PROC
EXTRN sub_10099804:PROC
EXTRN sub_10099B46:PROC
EXTRN sub_10099B7C:PROC
EXTRN sub_10099BAF:PROC
EXTRN sub_10099BE5:PROC
EXTRN sub_10099D9F:PROC
EXTRN sub_10099DB1:PROC
EXTRN sub_1009A22A:PROC
EXTRN sub_1009A242:PROC
EXTRN sub_1009B960:PROC
EXTRN sub_1009BCF8:PROC
EXTRN sub_1009BD03:PROC
EXTRN sub_1009BD07:PROC
EXTRN sub_1009BD0C:PROC
EXTRN sub_1009BD24:PROC
EXTRN sub_1009BD2F:PROC
EXTRN sub_1009BD30:PROC
EXTRN sub_1009BD41:PROC
EXTRN sub_1009BD54:PROC
EXTRN sub_1009BD5F:PROC
EXTRN sub_1009BD77:PROC
EXTRN sub_1009BD86:PROC
EXTRN sub_1009BD91:PROC
EXTRN sub_1009BD95:PROC
EXTRN sub_1009BD96:PROC
EXTRN sub_1009BDA5:PROC
EXTRN sub_1009BDC6:PROC
EXTRN sub_1009BDEA:PROC
EXTRN sub_1009BE15:PROC
EXTRN sub_1009BE1E:PROC
EXTRN sub_1009BE2B:PROC
EXTRN sub_1009BE33:PROC
EXTRN sub_1009BE3D:PROC
EXTRN sub_1009BE4B:PROC
EXTRN sub_1009BE7A:PROC
EXTRN sub_1009BE82:PROC
EXTRN sub_1009BE92:PROC
EXTRN sub_1009BE9F:PROC
EXTRN sub_1009BEAA:PROC
EXTRN sub_1009BEBD:PROC
EXTRN sub_1009BEC6:PROC
EXTRN sub_1009BEC9:PROC
EXTRN sub_1009BEDA:PROC
EXTRN sub_1009BEEA:PROC
EXTRN sub_1009BEF3:PROC
EXTRN sub_1009BEFC:PROC
EXTRN sub_1009BF05:PROC
EXTRN sub_1009BF1A:PROC
EXTRN sub_1009BF23:PROC
EXTRN sub_1009BF2C:PROC
EXTRN sub_1009BF31:PROC
EXTRN sub_1009BF3C:PROC
EXTRN sub_1009BF5D:PROC
.CODE
FUN_1009b99e PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 024Ch
    cmp cmp dword ptr [ebp + 24], 0
    push push ebx
    push push esi
    push push edi
    mov mov dword ptr [ebp - 4], ecx
    jne L19
    mov mov esi, dword ptr [ebp + 16]
    test test esi, esi
    je L20
    cmp cmp dword ptr [ebp + 20], 0
    je L2
    lea lea ecx, [ebp - 40]
    call sub_10082E47
    lea lea ecx, [ebp - 76]
    call sub_10082E4F
    cmp cmp dword ptr [esi + 4], 9
    push push 4
    pop pop ebx
    je L0
    push push dword ptr [ebp + 16]
    mov mov ecx, dword ptr [ebp - 4]
    xor xor edi, edi
    inc inc edi
    lea lea esi, [ebp - 40]
    mov mov dword ptr [ebp - 24], ebx
    mov mov dword ptr [ebp - 16], edi
    call sub_10099BAF
    push push dword ptr [ebp + 16]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov dword ptr [ebp - 12], eax
    call sub_10099B46
    test test eax, eax
    je L1
    mov mov dword ptr [ebp - 24], edi
    mov mov edi, dword ptr [ebp + 20]
    cmp cmp dword ptr [edi + 4], 9
    je L3
    push push dword ptr [ebp + 20]
    mov mov ecx, dword ptr [ebp - 4]
    lea lea edi, [ebp - 76]
    mov mov dword ptr [ebp - 60], ebx
    mov mov dword ptr [ebp - 52], 1
    call sub_10099BE5
    push push dword ptr [ebp + 20]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov dword ptr [ebp - 48], eax
    call sub_10099B7C
    test test eax, eax
    je L4
    xor xor edx, edx
    inc inc edx
    mov mov dword ptr [ebp - 60], edx
    jmp L5
    xor xor edx, edx
    inc inc edx
    mov mov ecx, dword ptr [esi + 16]
    cmp cmp ecx, ebx
    je sub_1009BCF8
L0:
    mov mov eax, dword ptr [edi + 16]
    cmp cmp eax, ebx
    je sub_1009BD03
    test test ecx, ecx
    je L13
    cmp cmp ecx, edx
    jne L9
    test test eax, eax
    je sub_1009BD86
    cmp cmp eax, edx
    jne L6
    mov mov eax, dword ptr [esi + 28]
    cmp cmp eax, dword ptr [edi + 28]
    jbe sub_1009BD96
    mov mov edi, 010114ADCh
    push push dword ptr [ebp + 16]
    mov mov ebx, dword ptr [ebp - 4]
    mov mov esi, 0FFh
    push push esi
    lea lea eax, [ebp - 014Ch]
    push push eax
    mov mov ecx, ebx
    call sub_10099D9F
    push push dword ptr [ebp + 20]
    lea lea eax, [ebp - 024Ch]
    push push esi
    push push eax
    mov mov ecx, ebx
    call sub_10099DB1
    cmp cmp dword ptr [ebp + 12], 0
    lea lea eax, [ebp - 014Ch]
    push push eax
    lea lea eax, [ebp - 024Ch]
    push push eax
    push push edi
    jne sub_1009BDEA
    push push 010114AB8h
    push push 0BC9h
    push push dword ptr [ebp + 8]
    push push ebx
    call sub_1009962B
    add add esp, 28
    jmp sub_1009BE1E
    cmp cmp eax, 2
    jne sub_1009BD07
    mov mov eax, dword ptr [edi + 24]
    cmp cmp eax, edx
    jne L12
    mov mov ecx, dword ptr [esi + 28]
    cmp cmp ecx, dword ptr [edi + 28]
    ja L7
    mov mov edi, dword ptr [edi + 28]
    cmp cmp edi, edx
    jne L15
    cmp cmp dword ptr [esi + 28], eax
    ja L8
    cmp cmp eax, edx
    je sub_1009BE2B
    cmp cmp edi, edx
    je sub_1009BE33
    imul imul eax, edi
    cmp cmp eax, dword ptr [esi + 28]
    jmp sub_1009BDC6
    cmp cmp ecx, 2
    jne sub_1009BD54
    test test eax, eax
    je sub_1009BE4B
    cmp cmp eax, edx
    jne sub_1009BD30
    mov mov eax, dword ptr [esi + 24]
    cmp cmp eax, edx
    jne sub_1009BD0C
    mov mov ecx, dword ptr [esi + 28]
    cmp cmp ecx, dword ptr [edi + 28]
    ja L10
    mov mov esi, dword ptr [esi + 28]
    cmp cmp esi, edx
    jne sub_1009BD2F
    cmp cmp eax, dword ptr [edi + 28]
    ja L11
    cmp cmp eax, edx
    je sub_1009BE7A
    cmp cmp esi, edx
    je sub_1009BE82
    imul imul eax, esi
    cmp cmp eax, dword ptr [edi + 28]
    jmp sub_1009BE15
    cmp cmp eax, 2
    jne sub_1009BD95
    mov mov eax, dword ptr [esi + 24]
    cmp cmp eax, dword ptr [edi + 24]
    ja L14
    mov mov eax, dword ptr [esi + 28]
    cmp cmp eax, dword ptr [edi + 28]
    jbe sub_1009BEAA
    jmp L16
    cmp cmp eax, 3
    je L17
    jmp sub_1009BEBD
    cmp cmp ecx, 3
    jne sub_1009BEC6
    cmp cmp eax, ecx
    jne L18
    mov mov edi, dword ptr [edi + 20]
    cmp cmp edi, 13
    je sub_1009BEDA
    cmp cmp edi, 15
    jne sub_1009BE3D
    mov mov esi, dword ptr [esi + 20]
    cmp cmp esi, edi
    je sub_1009BEEA
    cmp cmp esi, 16
    je sub_1009BEF3
    cmp cmp esi, 17
    je sub_1009BEFC
    cmp cmp esi, 18
    je sub_1009BF05
    cmp cmp esi, 19
    jmp sub_1009BE92
    cmp cmp edi, 20
    jne sub_1009BE9F
    mov mov esi, dword ptr [esi + 20]
    cmp cmp esi, edi
L8:
    je sub_1009BF1A
    cmp cmp esi, 21
    je sub_1009BF23
    cmp cmp esi, 22
    je sub_1009BF2C
    cmp cmp esi, 23
    je sub_1009BF31
    cmp cmp esi, 24
    jne sub_1009BD24
    jmp sub_1009BF3C
    cmp cmp dword ptr [esi + 20], edi
    jmp sub_1009BEC9
    mov mov ebx, dword ptr [esi + 28]
    mov mov eax, dword ptr [edi + 28]
    imul imul ebx, dword ptr [esi + 24]
    imul imul eax, dword ptr [edi + 24]
    cmp cmp ebx, eax
    ja sub_1009BD41
    xor xor esi, esi
    test test ebx, ebx
    jbe sub_1009BF5D
    mov mov ecx, dword ptr [ebp - 4]
    lea lea eax, [ebp - 40]
L11:
    push push eax
    push push esi
    push push dword ptr [ebp + 16]
    call sub_1009A22A
    test test eax, eax
    jl sub_1009BD5F
    mov mov ecx, dword ptr [ebp - 4]
    lea lea eax, [ebp - 76]
    push push eax
    push push esi
    push push dword ptr [ebp + 20]
L13:
    call sub_1009A242
    test test eax, eax
    jl sub_1009BD77
    mov mov ecx, dword ptr [ebp - 4]
    push push 1
    lea lea eax, [ebp - 76]
    push push eax
    lea lea eax, [ebp - 40]
    push push eax
    call sub_1009B960
    test test eax, eax
    je sub_1009BD91
    inc inc esi
    cmp cmp esi, ebx
    jb sub_1009BF5D
    mov mov edi, 01019166Eh
    jmp sub_1009BDA5
    push push dword ptr [ebp + 12]
    push push 010114A8Ch
    push push 0BC9h
    push push dword ptr [ebp + 8]
    push push ebx
L19:
    call sub_10099804
    add add esp, 32
    pop pop edi
    pop pop esi
    pop pop ebx
L20:
    leave leave
    ret ret 20
FUN_1009b99e ENDP
END
