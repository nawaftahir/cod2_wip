.686
.MODEL FLAT, C
EXTRN sub_100856CD:PROC
EXTRN sub_1008AA4E:PROC
EXTRN sub_1008B2E3:PROC
EXTRN sub_1008B32E:PROC
EXTRN sub_1008B3B4:PROC
.CODE
FUN_1008b71d PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 12
    push ebx
    push esi
    push edi
    mov esi, ecx
    xor edi, edi
    xor ecx, ecx
    or edx, 0FFFFFFFFh
    cmp dword ptr [esi + 4], edi
    mov dword ptr [ebp - 8], edi
    jbe L1
L0:
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + ecx*4]
    inc ecx
    mov dword ptr [eax + 40], edx
    mov dword ptr [eax + 36], edx
    cmp ecx, dword ptr [esi + 4]
    jb L0
L1:
    xor ecx, ecx
    cmp dword ptr [esi + 8], edi
    jbe L3
L2:
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
    inc ecx
    mov dword ptr [eax + 84], edx
    mov dword ptr [eax + 72], edx
    cmp ecx, dword ptr [esi + 8]
    jb L2
L3:
    xor eax, eax
    cmp dword ptr [esi + 12], edi
    jbe L25
L4:
    mov ecx, dword ptr [esi + 24]
    mov ebx, dword ptr [ecx + eax*4]
    test word ptr [ebx + 2], 00000FFF0h
    mov dword ptr [ebp - 12], ebx
    je L24
    and dword ptr [ebp - 4], 0
    cmp dword ptr [ebx + 4], 0
    jbe L14
L5:
    mov edx, dword ptr [ebp - 4]
    mov ecx, dword ptr [ebx + 8]
    mov ecx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [esi + 20]
    mov edi, dword ptr [edx + ecx*4]
    cmp eax, dword ptr [edi + 84]
    jae L6
    mov dword ptr [edi + 84], eax
L6:
    lea edx, [edi + 8]
    cmp dword ptr [edx], -1
    mov ecx, edi
    je L10
L7:
    mov ecx, dword ptr [ecx + 4]
    mov ebx, dword ptr [esi + 16]
    mov ecx, dword ptr [ebx + ecx*4]
    cmp eax, dword ptr [ecx + 40]
    jae L8
    mov dword ptr [ecx + 40], eax
L8:
    mov ecx, dword ptr [edx]
    mov edx, dword ptr [esi + 20]
    mov ecx, dword ptr [edx + ecx*4]
    cmp eax, dword ptr [ecx + 84]
    jae L9
    mov dword ptr [ecx + 84], eax
L9:
    lea edx, [ecx + 8]
    cmp dword ptr [edx], -1
    jne L7
    mov ebx, dword ptr [ebp - 12]
L10:
    lea ecx, [edi + 20]
    jmp L13
L11:
    mov ecx, dword ptr [ecx]
    mov edx, dword ptr [esi + 20]
    mov ecx, dword ptr [edx + ecx*4]
    cmp eax, dword ptr [ecx + 84]
    jae L12
    mov dword ptr [ecx + 84], eax
L12:
    add ecx, 20
L13:
    cmp dword ptr [ecx], -1
    jne L11
    inc dword ptr [ebp - 4]
    mov ecx, dword ptr [ebp - 4]
    cmp ecx, dword ptr [ebx + 4]
    jb L5
L14:
    and dword ptr [ebp - 4], 0
    cmp dword ptr [ebx + 12], 0
    jbe L24
L15:
    mov edx, dword ptr [ebp - 4]
    mov ecx, dword ptr [ebx + 16]
    mov ecx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [esi + 20]
    mov edx, dword ptr [edx + ecx*4]
    cmp eax, dword ptr [edx + 72]
    jae L16
    mov dword ptr [edx + 72], eax
L16:
    cmp dword ptr [edx + 8], -1
    mov ecx, edx
    je L18
    mov ecx, dword ptr [edx + 4]
    mov edi, dword ptr [esi + 16]
    mov ecx, dword ptr [edi + ecx*4]
    cmp eax, dword ptr [ecx + 36]
    jae L17
    mov dword ptr [ecx + 36], eax
L17:
    mov ecx, dword ptr [edx + 8]
    mov edi, dword ptr [esi + 20]
    mov ecx, dword ptr [edi + ecx*4]
    cmp eax, dword ptr [ecx + 84]
    jae L18
    mov dword ptr [ecx + 84], eax
L18:
    cmp dword ptr [ecx + 8], -1
    je L23
L19:
    mov edi, dword ptr [ecx + 4]
    mov ebx, dword ptr [esi + 16]
    mov edi, dword ptr [ebx + edi*4]
    cmp eax, dword ptr [edi + 40]
    jae L20
    mov dword ptr [edi + 40], eax
L20:
    mov ecx, dword ptr [ecx + 8]
    mov edi, dword ptr [esi + 20]
    mov ecx, dword ptr [edi + ecx*4]
    cmp eax, dword ptr [ecx + 84]
    jae L21
    mov dword ptr [ecx + 84], eax
L21:
    cmp dword ptr [ecx + 8], -1
    jne L19
    mov ebx, dword ptr [ebp - 12]
    jmp L23
L22:
    mov ecx, dword ptr [edx]
    mov edx, dword ptr [esi + 20]
    mov edx, dword ptr [edx + ecx*4]
    cmp eax, dword ptr [edx + 84]
    jae L23
    mov dword ptr [edx + 84], eax
L23:
    add edx, 20
    cmp dword ptr [edx], -1
    jne L22
    inc dword ptr [ebp - 4]
    mov ecx, dword ptr [ebp - 4]
    cmp ecx, dword ptr [ebx + 12]
    jb L15
L24:
    inc eax
    cmp eax, dword ptr [esi + 12]
    jb L4
L25:
    mov ecx, esi
    call sub_1008AA4E
    and dword ptr [ebp - 4], 0
    cmp dword ptr [esi + 8], 0
    jbe L41
    xor ebx, ebx
L26:
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [ebp - 4]
    mov edi, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [edi + 4]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax + 40]
    cmp ecx, dword ptr [edi + 84]
    jae L27
    mov dword ptr [edi + 84], ecx
L27:
    mov ecx, dword ptr [eax + 36]
    cmp ecx, dword ptr [edi + 72]
    jae L28
    mov dword ptr [edi + 72], ecx
L28:
    mov eax, dword ptr [eax + 4]
    mov edx, eax
    and edx, 16
    jne L30
    mov ecx, dword ptr [edi + 84]
    cmp ecx, -1
    je L30
    cmp ecx, dword ptr [edi + 72]
    ja L30
    mov edi, dword ptr [edi + 96]
    cmp edi, ebx
    je L29
    cmp dword ptr [edi + 4], 6
    jne L29
    mov eax, dword ptr [edi + 20]
    cmp eax, ebx
    je L29
    cmp dword ptr [eax + 4], 3
    jne L29
    cmp dword ptr [edi + 40], ebx
    jne L39
    push dword ptr [eax + 24]
    mov eax, dword ptr [esi + 24]
    mov eax, dword ptr [eax + ecx*4]
    push 0101105DCh
    push 000000FA0h
    push dword ptr [eax + 60]
    push esi
    call sub_1008B2E3
    mov dword ptr [edi + 40], 1
    jmp L38
L29:
    push ecx
    push dword ptr [ebp - 4]
    push 010110590h
    jmp L32
L30:
    test al, 32
    je L31
    cmp dword ptr [edi + 72], -1
    jne L31
    push dword ptr [ebp - 4]
    push 010110550h
    jmp L37
L31:
    test al, 2
    jne L33
    mov ecx, dword ptr [edi + 72]
    cmp ecx, -1
    je L33
    push ecx
    push dword ptr [ebp - 4]
    push 010110514h
L32:
    push ebx
    push ebx
    push esi
    call sub_1008B32E
    add esp, 24
    jmp L39
L33:
    test al, 13
    jne L34
    cmp dword ptr [edi + 84], -1
    je L34
    push dword ptr [ebp - 4]
    push 0101104DCh
    jmp L37
L34:
    cmp dword ptr [esi + 0000000D8h], ebx
    je L40
    test eax, 000010120h
    jne L40
    cmp dword ptr [edi + 84], -1
    jne L40
    cmp edx, ebx
    jne L35
    mov eax, dword ptr [edi + 72]
    cmp eax, -1
    je L40
    mov ecx, dword ptr [esi + 24]
    mov ecx, dword ptr [ecx + eax*4]
    call sub_100856CD
    test eax, eax
    jne L40
    mov eax, dword ptr [edi + 72]
    mov ecx, dword ptr [esi + 24]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 020900000h
    je L40
L35:
    mov edi, dword ptr [edi + 72]
    cmp edi, -1
    je L36
    push edi
    push dword ptr [ebp - 4]
    push 0101104A8h
    jmp L32
L36:
    push dword ptr [ebp - 4]
    push 010110478h
L37:
    push ebx
    push ebx
    push esi
    call sub_1008B3B4
L38:
    add esp, 20
L39:
    mov dword ptr [ebp - 8], 1
L40:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [esi + 8]
    jb L26
    cmp dword ptr [ebp - 8], ebx
    je L41
    mov eax, 080004005h
    jmp L42
L41:
    xor eax, eax
L42:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_1008b71d ENDP
END
