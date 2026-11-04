.686
.MODEL FLAT, C
EXTRN sub_1008543B:PROC
EXTRN sub_1008557E:PROC
EXTRN sub_10085E6D:PROC
EXTRN sub_10086266:PROC
EXTRN sub_10086329:PROC
EXTRN sub_10086346:PROC
EXTRN sub_1008634E:PROC
EXTRN g_1019BEB8:DWORD
.CODE
FUN_100a5b26 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 32
    push ebx
    push esi
    push edi
    xor edi, edi
    mov esi, ecx
    or ebx, 0FFFFFFFFh
    cmp dword ptr [esi + 12], edi
    mov dword ptr [ebp - 20], edi
    jbe L13
L0:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], edi
    mov eax, dword ptr [eax + edi*4]
    mov dword ptr [esi + 000000100h], eax
    test word ptr [eax + 2], 00000FFF0h
    je L10
    mov ecx, dword ptr [eax]
    mov eax, dword ptr [eax + 4]
    and ecx, 0000FFFFFh
    xor edx, edx
    div ecx
    and dword ptr [ebp - 4], 0
    test eax, eax
    mov dword ptr [ebp - 28], eax
    jbe L10
L1:
    mov ecx, dword ptr [esi + 000000100h]
    lea eax, [ebp - 8]
    push eax
    push dword ptr [ebp - 4]
    call sub_1008543B
    and dword ptr [ebp - 12], 0
    test eax, eax
    mov dword ptr [ebp - 24], eax
    jbe L9
L2:
    mov edi, dword ptr [ebp - 12]
    mov eax, dword ptr [ebp - 8]
    mov ecx, dword ptr [esi + 20]
    mov edx, dword ptr [esi + 16]
    shl edi, 2
    mov eax, dword ptr [edi + eax]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax + 4]
    mov ecx, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [ecx + 4]
    test cl, 16
    je L8
    test ch, 2
    jne L8
    push dword ptr [eax + 108]
    mov edx, dword ptr [esi]
    mov ecx, esi
    call dword ptr [edx + 0x54]
    cmp eax, 17
    jne L8
    cmp dword ptr [ebp - 4], 0
    jne L3
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 030000000h
    je L8
L3:
    cmp ebx, -1
    jne L7
    and dword ptr [ebp - 16], 0
    cmp dword ptr [esi + 8], 0
    jbe L6
    mov edx, dword ptr [esi + 000000088h]
    mov ecx, dword ptr [esi + 20]
    mov ebx, dword ptr [esi + 8]
L4:
    mov eax, dword ptr [ecx]
    cmp edx, dword ptr [eax + 4]
    jne L5
    mov eax, dword ptr [eax + 12]
    cmp eax, dword ptr [ebp - 16]
    jb L5
    inc eax
    mov dword ptr [ebp - 16], eax
L5:
    add ecx, 4
    dec ebx
    jne L4
L6:
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push 0
    push dword ptr [ebp - 16]
    mov ecx, esi
    push dword ptr [esi + 000000088h]
    call sub_10086266
    mov ebx, eax
    cmp ebx, -1
    je L15
    mov ecx, dword ptr [ebp - 8]
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [edi + ecx]
    push dword ptr [eax + ecx*4]
    mov ecx, dword ptr [eax + ebx*4]
    call sub_10085E6D
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ebx*4]
    or dword ptr [eax + 108], 0FFFFFFFFh
    mov eax, dword ptr [ebp - 8]
    mov eax, dword ptr [edi + eax]
    mov dword ptr [ebp - 32], eax
    mov eax, dword ptr [esi + 000000100h]
    mov dword ptr [ebp - 16], eax
L7:
    mov eax, dword ptr [ebp - 8]
    inc dword ptr [ebp - 12]
    mov dword ptr [edi + eax], ebx
    mov eax, dword ptr [ebp - 12]
    cmp eax, dword ptr [ebp - 24]
    jb L2
L8:
    mov edi, dword ptr [ebp - 20]
L9:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp - 28]
    jb L1
L10:
    inc edi
    cmp edi, dword ptr [esi + 12]
    mov dword ptr [ebp - 20], edi
    jb L0
    cmp ebx, -1
    je L13
    push 1
    push 3
    push 030000001h
    mov ecx, esi
    call sub_1008634E
    cmp eax, -1
    je L15
    mov ecx, dword ptr [esi + 24]
    mov edi, dword ptr [ecx + eax*4]
    push dword ptr [ebp - 16]
    mov ecx, edi
    call sub_1008557E
    fld1
    mov ecx, dword ptr [ebp - 32]
    mov eax, dword ptr [edi + 16]
    push ecx
    push ecx
    mov dword ptr [eax], ebx
    fstp qword ptr [esp]
    mov eax, dword ptr [edi + 8]
    xor ebx, ebx
    push ebx
    mov dword ptr [eax], ecx
    push ebx
    push dword ptr [esi + 120]
    mov ecx, esi
    call sub_10086329
    fld qword ptr [g_1019BEB8]
    mov ecx, dword ptr [edi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    mov dword ptr [ecx + 4], eax
    push ebx
    push dword ptr [esi + 120]
    mov ecx, esi
    call sub_10086346
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [ecx + 8], eax
    mov eax, dword ptr [edi + 8]
    cmp dword ptr [eax + 4], -1
    je L15
    cmp dword ptr [eax + 8], -1
    je L15
    mov ecx, dword ptr [esi + 12]
    jmp L12
L11:
    dec ecx
    lea eax, [eax + ecx*4]
    mov edx, dword ptr [eax - 4]
    mov dword ptr [eax], edx
L12:
    cmp ecx, 1
    mov eax, dword ptr [esi + 24]
    ja L11
    mov dword ptr [eax], edi
L13:
    xor eax, eax
L14:
    pop edi
    pop esi
    pop ebx
    leave
    ret
L15:
    mov eax, 08007000Eh
    jmp L14
FUN_100a5b26 ENDP
END
