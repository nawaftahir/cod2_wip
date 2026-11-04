.686
.MODEL FLAT, C
EXTRN sub_100856CD:PROC
EXTRN sub_1008AA4E:PROC
EXTRN sub_1008B2E3:PROC
EXTRN sub_1008B32E:PROC
EXTRN sub_1008B3B4:PROC
EXTRN sub_1008BAB4:PROC
EXTRN sub_1008BACA:PROC
EXTRN sub_1008BB44:PROC
EXTRN sub_1008BB4C:PROC
EXTRN sub_1008BB4D:PROC
EXTRN sub_1008BB51:PROC
EXTRN sub_1008BB53:PROC
EXTRN sub_1008BB5A:PROC
EXTRN sub_1008BB60:PROC
EXTRN sub_1008BBC2:PROC
EXTRN sub_1008BBC8:PROC
EXTRN sub_1008BBD3:PROC
EXTRN sub_1008BBE5:PROC
EXTRN sub_1008BBEF:PROC
EXTRN sub_1008BBFE:PROC
EXTRN sub_1008BC06:PROC
EXTRN sub_1008BC31:PROC
EXTRN sub_1008BC37:PROC
EXTRN sub_1008BC3D:PROC
EXTRN sub_1008BC56:PROC
EXTRN sub_1008BC70:PROC
EXTRN sub_1008BC7D:PROC
EXTRN sub_1008BCA0:PROC
EXTRN sub_1008BCA7:PROC
EXTRN sub_1008BCA9:PROC
EXTRN sub_1008BCC3:PROC
EXTRN sub_1008BCCA:PROC
EXTRN sub_1008BCD0:PROC
EXTRN sub_1008BCDC:PROC
EXTRN sub_1008BCEB:PROC
EXTRN sub_1008BCF0:PROC
EXTRN sub_1008BD02:PROC
EXTRN sub_1008BD5E:PROC
EXTRN sub_1008BD67:PROC
.CODE
FUN_1008b71d PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 12
    push push ebx
    push push esi
    push push edi
    mov mov esi, ecx
    xor xor edi, edi
    xor xor ecx, ecx
    or or edx, -1
    cmp cmp dword ptr [esi + 4], edi
    mov mov dword ptr [ebp - 8], edi
    jbe L0
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + ecx*4]
    inc inc ecx
    mov mov dword ptr [eax + 40], edx
    mov mov dword ptr [eax + 36], edx
    cmp cmp ecx, dword ptr [esi + 4]
    jb L0
    xor xor ecx, ecx
    cmp cmp dword ptr [esi + 8], edi
    jbe L1
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    inc inc ecx
    mov mov dword ptr [eax + 84], edx
    mov mov dword ptr [eax + 72], edx
    cmp cmp ecx, dword ptr [esi + 8]
    jb L1
    xor xor eax, eax
    cmp cmp dword ptr [esi + 12], edi
    jbe L11
    mov mov ecx, dword ptr [esi + 24]
    mov mov ebx, dword ptr [ecx + eax*4]
    test test word ptr [ebx + 2], 0FFF0h
    mov mov dword ptr [ebp - 12], ebx
    je L12
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [ebx + 4], 0
    jbe L6
    mov mov edx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [esi + 20]
    mov mov edi, dword ptr [edx + ecx*4]
    cmp cmp eax, dword ptr [edi + 84]
    jae L2
    mov mov dword ptr [edi + 84], eax
    lea lea edx, [edi + 8]
    cmp cmp dword ptr [edx], -1
    mov mov ecx, edi
    je L5
    mov mov ecx, dword ptr [ecx + 4]
    mov mov ebx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ebx + ecx*4]
    cmp cmp eax, dword ptr [ecx + 40]
    jae L3
    mov mov dword ptr [ecx + 40], eax
    mov mov ecx, dword ptr [edx]
    mov mov edx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [edx + ecx*4]
    cmp cmp eax, dword ptr [ecx + 84]
    jae L7
    mov mov dword ptr [ecx + 84], eax
    lea lea edx, [ecx + 8]
    cmp cmp dword ptr [edx], -1
    jne L4
    mov mov ebx, dword ptr [ebp - 12]
    lea lea ecx, [edi + 20]
    jmp L8
    mov mov ecx, dword ptr [ecx]
    mov mov edx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [edx + ecx*4]
    cmp cmp eax, dword ptr [ecx + 84]
    jae L10
    mov mov dword ptr [ecx + 84], eax
    add add ecx, 20
    cmp cmp dword ptr [ecx], -1
    jne L9
    inc inc dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ebp - 4]
    cmp cmp ecx, dword ptr [ebx + 4]
    jb L6
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [ebx + 12], 0
    jbe L17
    mov mov edx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [esi + 20]
    mov mov edx, dword ptr [edx + ecx*4]
    cmp cmp eax, dword ptr [edx + 72]
    jae L13
    mov mov dword ptr [edx + 72], eax
    cmp cmp dword ptr [edx + 8], -1
    mov mov ecx, edx
    je L15
    mov mov ecx, dword ptr [edx + 4]
    mov mov edi, dword ptr [esi + 16]
    mov mov ecx, dword ptr [edi + ecx*4]
    cmp cmp eax, dword ptr [ecx + 36]
    jae L14
    mov mov dword ptr [ecx + 36], eax
    mov mov ecx, dword ptr [edx + 8]
    mov mov edi, dword ptr [esi + 20]
    mov mov ecx, dword ptr [edi + ecx*4]
    cmp cmp eax, dword ptr [ecx + 84]
    jae L16
    mov mov dword ptr [ecx + 84], eax
    cmp cmp dword ptr [ecx + 8], -1
    je L20
    mov mov edi, dword ptr [ecx + 4]
    mov mov ebx, dword ptr [esi + 16]
    mov mov edi, dword ptr [ebx + edi*4]
    cmp cmp eax, dword ptr [edi + 40]
    jae L18
    mov mov dword ptr [edi + 40], eax
    mov mov ecx, dword ptr [ecx + 8]
    mov mov edi, dword ptr [esi + 20]
    mov mov ecx, dword ptr [edi + ecx*4]
    cmp cmp eax, dword ptr [ecx + 84]
    jae L21
    mov mov dword ptr [ecx + 84], eax
    cmp cmp dword ptr [ecx + 8], -1
    jne L19
L7:
    mov mov ebx, dword ptr [ebp - 12]
    jmp L22
    mov mov ecx, dword ptr [edx]
    mov mov edx, dword ptr [esi + 20]
    mov mov edx, dword ptr [edx + ecx*4]
    cmp cmp eax, dword ptr [edx + 84]
    jae L24
    mov mov dword ptr [edx + 84], eax
    add add edx, 20
    cmp cmp dword ptr [edx], -1
    jne L23
    inc inc dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ebp - 4]
    cmp cmp ecx, dword ptr [ebx + 12]
    jb L17
    inc inc eax
    cmp cmp eax, dword ptr [esi + 12]
    jb L11
L8:
    mov mov ecx, esi
    call sub_1008AA4E
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [esi + 8], 0
    jbe sub_1008BBEF
    xor xor ebx, ebx
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov edi, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [esi + 16]
    mov mov eax, dword ptr [edi + 4]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [eax + 40]
    cmp cmp ecx, dword ptr [edi + 84]
    jae sub_1008BAB4
    mov mov dword ptr [edi + 84], ecx
    mov mov ecx, dword ptr [eax + 36]
    cmp cmp ecx, dword ptr [edi + 72]
    jae sub_1008BACA
    mov mov dword ptr [edi + 72], ecx
    mov mov eax, dword ptr [eax + 4]
    mov mov edx, eax
    and and edx, 16
    jne sub_1008BB44
    mov mov ecx, dword ptr [edi + 84]
    cmp cmp ecx, -1
    je sub_1008BB4C
    cmp cmp ecx, dword ptr [edi + 72]
    ja sub_1008BB51
    mov mov edi, dword ptr [edi + 96]
    cmp cmp edi, ebx
    je sub_1008BB4D
L12:
    cmp cmp dword ptr [edi + 4], 6
    jne sub_1008BB53
    mov mov eax, dword ptr [edi + 20]
    cmp cmp eax, ebx
    je sub_1008BB5A
    cmp cmp dword ptr [eax + 4], 3
    jne sub_1008BB60
    cmp cmp dword ptr [edi + 40], ebx
    jne sub_1008BC31
    push push dword ptr [eax + 24]
    mov mov eax, dword ptr [esi + 24]
    mov mov eax, dword ptr [eax + ecx*4]
    push push 0101105DCh
    push push 0FA0h
    push push dword ptr [eax + 60]
    push push esi
    call sub_1008B2E3
    mov mov dword ptr [edi + 40], 1
    jmp sub_1008BC56
    push push ecx
    push push dword ptr [ebp - 4]
    push push 010110590h
    jmp sub_1008BBD3
L14:
    test test al, 32
    je sub_1008BBC2
    cmp cmp dword ptr [edi + 72], -1
    jne sub_1008BBC8
    push push dword ptr [ebp - 4]
    push push 010110550h
    jmp sub_1008BC70
    test test al, 2
    jne sub_1008BBFE
    mov mov ecx, dword ptr [edi + 72]
    cmp cmp ecx, -1
    je sub_1008BC06
    push push ecx
    push push dword ptr [ebp - 4]
    push push 010110514h
    push push ebx
    push push ebx
    push push esi
    call sub_1008B32E
    add add esp, 24
    jmp sub_1008BCA0
    test test al, 13
L17:
    jne sub_1008BC37
    cmp cmp dword ptr [edi + 84], -1
    je sub_1008BC3D
    push push dword ptr [ebp - 4]
    push push 0101104DCh
    jmp sub_1008BCA9
L18:
    cmp cmp dword ptr [esi + 0D8h], ebx
    je sub_1008BCC3
    test test eax, 010120h
    jne sub_1008BCCA
    cmp cmp dword ptr [edi + 84], -1
    jne sub_1008BCD0
    cmp cmp edx, ebx
    jne sub_1008BCA7
    mov mov eax, dword ptr [edi + 72]
    cmp cmp eax, -1
    je sub_1008BCDC
    mov mov ecx, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ecx + eax*4]
    call sub_100856CD
    test test eax, eax
    jne sub_1008BCEB
    mov mov eax, dword ptr [edi + 72]
    mov mov ecx, dword ptr [esi + 24]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [eax]
    and and eax, 0FFF00000h
    cmp cmp eax, 020900000h
    je sub_1008BD02
    mov mov edi, dword ptr [edi + 72]
    cmp cmp edi, -1
    je sub_1008BCF0
    push push edi
    push push dword ptr [ebp - 4]
L23:
    push push 0101104A8h
L24:
    jmp sub_1008BC7D
    push push dword ptr [ebp - 4]
    push push 010110478h
    push push ebx
    push push ebx
    push push esi
    call sub_1008B3B4
    add add esp, 20
    mov mov dword ptr [ebp - 8], 1
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [esi + 8]
    jb sub_1008BBE5
    cmp cmp dword ptr [ebp - 8], ebx
    je sub_1008BD5E
    mov mov eax, 080004005h
    jmp sub_1008BD67
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_1008b71d ENDP
END
