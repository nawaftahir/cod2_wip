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
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    xor ebx, ebx
    cmp dword ptr [ebp + 12], ebx
    push edi
    mov esi, ecx
    jbe L38
L0:
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [esi + 0000000FCh], ebx
    mov eax, dword ptr [eax + ebx*4]
    test eax, eax
    mov dword ptr [esi + 000000100h], eax
    je L37
    mov eax, dword ptr [eax + 60]
    test eax, eax
    je L1
    cmp dword ptr [eax + 4], 13
    jne L1
    add eax, 48
    mov dword ptr [esi + 000000104h], eax
L1:
    mov edi, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [edi]
    test ecx, ecx
    je L37
    mov eax, dword ptr [edi + 8]
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [edx + eax*4]
    cmp dword ptr [eax + 8], -1
    jne L40
    mov eax, ecx
    and eax, 0FFF00000h
    cmp eax, 070300000h
    ja L21
    je L27
    cmp eax, 050000000h
    ja L18
    je L8
    test eax, eax
    je L37
    cmp eax, 010000000h
    je L7
    cmp eax, 010100000h
    je L6
    cmp eax, 011000000h
    je L5
    cmp eax, 020400000h
    je L4
    cmp eax, 020500000h
    je L3
    cmp eax, 030000000h
    jne L41
    mov eax, dword ptr [esi + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000104h
    jne L2
    mov ecx, esi
    call sub_100CB9EA
    jmp L36
L2:
    mov eax, 080004001h
    jmp L36
L3:
    mov ecx, esi
    call sub_100CB92F
    jmp L36
L4:
    mov ecx, esi
    call sub_100CB931
    jmp L36
L5:
    mov ecx, esi
    call sub_100CA55C
    jmp L36
L6:
    mov ecx, esi
    call sub_100CAD5C
    jmp L36
L7:
    mov ecx, esi
    call sub_100CB75E
    jmp L36
L8:
    and ecx, 0000FFFFFh
    cmp ecx, 2
    je L41
    cmp ecx, 4
    jne L9
    mov eax, dword ptr [esi + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000101h
    je L16
L9:
    mov eax, dword ptr [esi + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000102h
    je L10
    cmp eax, 000000103h
    jne L17
L10:
    cmp ecx, 4
    jne L17
    mov eax, dword ptr [edi + 16]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [edx + eax*4]
    mov eax, dword ptr [edi + 8]
    mov edi, dword ptr [eax]
    mov eax, dword ptr [eax + 16]
    mov edi, dword ptr [edx + edi*4]
    mov edx, dword ptr [edx + eax*4]
    mov eax, dword ptr [ecx + 4]
    cmp eax, dword ptr [esi + 000000084h]
    jne L13
    mov ecx, dword ptr [ecx + 108]
    mov eax, dword ptr [esi + 000000088h]
    and ecx, 0000000FFh
    cmp dword ptr [edi + 4], eax
    jne L11
    cmp dword ptr [edi + 12], 0
    je L12
L11:
    cmp dword ptr [edx + 4], eax
    jne L17
    cmp dword ptr [edx + 12], 0
    jne L17
L12:
    cmp ecx, 1
    jmp L15
L13:
    cmp dword ptr [edi + 4], eax
    jne L14
    mov edi, dword ptr [edi + 12]
    cmp edi, dword ptr [ecx + 12]
    je L16
L14:
    cmp dword ptr [edx + 4], eax
    jne L17
    mov eax, dword ptr [edx + 12]
    cmp eax, dword ptr [ecx + 12]
L15:
    jne L17
L16:
    mov ecx, esi
    call sub_100AF93A
    jmp L36
L17:
    mov ecx, esi
    call sub_100CBA38
    jmp L36
L18:
    cmp eax, 060000000h
    je L20
    cmp eax, 060500000h
    je L20
    cmp eax, 060700000h
    je L19
    cmp eax, 060A00000h
    je L20
    cmp eax, 060F00000h
    je L20
    cmp eax, 070100000h
    jne L41
    mov ecx, esi
    call sub_100CAFE6
    jmp L36
L19:
    mov ecx, esi
    call sub_100AFCF9
    jmp L36
L20:
    mov ecx, esi
    call sub_100AFDD7
    jmp L36
L21:
    mov ecx, 072600000h
    cmp eax, ecx
    ja L29
    je L28
    cmp eax, 070400000h
    je L27
    cmp eax, 070F00000h
    je L26
    cmp eax, 072100000h
    je L25
    cmp eax, 072200000h
    je L24
    cmp eax, 072300000h
    je L23
    cmp eax, 072400000h
    je L22
    cmp eax, 072500000h
    jne L41
    push 74
    jmp L35
L22:
    push 73
    jmp L35
L23:
    push 72
    jmp L35
L24:
    push 71
    jmp L35
L25:
    mov ecx, esi
    call sub_100AFF84
    jmp L36
L26:
    mov ecx, esi
    call sub_100CBBB6
    jmp L36
L27:
    mov ecx, esi
    call sub_100CB22D
    jmp L36
L28:
    push 82
    jmp L35
L29:
    cmp eax, 072700000h
    je L34
    cmp eax, 072800000h
    je L33
    cmp eax, 072900000h
    je L32
    cmp eax, 072A00000h
    je L31
    cmp eax, 072B00000h
    je L30
    cmp eax, 072E00000h
    jne L41
    mov ecx, esi
    call sub_100AFCCF
    jmp L36
L30:
    push 83
    jmp L35
L31:
    push 76
    jmp L35
L32:
    push 77
    jmp L35
L33:
    push 70
    jmp L35
L34:
    push 69
L35:
    mov ecx, esi
    call sub_100AFBA5
L36:
    cmp eax, 080004001h
    je L41
    test eax, eax
    jl L39
L37:
    inc ebx
    cmp ebx, dword ptr [ebp + 12]
    jb L0
L38:
    xor eax, eax
L39:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
L40:
    mov eax, dword ptr [esi + 000000100h]
    push 0101179B4h
    push 00000119Fh
    push dword ptr [eax + 60]
    push esi
    call sub_1008B3EB
    add esp, 16
    mov eax, 080004005h
    jmp L39
L41:
    mov eax, dword ptr [esi + 000000100h]
    push 010115D38h
    push 0000011B4h
    push dword ptr [eax + 60]
    push esi
    call sub_1008B40E
    add esp, 16
    mov eax, 080004001h
    jmp L39
FUN_100b1d78 ENDP
END
