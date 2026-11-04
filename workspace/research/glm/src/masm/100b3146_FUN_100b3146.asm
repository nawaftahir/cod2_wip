.686
.MODEL FLAT, C
EXTRN sub_1008615F:PROC
EXTRN sub_100861CE:PROC
EXTRN sub_100861E9:PROC
EXTRN sub_100BA90A:PROC
EXTRN sub_100BA98A:PROC
EXTRN sub_100BE2B9:PROC
.CODE
FUN_100b3146 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    push esi
    mov esi, ecx
    or dword ptr [esi + 000000220h], 0FFFFFFFFh
    or dword ptr [esi + 000000224h], 0FFFFFFFFh
    push edi
    xor edi, edi
    cmp dword ptr [esi + 12], edi
    mov dword ptr [ebp - 4], edi
    mov ebx, 0FFF00000h
    jbe L3
L0:
    mov eax, dword ptr [esi + 24]
    lea eax, [eax + edi*4]
    mov dword ptr [esi + 0000000FCh], edi
    mov ecx, dword ptr [eax]
    mov dword ptr [esi + 000000100h], ecx
    mov dword ptr [esi + 0000000FCh], edi
    mov eax, dword ptr [eax]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, ebx
    cmp eax, 020300000h
    je L1
    cmp eax, 020200000h
    jne L2
L1:
    cmp dword ptr [esi + 000000220h], -1
    jne L2
    push 4
    push 1
    push 000000311h
    push 01010E914h
    mov ecx, esi
    call sub_1008615F
    fldz
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 0
    push 0
    push eax
    mov ecx, esi
    mov dword ptr [ebp - 8], eax
    call sub_100861CE
    fld1
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 1
    push 0
    push dword ptr [ebp - 8]
    mov ecx, esi
    mov dword ptr [esi + 000000220h], eax
    call sub_100861E9
    mov dword ptr [esi + 000000224h], eax
L2:
    inc edi
    cmp edi, dword ptr [esi + 12]
    jb L0
L3:
    mov ecx, esi
    call sub_100BA90A
    test byte ptr [esi + 0000000CCh], 4
    jne L9
    xor edi, edi
    cmp dword ptr [esi + 12], edi
    jbe L9
L4:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], edi
    mov eax, dword ptr [eax + edi*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    mov ecx, eax
    and ecx, ebx
    cmp ecx, 010300000h
    je L6
    cmp ecx, 010500000h
    je L6
    cmp ecx, 010600000h
    je L6
    cmp ecx, 010700000h
    je L6
    cmp ecx, 050000000h
    je L5
    mov dword ptr [ebp - 4], 1
    jmp L8
L5:
    and eax, 0000FFFFFh
    cmp eax, 2
    jbe L7
L6:
    mov ecx, esi
    call sub_100BE2B9
    mov dword ptr [ebp - 4], eax
L7:
    cmp dword ptr [ebp - 4], 0
    jl L13
L8:
    inc edi
    cmp edi, dword ptr [esi + 12]
    jb L4
L9:
    mov ecx, esi
    call sub_100BA98A
    xor ecx, ecx
    cmp dword ptr [esi + 8], ecx
    jbe L12
L10:
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
    cmp dword ptr [eax + 84], -1
    jne L11
    mov edx, dword ptr [eax + 4]
    mov edi, dword ptr [esi + 16]
    mov edx, dword ptr [edi + edx*4]
    test byte ptr [edx + 5], 1
    je L11
    cmp dword ptr [esi + 000000224h], ecx
    je L11
    cmp dword ptr [esi + 000000220h], ecx
    je L11
    mov edx, dword ptr [esi + 116]
    mov dword ptr [eax + 4], edx
L11:
    inc ecx
    cmp ecx, dword ptr [esi + 8]
    jb L10
L12:
    and dword ptr [ebp - 4], 0
L13:
    mov eax, dword ptr [ebp - 4]
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100b3146 ENDP
END
