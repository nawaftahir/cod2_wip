.686
.MODEL FLAT, C
EXTRN sub_1006C5C7:PROC
EXTRN sub_10085410:PROC
EXTRN sub_1008548A:PROC
EXTRN sub_100858A0:PROC
EXTRN sub_1008591E:PROC
EXTRN sub_100861A2:PROC
EXTRN sub_10086242:PROC
.CODE
FUN_100a7a71 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 16
    and dword ptr [ebp - 4], 0
    push ebx
    push esi
    mov esi, ecx
    cmp dword ptr [esi + 76], 0
    push edi
    jbe L6
L0:
    mov eax, dword ptr [esi + 000000230h]
    mov ecx, dword ptr [ebp - 4]
    mov edx, dword ptr [eax + ecx*4]
    test edx, edx
    je L5
    mov ecx, dword ptr [edx]
    mov eax, ecx
    and eax, 0FFF00000h
    cmp eax, 072100000h
    je L5
    test eax, eax
    je L5
    sub eax, 011000000h
    mov ebx, 0000FFFFFh
    and ecx, ebx
    neg eax
    sbb eax, eax
    and eax, ecx
    shl eax, 2
    mov dword ptr [ebp - 8], ecx
    mov ecx, dword ptr [edx + 8]
    mov dword ptr [ebp - 12], eax
    mov eax, dword ptr [eax + ecx]
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 4]
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [ecx + eax*4]
    test byte ptr [eax + 5], 2
    je L5
    push 116
    call sub_100858A0
    test eax, eax
    je L1
    mov ecx, eax
    call sub_10085410
    mov edi, eax
    jmp L2
L1:
    xor edi, edi
L2:
    test edi, edi
    je L8
    mov eax, dword ptr [ebp - 8]
    push 0
    push dword ptr [ebp - 8]
    and eax, ebx
    push dword ptr [ebp - 8]
    or eax, 010000000h
    push eax
    mov ecx, edi
    call sub_1008591E
    test eax, eax
    jl L10
    mov eax, dword ptr [esi + 000000230h]
    mov ecx, dword ptr [ebp - 4]
    push dword ptr [eax + ecx*4]
    mov ecx, edi
    call sub_1008548A
    test eax, eax
    jl L10
    xor ebx, ebx
    cmp dword ptr [ebp - 8], ebx
    mov dword ptr [ebp - 16], ebx
    jbe L4
    mov eax, dword ptr [ebp - 12]
    mov dword ptr [ebp - 12], eax
L3:
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push ebx
    push 0
    push dword ptr [esi + 000000088h]
    mov ecx, esi
    call sub_10086242
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    and dword ptr [ecx + 60], 0
    mov ecx, dword ptr [edi + 16]
    mov edx, dword ptr [ebp - 4]
    mov dword ptr [ecx + ebx*4], eax
    mov ecx, dword ptr [esi + 000000230h]
    mov ecx, dword ptr [ecx + edx*4]
    mov ecx, dword ptr [ecx + 8]
    mov ebx, dword ptr [ebp - 12]
    mov ecx, dword ptr [ebx + ecx]
    mov edx, dword ptr [edi + 8]
    mov ebx, dword ptr [ebp - 16]
    mov dword ptr [edx + ebx*4], ecx
    mov ecx, dword ptr [esi + 000000230h]
    mov edx, dword ptr [ebp - 4]
    mov ecx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [ebp - 12]
    mov ecx, dword ptr [ecx + 8]
    add dword ptr [ebp - 12], 4
    inc ebx
    cmp ebx, dword ptr [ebp - 8]
    mov dword ptr [edx + ecx], eax
    mov dword ptr [ebp - 16], ebx
    jb L3
L4:
    lea eax, [esi + 000000220h]
    mov ecx, dword ptr [eax]
    cmp ecx, 000000200h
    jae L9
    mov edx, dword ptr [esi + 00000022Ch]
    mov dword ptr [edx + ecx*4], edi
    inc dword ptr [eax]
    push edi
    mov ecx, esi
    call sub_100861A2
    test eax, eax
    jl L10
L5:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [esi + 76]
    jb L0
L6:
    xor eax, eax
L7:
    pop edi
    pop esi
    pop ebx
    leave
    ret
L8:
    mov eax, 08007000Eh
    jmp L7
L9:
    mov esi, 08007000Eh
    jmp L11
L10:
    mov esi, eax
L11:
    push 1
    mov ecx, edi
    call sub_1006C5C7
    mov eax, esi
    jmp L7
FUN_100a7a71 ENDP
END
