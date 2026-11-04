.686
.MODEL FLAT, C
EXTRN sub_10085E29:PROC
EXTRN sub_10085EF7:PROC
EXTRN sub_100862D7:PROC
EXTRN sub_100863DA:PROC
EXTRN sub_1008D837:PROC
EXTRN sub_100C1ECD:PROC
EXTRN sub_100C224E:PROC
EXTRN sub_100C22EE:PROC
EXTRN sub_100C2FCA:PROC
EXTRN g_1019BE20:DWORD
.CODE
FUN_100c7816 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 00000010Ch
    push ebx
    push esi
    xor ebx, ebx
    mov esi, ecx
    xor eax, eax
    cmp dword ptr [esi + 8], ebx
    push edi
    mov dword ptr [ebp - 12], ebx
    jbe L1
L0:
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    or dword ptr [ecx + 48], 0FFFFFFFFh
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    or dword ptr [ecx + 52], 0FFFFFFFFh
    inc eax
    cmp eax, dword ptr [esi + 8]
    jb L0
L1:
    mov eax, dword ptr [esi + 12]
    push ebx
    push ebx
    push ebx
    push 1
    push eax
    push ebx
    push ebx
    push ebx
    mov dword ptr [ebp - 8], eax
    lea eax, [ebp - 12]
    push eax
    push 1
    push -1
    mov ecx, esi
    call sub_100C2FCA
    cmp dword ptr [esi + 8], ebx
    jbe L5
L2:
    mov edx, dword ptr [esi + 20]
    mov ecx, ebx
    shl ecx, 2
    add edx, ecx
    mov edi, dword ptr [edx]
    cmp dword ptr [edi + 48], -1
    jne L3
    cmp dword ptr [edi + 52], -1
    je L4
L3:
    mov edx, dword ptr [edx]
    mov edi, dword ptr [edx + 48]
    mov dword ptr [edx + 20], edi
    mov edx, dword ptr [esi + 20]
    mov edx, dword ptr [ecx + edx]
    mov edi, dword ptr [edx + 52]
    mov dword ptr [edx + 24], edi
L4:
    mov edx, dword ptr [esi + 20]
    mov edx, dword ptr [ecx + edx]
    or dword ptr [edx + 48], 0FFFFFFFFh
    mov edx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + edx]
    or dword ptr [ecx + 52], 0FFFFFFFFh
    inc ebx
    cmp ebx, dword ptr [esi + 8]
    jb L2
    xor ebx, ebx
L5:
    xor ecx, ecx
    cmp dword ptr [ebp - 8], ebx
    jbe L7
L6:
    mov edx, dword ptr [esi + 24]
    mov edx, dword ptr [edx + ecx*4]
    inc ecx
    cmp ecx, dword ptr [ebp - 8]
    mov dword ptr [edx], ebx
    jb L6
L7:
    cmp eax, ebx
    jl L17
    push ebx
    push ebx
    lea eax, [ebp - 00000008Ch]
    push eax
    lea eax, [ebp - 00000010Ch]
    push eax
    mov ecx, esi
    mov dword ptr [esi + 0000000FCh], ebx
    call sub_100C1ECD
    cmp dword ptr [esi + 12], ebx
    mov dword ptr [ebp - 8], ebx
    jbe L16
L8:
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [ebp - 8]
    mov edi, dword ptr [eax + ecx*4]
    mov eax, dword ptr [edi]
    mov ecx, eax
    and eax, 0000FFFFFh
    and ecx, 0FFF00000h
    cmp eax, 1
    jne L15
    or ebx, 0FFFFFFFFh
    cmp ecx, 073000000h
    mov dword ptr [ebp - 12], ebx
    mov dword ptr [ebp - 4], ebx
    je L14
    cmp ecx, 073200000h
    je L14
    cmp ecx, 073100000h
    je L14
    cmp ecx, 073300000h
    je L14
    cmp ecx, 073B00000h
    jne L9
    mov eax, dword ptr [edi + 8]
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [eax + 4]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax + 4]
    mov edx, dword ptr [esi + 16]
    mov ecx, dword ptr [edx + ecx*4]
    test byte ptr [ecx + 5], 1
    je L15
    cmp dword ptr [eax + 8], ebx
    jne L15
    fld qword ptr [g_1019BE20]
    fld qword ptr [eax + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jp L15
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    xor eax, eax
    push eax
    push eax
    push eax
    mov ecx, esi
    call sub_100862D7
    mov ecx, eax
    cmp ecx, ebx
    mov dword ptr [ebp - 4], ecx
    je L18
    mov edx, dword ptr [edi + 8]
    mov eax, dword ptr [esi + 20]
    mov edx, dword ptr [edx]
    mov edx, dword ptr [eax + edx*4]
    mov ebx, dword ptr [eax + ecx*4]
    push edx
    mov ecx, ebx
    mov dword ptr [ebp - 12], edx
    call sub_10085E29
    test eax, eax
    jl L17
    push dword ptr [ebp - 12]
    mov ecx, ebx
    call sub_10085EF7
    test eax, eax
    jl L17
    xor dword ptr [ebx + 60], 000080000h
    mov eax, dword ptr [edi + 8]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [ebx + 56], eax
    mov eax, dword ptr [edi + 8]
    mov dword ptr [eax + 4], ecx
    jmp L15
L9:
    cmp ecx, 074200000h
    je L10
    cmp ecx, 074100000h
    jne L15
L10:
    mov eax, dword ptr [edi + 8]
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax + 4]
    mov edx, dword ptr [esi + 16]
    mov ecx, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [ecx + 4]
    test ch, 2
    je L15
    mov edx, 000040000h
    test edx, ecx
    jne L15
    lea ecx, [ebp - 4]
    push ecx
    push eax
    push edx
    push 01010E8ECh
    mov ecx, esi
    call sub_100C224E
    test eax, eax
    jl L17
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [ecx], eax
    mov ecx, dword ptr [esi + 20]
    mov ebx, dword ptr [ecx + eax*4]
    xor eax, eax
    inc eax
    cmp dword ptr [edi + 4], eax
    mov dword ptr [ebp - 4], eax
    jbe L15
L11:
    mov eax, dword ptr [edi + 8]
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + ecx*4]
    cmp eax, -1
    je L12
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [edx + eax*4]
    jmp L13
L12:
    mov eax, ebx
L13:
    fld qword ptr [eax + 32]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ecx
    push dword ptr [ebx + 12]
    mov ecx, esi
    push dword ptr [ebx + 4]
    call sub_100863DA
    mov edx, dword ptr [ebp - 4]
    mov ecx, dword ptr [edi + 8]
    inc dword ptr [ebp - 4]
    mov dword ptr [ecx + edx*4], eax
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [edi + 4]
    jb L11
    jmp L15
L14:
    mov eax, dword ptr [edi + 8]
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax + 4]
    mov edx, dword ptr [esi + 16]
    mov ecx, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [ecx + 4]
    test ch, 2
    je L15
    mov edx, 000002000h
    test edx, ecx
    jne L15
    lea ecx, [ebp - 12]
    push ecx
    push eax
    push edx
    push 01010E8D8h
    mov ecx, esi
    call sub_100C22EE
    test eax, eax
    jl L17
    mov eax, dword ptr [edi + 8]
    mov ecx, dword ptr [ebp - 12]
    mov dword ptr [eax], ecx
L15:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [esi + 12]
    jb L8
    xor ebx, ebx
L16:
    mov ecx, esi
    call sub_1008D837
    cmp eax, ebx
    jl L17
    xor eax, eax
L17:
    pop edi
    pop esi
    pop ebx
    leave
    ret
L18:
    mov eax, 08007000Eh
    jmp L17
FUN_100c7816 ENDP
END
