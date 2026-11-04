.686
.MODEL FLAT, C
EXTRN sub_1008A965:PROC
EXTRN sub_1008A9E0:PROC
EXTRN sub_1008AB6B:PROC
EXTRN sub_100F7940:PROC
EXTRN sub_100F7B2A:PROC
.CODE
FUN_1008a979 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 12
    push ebx
    push esi
    mov esi, ecx
    xor ebx, ebx
    xor ecx, ecx
    cmp dword ptr [esi + 4], ebx
    push edi
    jbe L1
L0:
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + ecx*4]
    or dword ptr [eax + 40], 0FFFFFFFFh
    inc ecx
    mov dword ptr [eax + 44], ebx
    mov dword ptr [eax + 48], ebx
    mov dword ptr [eax + 32], ebx
    cmp ecx, dword ptr [esi + 4]
    jb L0
L1:
    xor ecx, ecx
    cmp dword ptr [esi + 8], ebx
    jbe L3
L2:
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
    or edx, 0FFFFFFFFh
    mov dword ptr [eax + 52], ecx
    inc ecx
    mov dword ptr [eax + 84], edx
    mov dword ptr [eax + 88], ebx
    mov dword ptr [eax + 92], ebx
    mov dword ptr [eax + 72], edx
    mov dword ptr [eax + 76], edx
    mov dword ptr [eax + 80], edx
    cmp ecx, dword ptr [esi + 8]
    jb L2
L3:
    cmp dword ptr [esi + 0000000DCh], ebx
    mov dword ptr [ebp - 12], ebx
    je L13
    xor eax, eax
    cmp dword ptr [esi + 4], ebx
    jbe L5
L4:
    mov ecx, dword ptr [esi + 16]
    mov ecx, dword ptr [ecx + eax*4]
    inc eax
    mov dword ptr [ecx + 16], ebx
    cmp eax, dword ptr [esi + 4]
    jb L4
L5:
    xor edi, edi
    cmp dword ptr [esi + 8], ebx
    jbe L8
L6:
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [eax + edi*4]
    mov edx, dword ptr [esi + 16]
    mov eax, dword ptr [ecx + 4]
    mov eax, dword ptr [edx + eax*4]
    mov edx, dword ptr [eax + 4]
    test dl, 64
    jne L7
    test dl, 2
    je L7
    mov ecx, dword ptr [ecx + 12]
    inc ecx
    cmp dword ptr [eax + 16], ecx
    jae L7
    mov dword ptr [eax + 16], ecx
L7:
    inc edi
    cmp edi, dword ptr [esi + 8]
    jb L6
L8:
    mov edx, dword ptr [esi + 4]
    xor eax, eax
    cmp edx, ebx
    jbe L10
    mov ecx, dword ptr [esi + 16]
L9:
    mov edi, dword ptr [ecx]
    add eax, dword ptr [edi + 16]
    add ecx, 4
    dec edx
    jne L9
L10:
    shl eax, 4
    mov edi, eax
    push edi
    call sub_100F7940
    cmp eax, ebx
    pop ecx
    mov dword ptr [ebp - 12], eax
    jne L11
    mov eax, 08007000Eh
    jmp L35
L11:
    mov ecx, edi
    mov edi, dword ptr [ebp - 12]
    mov edx, ecx
    shr ecx, 2
    or eax, 0FFFFFFFFh
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    xor ecx, ecx
    xor edx, edx
    cmp dword ptr [esi + 4], ebx
    jbe L13
    mov eax, dword ptr [esi + 16]
L12:
    mov edi, dword ptr [esi + 16]
    mov edi, dword ptr [edi + edx*4]
    mov edi, dword ptr [edi + 16]
    mov eax, dword ptr [eax + edx*4]
    mov ebx, ecx
    shl ebx, 4
    add ebx, dword ptr [ebp - 12]
    neg edi
    sbb edi, edi
    and edi, ebx
    mov dword ptr [eax + 32], edi
    mov eax, dword ptr [esi + 16]
    mov edi, dword ptr [eax + edx*4]
    add ecx, dword ptr [edi + 16]
    inc edx
    cmp edx, dword ptr [esi + 4]
    jb L12
    xor ebx, ebx
L13:
    cmp dword ptr [esi + 12], ebx
    mov dword ptr [ebp - 4], ebx
    jbe L23
L14:
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [ebp - 4]
    mov edi, dword ptr [eax + ecx*4]
    cmp edi, ebx
    je L22
    test word ptr [edi + 2], 00000FFF0h
    je L22
    cmp dword ptr [edi + 4], 0
    jbe L16
L15:
    push dword ptr [ebp - 4]
    mov eax, dword ptr [edi + 8]
    push dword ptr [eax + ebx*4]
    mov ecx, esi
    call sub_1008A965
    inc ebx
    cmp ebx, dword ptr [edi + 4]
    jb L15
L16:
    xor ebx, ebx
    cmp dword ptr [edi + 12], ebx
    jbe L18
L17:
    push dword ptr [ebp - 4]
    mov eax, dword ptr [edi + 16]
    push dword ptr [eax + ebx*4]
    mov ecx, esi
    call sub_1008A9E0
    inc ebx
    cmp ebx, dword ptr [edi + 12]
    jb L17
L18:
    mov eax, dword ptr [edi]
    and eax, 0FFF00000h
    cmp eax, 010000000h
    jne L21
    test byte ptr [esi + 0000000CCh], 4
    jne L21
    and dword ptr [ebp - 8], 0
    cmp dword ptr [edi + 12], 0
    jbe L21
L19:
    mov edx, dword ptr [ebp - 8]
    mov ecx, dword ptr [edi + 16]
    mov ebx, dword ptr [edi + 8]
    mov eax, dword ptr [esi + 20]
    shl edx, 2
    mov ecx, dword ptr [edx + ecx]
    mov edx, dword ptr [edx + ebx]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [eax + edx*4]
    mov edx, dword ptr [ecx + 4]
    mov ebx, dword ptr [esi + 16]
    mov edx, dword ptr [ebx + edx*4]
    mov edx, dword ptr [edx + 4]
    test dx, 000001020h
    jne L20
    test dl, 1
    je L20
    cmp dword ptr [eax + 60], 0
    jne L20
    mov ebx, dword ptr [eax + 52]
    mov edx, dword ptr [ecx + 52]
    mov dword ptr [ecx + 52], ebx
    mov dword ptr [eax + 52], edx
L20:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [edi + 12]
    jb L19
L21:
    xor ebx, ebx
L22:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [esi + 12]
    jb L14
L23:
    xor edi, edi
    cmp dword ptr [esi + 8], ebx
    jbe L27
L24:
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + edi*4]
    mov edx, dword ptr [esi + 16]
    mov ecx, dword ptr [eax + 4]
    mov ecx, dword ptr [edx + ecx*4]
    mov edx, dword ptr [ecx + 40]
    cmp dword ptr [eax + 84], edx
    jbe L25
    mov dword ptr [eax + 84], edx
L25:
    mov ecx, dword ptr [ecx + 44]
    cmp dword ptr [eax + 88], ecx
    jae L26
    mov dword ptr [eax + 88], ecx
L26:
    inc edi
    cmp edi, dword ptr [esi + 8]
    jb L24
L27:
    cmp dword ptr [esi + 0000000DCh], ebx
    je L33
    xor edi, edi
    cmp dword ptr [esi + 8], ebx
    jbe L33
L28:
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ecx + edi*4]
    mov edx, dword ptr [eax + 76]
    cmp edx, -1
    je L29
    mov ecx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [ecx + 88]
    mov dword ptr [eax + 76], edx
    mov ecx, dword ptr [ecx + 72]
    cmp edx, ecx
    ja L30
    inc ecx
    mov dword ptr [eax + 76], ecx
    jmp L30
L29:
    mov dword ptr [eax + 76], ebx
L30:
    mov ecx, dword ptr [eax + 80]
    cmp ecx, -1
    je L31
    mov edx, dword ptr [esi + 20]
    mov ecx, dword ptr [edx + ecx*4]
    mov edx, dword ptr [ecx + 84]
    mov dword ptr [eax + 80], edx
    mov ecx, dword ptr [ecx + 72]
    cmp edx, ecx
    jbe L32
    mov dword ptr [eax + 80], ecx
    jmp L32
L31:
    or dword ptr [eax + 80], 0FFFFFFFFh
L32:
    inc edi
    cmp edi, dword ptr [esi + 8]
    jb L28
L33:
    cmp dword ptr [esi + 0000000D8h], ebx
    je L34
    mov ecx, esi
    call sub_1008AB6B
L34:
    push dword ptr [ebp - 12]
    call sub_100F7B2A
    pop ecx
    xor eax, eax
L35:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_1008a979 ENDP
END
