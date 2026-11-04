.686
.MODEL FLAT, C
EXTRN sub_100A6EA3:PROC
EXTRN sub_100A6F6C:PROC
EXTRN sub_100A7007:PROC
EXTRN sub_100A7142:PROC
EXTRN sub_100A71BE:PROC
EXTRN sub_100AC143:PROC
EXTRN sub_100AC315:PROC
EXTRN sub_100ACAB9:PROC
EXTRN sub_100ACBF7:PROC
EXTRN sub_100B07CC:PROC
EXTRN sub_100B083A:PROC
EXTRN sub_100B099E:PROC
EXTRN sub_100BA085:PROC
EXTRN sub_100BA126:PROC
.CODE
FUN_100b174b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    push ebx
    push esi
    mov esi, ecx
    xor eax, eax
    cmp dword ptr [esi + 12], eax
    push edi
    jbe L1
L0:
    mov ecx, dword ptr [esi + 24]
    mov ecx, dword ptr [ecx + eax*4]
    and dword ptr [ecx + 40], 0
    inc eax
    cmp eax, dword ptr [esi + 12]
    jb L0
L1:
    xor ebx, ebx
    xor edi, edi
    inc ebx
L2:
    mov eax, dword ptr [esi + 000000230h]
    mov eax, dword ptr [edi + eax]
    test eax, eax
    je L3
    push ebx
    push eax
    push dword ptr [esi + 24]
    mov ecx, esi
    call sub_100BA085
    mov eax, dword ptr [esi + 000000230h]
    push 2
    push dword ptr [edi + eax]
    mov ecx, esi
    push dword ptr [esi + 24]
    call sub_100BA126
L3:
    mov eax, dword ptr [esi + 00000022Ch]
    mov eax, dword ptr [edi + eax]
    test eax, eax
    je L4
    mov dword ptr [eax + 40], ebx
L4:
    add edi, 4
    cmp edi, 24
    jb L2
    xor edi, edi
    cmp dword ptr [esi + 12], edi
    jbe L7
L5:
    mov eax, dword ptr [esi + 24]
    mov edx, dword ptr [eax + edi*4]
    mov ecx, dword ptr [edx]
    and ecx, 0FFF00000h
    push ecx
    call sub_100A6EA3
    test eax, eax
    jne L6
    cmp ecx, 072100000h
    je L6
    cmp ecx, 011000000h
    je L6
    lea eax, [esi + 000000220h]
    mov ecx, dword ptr [eax]
    cmp ecx, 000000200h
    jae L41
    cmp dword ptr [edx + 40], ebx
    jne L6
    mov ebx, dword ptr [esi + 00000022Ch]
    mov dword ptr [ebx + ecx*4], edx
    inc dword ptr [eax]
    xor ebx, ebx
    inc ebx
L6:
    inc edi
    cmp edi, dword ptr [esi + 12]
    jb L5
L7:
    mov ecx, dword ptr [esi + 00000022Ch]
    xor edx, edx
    cmp ecx, edx
    mov dword ptr [ebp - 12], ebx
    je L10
    lea eax, [esi + 000000220h]
    cmp dword ptr [eax], edx
    jbe L10
    mov eax, dword ptr [eax]
L8:
    cmp dword ptr [ecx], edx
    je L9
    mov dword ptr [ebp - 12], edx
L9:
    add ecx, 4
    dec eax
    jne L8
L10:
    mov dword ptr [ebp - 8], edx
L11:
    and dword ptr [ebp - 4], 0
    lea eax, [ebp - 4]
    push eax
    mov ecx, esi
    call sub_100AC143
    test eax, eax
    jl L39
    lea eax, [ebp - 16]
    push eax
    push dword ptr [esi + 000000220h]
    mov ecx, esi
    push 6
    push dword ptr [esi + 00000022Ch]
    call sub_100B07CC
    xor edi, edi
    xor ebx, ebx
    cmp dword ptr [esi + 12], edi
    jbe L16
L12:
    mov eax, dword ptr [esi + 24]
    mov edx, dword ptr [eax + edi*4]
    test edx, edx
    je L15
    mov ecx, dword ptr [edx]
    mov eax, dword ptr [edx + 40]
    and ecx, 0FFF00000h
    cmp eax, 2
    je L13
    test eax, eax
    jne L14
L13:
    push ecx
    call sub_100A6F6C
    test eax, eax
    jne L14
    cmp ecx, 011000000h
    je L14
    cmp ecx, 072100000h
    je L14
    mov dword ptr [ebx*4 + 0101AD560h], edx
    inc ebx
L14:
    cmp ebx, 000000200h
    jae L40
L15:
    inc edi
    cmp edi, dword ptr [esi + 12]
    jb L12
L16:
    lea eax, [ebp - 20]
    push eax
    push ebx
    push 0
    mov ecx, esi
    push 0101AD560h
    call sub_100B083A
    mov eax, dword ptr [ebp - 20]
    mov ecx, dword ptr [ebp - 4]
    add ecx, eax
    cmp ecx, 8
    jae L17
    cmp eax, dword ptr [ebp - 16]
    jbe L34
    cmp dword ptr [ebp - 8], 0
    jne L34
    cmp dword ptr [ebp - 12], 0
    jne L34
L17:
    and dword ptr [ebp - 4], 0
    cmp dword ptr [esi + 12], 0
    jbe L29
L18:
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [ebp - 4]
    mov edi, dword ptr [eax + ecx*4]
    xor edx, edx
    cmp dword ptr [edi + 40], edx
    jne L27
    mov ecx, dword ptr [edi]
    and ecx, 0FFF00000h
    push ecx
    call sub_100A7007
    test eax, eax
    jne L27
    cmp ecx, 072100000h
    je L27
    cmp edx, dword ptr [edi + 4]
    jae L21
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [edi + 8]
L19:
    mov ebx, dword ptr [eax]
    mov ebx, dword ptr [ecx + ebx*4]
    cmp byte ptr [ebx + 108], 1
    je L20
    inc edx
    add eax, 4
    cmp edx, dword ptr [edi + 4]
    jb L19
L20:
    cmp edx, dword ptr [edi + 4]
L21:
    jne L27
    xor ecx, ecx
    cmp dword ptr [ebp - 8], ecx
    jne L25
    cmp ecx, dword ptr [edi + 12]
    jae L24
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [edi + 16]
L22:
    mov ebx, dword ptr [eax]
    mov ebx, dword ptr [edx + ebx*4]
    cmp dword ptr [ebx + 16], 3
    je L23
    inc ecx
    add eax, 4
    cmp ecx, dword ptr [edi + 12]
    jb L22
L23:
    cmp ecx, dword ptr [edi + 12]
L24:
    jne L27
L25:
    mov eax, dword ptr [edi + 16]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 4]
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [ecx + eax*4]
    test byte ptr [eax + 4], 32
    jne L27
    mov ecx, esi
    mov dword ptr [edi + 40], 1
    call sub_100ACAB9
    test eax, eax
    jne L26
    push edi
    call sub_100ACBF7
    test eax, eax
    je L28
L26:
    and dword ptr [edi + 40], 0
L27:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [esi + 12]
    jb L18
    jmp L29
L28:
    mov eax, dword ptr [esi + 000000220h]
    cmp eax, 000000200h
    jae L40
    mov ecx, dword ptr [esi + 00000022Ch]
    mov dword ptr [ecx + eax*4], edi
    inc dword ptr [esi + 000000220h]
L29:
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [esi + 12]
    je L34
    and dword ptr [ebp - 4], 0
    lea eax, [ebp - 4]
    push eax
    mov ecx, esi
    call sub_100AC315
    test eax, eax
    jl L39
    lea eax, [ebp - 16]
    push eax
    push dword ptr [esi + 000000220h]
    mov ecx, esi
    push 6
    push dword ptr [esi + 00000022Ch]
    call sub_100B099E
    xor edi, edi
    xor ebx, ebx
    cmp dword ptr [esi + 12], edi
    jbe L16
L30:
    mov eax, dword ptr [esi + 24]
    mov edx, dword ptr [eax + edi*4]
    test edx, edx
    je L33
    mov ecx, dword ptr [edx]
    mov eax, dword ptr [edx + 40]
    and ecx, 0FFF00000h
    cmp eax, 2
    je L31
    test eax, eax
    jne L32
L31:
    push ecx
    call sub_100A7142
    test eax, eax
    jne L32
    cmp ecx, 011000000h
    je L32
    cmp ecx, 072100000h
    je L32
    mov dword ptr [ebx*4 + 0101AD560h], edx
    inc ebx
L32:
    cmp ebx, 000000200h
    jae L40
L33:
    inc edi
    cmp edi, dword ptr [esi + 12]
    jb L30
    jmp L16
L34:
    inc dword ptr [ebp - 8]
    cmp dword ptr [ebp - 8], 2
    jb L11
    xor ebx, ebx
    cmp dword ptr [esi + 12], ebx
    jbe L38
L35:
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [eax + ebx*4]
    cmp dword ptr [ecx + 40], 0
    jne L36
    mov dword ptr [ecx + 40], 2
L36:
    mov edi, dword ptr [esi + 000000224h]
    cmp edi, 000000200h
    jae L41
    mov edx, dword ptr [ecx]
    and edx, 0FFF00000h
    cmp dword ptr [ecx + 40], 2
    jne L37
    push edx
    call sub_100A71BE
    test eax, eax
    jne L37
    cmp edx, 011000000h
    je L37
    cmp edx, 072100000h
    je L37
    mov eax, dword ptr [esi + 000000230h]
    mov dword ptr [eax + edi*4], ecx
    inc dword ptr [esi + 000000224h]
L37:
    inc ebx
    cmp ebx, dword ptr [esi + 12]
    jb L35
L38:
    xor eax, eax
L39:
    pop edi
    pop esi
    pop ebx
    leave
    ret
L40:
    mov eax, 08007000Eh
    jmp L39
L41:
    mov eax, 080004005h
    jmp L39
FUN_100b174b ENDP
END
