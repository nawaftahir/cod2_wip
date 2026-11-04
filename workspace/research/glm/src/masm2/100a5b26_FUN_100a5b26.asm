.686
.MODEL FLAT, C
EXTRN sub_1008543B:PROC
EXTRN sub_1008557E:PROC
EXTRN sub_10085E6D:PROC
EXTRN sub_10086266:PROC
EXTRN sub_10086329:PROC
EXTRN sub_10086346:PROC
EXTRN sub_1008634E:PROC
EXTRN sub_100A5D73:PROC
EXTRN sub_100A5D7E:PROC
EXTRN sub_100A5D7F:PROC
EXTRN sub_100A5E9F:PROC
EXTRN sub_100A5F05:PROC
EXTRN sub_100A5F25:PROC
EXTRN sub_100A5F7D:PROC
EXTRN sub_100A5F83:PROC
EXTRN sub_100A5F85:PROC
EXTRN sub_100A5F89:PROC
EXTRN sub_100A5FAA:PROC
EXTRN EXTRN g_1019BEB8:DWORD:DWORD
.CODE
FUN_100a5b26 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 32
    push push ebx
    push push esi
    push push edi
    xor xor edi, edi
    mov mov esi, ecx
    or or ebx, -1
    cmp cmp dword ptr [esi + 12], edi
    mov mov dword ptr [ebp - 20], edi
    jbe sub_100A5D7E
    mov mov eax, dword ptr [esi + 24]
    mov mov dword ptr [esi + 0FCh], edi
    mov mov eax, dword ptr [eax + edi*4]
    mov mov dword ptr [esi + 0100h], eax
    test test word ptr [eax + 2], 0FFF0h
    je L2
    mov mov ecx, dword ptr [eax]
    mov mov eax, dword ptr [eax + 4]
    and and ecx, 0FFFFFh
    xor xor edx, edx
    div div ecx
    and and dword ptr [ebp - 4], 0
    test test eax, eax
    mov mov dword ptr [ebp - 28], eax
    jbe L3
    mov mov ecx, dword ptr [esi + 0100h]
    lea lea eax, [ebp - 8]
    push push eax
    push push dword ptr [ebp - 4]
    call sub_1008543B
    and and dword ptr [ebp - 12], 0
    test test eax, eax
    mov mov dword ptr [ebp - 24], eax
    jbe L5
    mov mov edi, dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [esi + 20]
    mov mov edx, dword ptr [esi + 16]
    shl shl edi, 2
    mov mov eax, dword ptr [edi + eax]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [eax + 4]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov ecx, dword ptr [ecx + 4]
    test test cl, 16
    je L10
    test test ch, 2
    jne L11
    push push dword ptr [eax + 108]
    mov mov edx, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [edx + 84]
    cmp cmp eax, 17
    jne L12
    cmp cmp dword ptr [ebp - 4], 0
    jne L0
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax]
    and and eax, 0FFF00000h
    cmp cmp eax, 030000000h
    je sub_100A5D7F
    cmp cmp ebx, -1
    jne sub_100A5D73
    and and dword ptr [ebp - 16], 0
    cmp cmp dword ptr [esi + 8], 0
    jbe L6
    mov mov edx, dword ptr [esi + 088h]
    mov mov ecx, dword ptr [esi + 20]
    mov mov ebx, dword ptr [esi + 8]
    mov mov eax, dword ptr [ecx]
    cmp cmp edx, dword ptr [eax + 4]
    jne L8
    mov mov eax, dword ptr [eax + 12]
    cmp cmp eax, dword ptr [ebp - 16]
    jb L9
    inc inc eax
    mov mov dword ptr [ebp - 16], eax
    add add ecx, 4
    dec dec ebx
    jne L7
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push 0
    push push dword ptr [ebp - 16]
    mov mov ecx, esi
    push push dword ptr [esi + 088h]
    call sub_10086266
    mov mov ebx, eax
    cmp cmp ebx, -1
    je sub_100A5E9F
    mov mov ecx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [edi + ecx]
    push push dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [eax + ebx*4]
    call sub_10085E6D
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + ebx*4]
    or or dword ptr [eax + 108], -1
    mov mov eax, dword ptr [ebp - 8]
    mov mov eax, dword ptr [edi + eax]
    mov mov dword ptr [ebp - 32], eax
    mov mov eax, dword ptr [esi + 0100h]
    mov mov dword ptr [ebp - 16], eax
    mov mov eax, dword ptr [ebp - 8]
    inc inc dword ptr [ebp - 12]
    mov mov dword ptr [edi + eax], ebx
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp eax, dword ptr [ebp - 24]
    jb L4
    mov mov edi, dword ptr [ebp - 20]
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebp - 28]
    jb L3
    inc inc edi
    cmp cmp edi, dword ptr [esi + 12]
    mov mov dword ptr [ebp - 20], edi
    jb L1
    cmp cmp ebx, -1
    je sub_100A5F05
    push push 1
    push push 3
    push push 030000001h
    mov mov ecx, esi
    call sub_1008634E
    cmp cmp eax, -1
    je sub_100A5F25
    mov mov ecx, dword ptr [esi + 24]
    mov mov edi, dword ptr [ecx + eax*4]
    push push dword ptr [ebp - 16]
    mov mov ecx, edi
    call sub_1008557E
    fld1 fld1
    mov mov ecx, dword ptr [ebp - 32]
    mov mov eax, dword ptr [edi + 16]
    push push ecx
    push push ecx
    mov mov dword ptr [eax], ebx
    fstp fstp qword ptr [esp]
    mov mov eax, dword ptr [edi + 8]
    xor xor ebx, ebx
    push push ebx
    mov mov dword ptr [eax], ecx
    push push ebx
    push push dword ptr [esi + 120]
L3:
    mov mov ecx, esi
    call sub_10086329
    fld fld qword ptr [g_1019BEB8]
    mov mov ecx, dword ptr [edi + 8]
    push push ecx
    push push ecx
L5:
    fstp fstp qword ptr [esp]
    push push ebx
    mov mov dword ptr [ecx + 4], eax
    push push ebx
L6:
    push push dword ptr [esi + 120]
    mov mov ecx, esi
    call sub_10086346
    mov mov ecx, dword ptr [edi + 8]
L8:
    mov mov dword ptr [ecx + 8], eax
    mov mov eax, dword ptr [edi + 8]
    cmp cmp dword ptr [eax + 4], -1
    je sub_100A5F83
    cmp cmp dword ptr [eax + 8], -1
    je sub_100A5F89
    mov mov ecx, dword ptr [esi + 12]
    jmp sub_100A5F7D
    dec dec ecx
L11:
    lea lea eax, [eax + ecx*4]
    mov mov edx, dword ptr [eax - 4]
    mov mov dword ptr [eax], edx
    cmp cmp ecx, 1
    mov mov eax, dword ptr [esi + 24]
    ja sub_100A5F85
    mov mov dword ptr [eax], edi
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
    mov mov eax, 08007000Eh
    jmp sub_100A5FAA
FUN_100a5b26 ENDP
END
