.686
.MODEL FLAT, C
EXTRN sub_100854DA:PROC
EXTRN sub_1008AF24:PROC
EXTRN sub_1008B3F6:PROC
EXTRN sub_1008DCC7:PROC
EXTRN sub_10094EBA:PROC
EXTRN sub_10094EC0:PROC
EXTRN sub_10094EC4:PROC
EXTRN sub_10094EC7:PROC
EXTRN sub_10094ED4:PROC
EXTRN sub_10094EE0:PROC
EXTRN sub_10094EF9:PROC
EXTRN sub_10094F07:PROC
EXTRN sub_10094F11:PROC
EXTRN sub_10094F1E:PROC
EXTRN sub_10094F2A:PROC
EXTRN sub_10094F2C:PROC
EXTRN sub_10094F34:PROC
EXTRN sub_10094F4E:PROC
EXTRN sub_10094F7E:PROC
EXTRN sub_10094F88:PROC
EXTRN sub_10094F93:PROC
EXTRN sub_10094FA6:PROC
EXTRN sub_10094FB0:PROC
EXTRN sub_10094FB8:PROC
EXTRN sub_10094FDE:PROC
EXTRN sub_10094FE8:PROC
EXTRN sub_10095006:PROC
EXTRN sub_10095010:PROC
EXTRN sub_10095030:PROC
EXTRN sub_1009503E:PROC
EXTRN sub_10095047:PROC
EXTRN sub_10095055:PROC
EXTRN sub_10095063:PROC
EXTRN sub_10095078:PROC
EXTRN sub_10095082:PROC
EXTRN sub_1009508F:PROC
EXTRN sub_100950BD:PROC
EXTRN sub_100950C9:PROC
EXTRN sub_100950CB:PROC
EXTRN sub_100950EE:PROC
EXTRN sub_100950F8:PROC
EXTRN sub_1009511C:PROC
EXTRN sub_10095156:PROC
EXTRN sub_1009520C:PROC
EXTRN sub_1009520E:PROC
EXTRN sub_10095214:PROC
EXTRN sub_1009521A:PROC
EXTRN sub_1009521F:PROC
EXTRN sub_10095277:PROC
EXTRN sub_100952A4:PROC
EXTRN sub_100952AE:PROC
EXTRN sub_100952B7:PROC
EXTRN sub_1009536D:PROC
EXTRN sub_1009537B:PROC
.CODE
FUN_100949dc PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 64
    push push esi
    push push edi
    mov mov esi, ecx
    xor xor edi, edi
    mov mov dword ptr [ebp - 44], esi
    mov mov dword ptr [ebp - 56], edi
    call sub_1008AF24
    cmp cmp dword ptr [esi + 12], edi
    mov mov dword ptr [ebp - 48], edi
    jbe sub_10094EC7
    push push ebx
    or or edi, -1
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ebp - 48]
    mov mov ebx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [ebx]
    mov mov ecx, eax
    and and ecx, 0F0000000h
    cmp cmp ecx, 010000000h
    mov mov dword ptr [ebp - 40], ebx
    jb sub_10094ED4
    cmp cmp ecx, 040000000h
    ja sub_10094EE0
    mov mov dword ptr [ebp - 16], eax
    mov mov eax, dword ptr [ebx + 4]
    and and word ptr [ebp - 14], 15
    xor xor edx, edx
    div div dword ptr [ebp - 16]
    mov mov ecx, ebx
    mov mov dword ptr [ebp - 20], eax
    call sub_100854DA
    xor xor ecx, ecx
    mov mov dword ptr [ebp - 60], eax
    mov mov eax, dword ptr [ebp - 16]
    inc inc ecx
    cmp cmp eax, ecx
    mov mov dword ptr [ebp - 24], eax
    mov mov dword ptr [ebp - 8], ecx
    jbe sub_10094F11
    shl shl eax, 2
    mov mov dword ptr [ebp - 36], eax
    add add eax, 4
    mov mov dword ptr [ebp - 12], 4
    mov mov dword ptr [ebp - 32], eax
    mov mov eax, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [ebp - 12]
    mov mov edx, dword ptr [eax + ecx]
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi + 16]
    mov mov dword ptr [ebp - 64], edx
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [edx + 4]
    mov mov eax, dword ptr [eax + edx*4]
    test test word ptr [eax + 4], 01020h
    jne L29
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [ebp - 12], 0
    jbe L31
    mov mov eax, dword ptr [ebp - 36]
    mov mov dword ptr [ebp - 28], eax
    mov mov eax, dword ptr [ebx + 16]
    mov mov edx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + edx*4]
    cmp cmp eax, edi
    je L26
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [eax + 4]
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + edx*4]
    test test word ptr [eax + 4], 01020h
    jne L30
    cmp cmp dword ptr [ebp - 20], 1
    jne L2
    mov mov eax, dword ptr [ebx + 8]
    mov mov edx, dword ptr [ebp - 12]
    mov mov edx, dword ptr [eax + edx]
    cmp cmp edx, edi
    je L0
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [edx + 48]
    jmp L1
    mov mov edx, edi
    mov mov esi, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + esi*4]
    cmp cmp eax, edi
    je L3
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [eax + 48]
    jmp L4
    mov mov eax, edi
    cmp cmp edx, eax
    je sub_10094EC0
    cmp cmp dword ptr [ebp - 20], 2
    jne L14
    mov mov eax, dword ptr [ebx + 8]
    mov mov edx, dword ptr [ebp - 12]
    mov mov edx, dword ptr [eax + edx]
    cmp cmp edx, edi
    je L5
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov esi, dword ptr [edx + 48]
    jmp L6
    mov mov esi, edi
    mov mov edx, dword ptr [ebp - 4]
    mov mov edx, dword ptr [eax + edx*4]
    cmp cmp edx, edi
    mov mov dword ptr [ebp - 52], edx
    je L7
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [edx + 48]
    jmp L8
    mov mov edx, edi
    cmp cmp esi, edx
    jne L11
    mov mov edx, dword ptr [ebp - 32]
    mov mov edx, dword ptr [eax + edx]
    cmp cmp edx, edi
    je L9
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov esi, dword ptr [edx + 48]
    jmp L10
    mov mov esi, edi
    mov mov edx, dword ptr [ebp - 28]
    mov mov edx, dword ptr [eax + edx]
    cmp cmp edx, edi
    je L12
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [edx + 48]
    jmp L13
    mov mov edx, edi
    cmp cmp esi, edx
    je sub_10094F2C
    cmp cmp dword ptr [ebp - 60], 0
    je sub_10094F1E
    mov mov edx, dword ptr [ebp - 12]
    mov mov edx, dword ptr [eax + edx]
    cmp cmp edx, edi
    je L15
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov esi, dword ptr [edx + 48]
    jmp L16
    mov mov esi, edi
    mov mov edx, dword ptr [ebp - 28]
    mov mov edx, dword ptr [eax + edx]
    cmp cmp edx, edi
    je L17
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [edx + 48]
    jmp L18
    mov mov edx, edi
    cmp cmp esi, edx
    jne sub_10094F4E
    mov mov edx, dword ptr [ebp - 32]
    mov mov eax, dword ptr [eax + edx]
    cmp cmp eax, edi
    je L19
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [eax + 48]
    jmp L20
    mov mov edx, edi
    mov mov eax, dword ptr [ebp - 52]
    cmp cmp eax, edi
    je L21
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [eax + 48]
    jmp L22
    mov mov eax, edi
    cmp cmp edx, eax
    je sub_10094F93
    cmp cmp dword ptr [ebp - 20], 3
    jne L34
    mov mov eax, dword ptr [ebx + 8]
    mov mov edx, dword ptr [ebp - 12]
    mov mov edx, dword ptr [eax + edx]
    cmp cmp edx, edi
    je L23
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov esi, dword ptr [edx + 48]
    jmp L24
    mov mov esi, edi
L0:
    mov mov edx, dword ptr [ebp - 4]
    mov mov edx, dword ptr [eax + edx*4]
    cmp cmp edx, edi
    je L25
L1:
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [edx + 48]
    jmp L27
    mov mov edx, edi
    cmp cmp esi, edx
    jne sub_10094FB8
    mov mov edx, dword ptr [ebp - 32]
    mov mov edx, dword ptr [eax + edx]
    cmp cmp edx, edi
    je L32
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov esi, dword ptr [edx + 48]
    jmp L33
    mov mov esi, edi
    mov mov edx, dword ptr [ebp - 28]
    mov mov edx, dword ptr [eax + edx]
    cmp cmp edx, edi
    je L35
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [edx + 48]
    jmp sub_10094EBA
    mov mov edx, edi
    cmp cmp esi, edx
    jne sub_10094FE8
    mov mov esi, dword ptr [ebp - 16]
    mov mov edx, dword ptr [ebp - 8]
    add add esi, esi
    add add edx, esi
    mov mov edx, dword ptr [eax + edx*4]
    cmp cmp edx, edi
    je sub_10094EF9
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [edx + 48]
    mov mov dword ptr [ebp - 52], edx
    jmp sub_10094F07
    mov mov dword ptr [ebp - 52], edi
    mov mov edx, dword ptr [ebp - 4]
    add add esi, edx
    mov mov eax, dword ptr [eax + esi*4]
    cmp cmp eax, edi
    je sub_10094F2A
    mov mov eax, dword ptr [ecx + eax*4]
L5:
    mov mov eax, dword ptr [eax + 48]
    jmp sub_10094F34
    mov mov eax, edi
    cmp cmp dword ptr [ebp - 52], eax
L6:
    je sub_1009503E
    cmp cmp dword ptr [ebp - 20], 4
    jne sub_10095030
    mov mov eax, dword ptr [ebx + 8]
    mov mov edx, dword ptr [ebp - 12]
    mov mov edx, dword ptr [eax + edx]
    cmp cmp edx, edi
    je sub_10094F7E
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov esi, dword ptr [edx + 48]
    jmp sub_10094F88
    mov mov esi, edi
    mov mov edx, dword ptr [ebp - 4]
    mov mov edx, dword ptr [eax + edx*4]
    cmp cmp edx, edi
    je sub_10094FA6
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [edx + 48]
    jmp sub_10094FB0
    mov mov edx, edi
    cmp cmp esi, edx
    jne sub_10095063
    mov mov edx, dword ptr [ebp - 32]
    mov mov edx, dword ptr [eax + edx]
    cmp cmp edx, edi
    je sub_10094FDE
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov esi, dword ptr [edx + 48]
    jmp sub_10094FE8
    mov mov esi, edi
    mov mov edx, dword ptr [ebp - 28]
    mov mov edx, dword ptr [eax + edx]
    cmp cmp edx, edi
    je sub_10095006
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [edx + 48]
    jmp sub_10095010
    mov mov edx, edi
    cmp cmp esi, edx
    jne sub_1009508F
    mov mov esi, dword ptr [ebp - 16]
    mov mov edx, dword ptr [ebp - 8]
    add add esi, esi
    add add edx, esi
    mov mov edx, dword ptr [eax + edx*4]
L12:
    cmp cmp edx, edi
    je sub_10095047
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [edx + 48]
L13:
    mov mov dword ptr [ebp - 52], edx
    jmp sub_10095055
    mov mov dword ptr [ebp - 52], edi
    mov mov edx, dword ptr [ebp - 4]
    add add esi, edx
    mov mov edx, dword ptr [eax + esi*4]
    cmp cmp edx, edi
    je sub_10095078
    mov mov edx, dword ptr [ecx + edx*4]
L14:
    mov mov edx, dword ptr [edx + 48]
    jmp sub_10095082
    mov mov edx, edi
    cmp cmp dword ptr [ebp - 52], edx
    jne sub_100950C9
    mov mov edx, dword ptr [ebp - 16]
    mov mov esi, dword ptr [ebp - 8]
    lea lea edx, [edx + edx*2]
    add add esi, edx
    mov mov esi, dword ptr [eax + esi*4]
    cmp cmp esi, edi
    je sub_100950BD
    mov mov esi, dword ptr [ecx + esi*4]
    mov mov esi, dword ptr [esi + 48]
    mov mov dword ptr [ebp - 52], esi
    jmp sub_100950CB
    mov mov dword ptr [ebp - 52], edi
    mov mov esi, dword ptr [ebp - 4]
    add add edx, esi
    mov mov eax, dword ptr [eax + edx*4]
    cmp cmp eax, edi
    je sub_100950EE
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [eax + 48]
    jmp sub_100950F8
    mov mov eax, edi
    cmp cmp dword ptr [ebp - 52], eax
    je sub_1009511C
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    add add dword ptr [ebp - 28], 4
    cmp cmp eax, dword ptr [ebp - 8]
    mov mov esi, dword ptr [ebp - 44]
    jb L28
L18:
    jmp sub_10095156
    push push dword ptr [ebp - 64]
    mov mov eax, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [ebp - 4]
    push push dword ptr [eax + ecx*4]
    mov mov esi, dword ptr [ebp - 44]
    mov mov ecx, esi
    call sub_1008DCC7
    mov mov eax, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [ebp - 12]
    dec dec dword ptr [ebp - 24]
    mov mov dword ptr [ecx + eax], edi
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 16]
    add add dword ptr [ebp - 32], 4
L19:
    add add dword ptr [ebp - 12], 4
    cmp cmp dword ptr [ebp - 8], eax
    jb L28
    cmp cmp dword ptr [ebp - 24], eax
    jae sub_10095277
    and and dword ptr [ebp - 8], 0
    test test eax, eax
    jbe sub_1009520C
    xor xor edi, edi
    mov mov edx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebx + 16]
    shl shl edx, 2
    mov mov ecx, dword ptr [eax + edx]
L22:
    cmp cmp ecx, -1
    je sub_10095214
    cmp cmp dword ptr [ebp - 20], 0
    mov mov dword ptr [eax + edi], ecx
    jbe sub_1009521A
    mov mov esi, dword ptr [ebp - 20]
    mov mov ecx, edi
    mov mov eax, dword ptr [ebx + 8]
    mov mov ebx, dword ptr [eax + edx]
    add add edx, dword ptr [ebp - 36]
    mov mov dword ptr [eax + ecx], ebx
    add add ecx, dword ptr [ebp - 36]
    dec dec esi
    mov mov ebx, dword ptr [ebp - 40]
    jne sub_1009521F
    add add edi, 4
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [ebp - 16]
    jb sub_1009520E
    cmp cmp dword ptr [ebp - 20], 1
    jbe sub_100952A4
    mov mov esi, dword ptr [ebp - 24]
    mov mov ecx, dword ptr [ebp - 36]
    mov mov edi, dword ptr [ebp - 20]
    shl shl esi, 2
L23:
    mov mov dword ptr [ebp - 28], ecx
    mov mov dword ptr [ebp - 32], esi
    dec dec edi
    cmp cmp dword ptr [ebp - 24], 0
    jbe sub_100952AE
    mov mov eax, dword ptr [ebp - 24]
    mov mov edx, dword ptr [ebp - 32]
    mov mov dword ptr [ebp - 52], eax
    mov mov eax, dword ptr [ebx + 8]
    mov mov ebx, dword ptr [eax + ecx]
    mov mov dword ptr [eax + edx], ebx
    mov mov ebx, dword ptr [ebp - 40]
    add add ecx, 4
    add add edx, 4
L25:
    dec dec dword ptr [ebp - 52]
    jne sub_100952B7
    mov mov ecx, dword ptr [ebp - 28]
    add add ecx, dword ptr [ebp - 36]
    add add dword ptr [ebp - 32], esi
    dec dec edi
    mov mov dword ptr [ebp - 28], ecx
    jne sub_100952B7
    mov mov eax, dword ptr [ebp - 24]
    mov mov ecx, dword ptr [ebx]
    xor xor ecx, eax
    and and ecx, 0FFFFFh
    xor xor dword ptr [ebx], ecx
    mov mov ecx, eax
    imul imul ecx, dword ptr [ebp - 20]
    mov mov dword ptr [ebx + 4], ecx
    mov mov dword ptr [ebx + 12], eax
    mov mov dword ptr [ebp - 56], 1
    or or edi, -1
    inc inc dword ptr [ebp - 48]
    mov mov esi, dword ptr [ebp - 44]
    mov mov eax, dword ptr [ebp - 48]
L33:
    cmp cmp eax, dword ptr [esi + 12]
    jb sub_10094EC4
    cmp cmp dword ptr [ebp - 56], 0
    pop pop ebx
    jne sub_1009536D
    xor xor eax, eax
    inc inc eax
    jmp sub_1009537B
L34:
    mov mov ecx, esi
    call sub_1008B3F6
    xor xor eax, eax
L35:
    pop pop edi
    pop pop esi
    leave leave
    ret ret
FUN_100949dc ENDP
END
