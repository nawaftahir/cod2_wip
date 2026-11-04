.686
.MODEL FLAT, C
EXTRN sub_1006C51E:PROC
EXTRN sub_1008539D:PROC
EXTRN sub_1008582D:PROC
EXTRN sub_100858AA:PROC
EXTRN sub_1008611D:PROC
EXTRN sub_10086200:PROC
.CODE
FUN_100a7c24 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 12]
    push edi
    push 116
    mov dword ptr [ebp - 16], eax
    call sub_1008582D
    test eax, eax
    je L0
    mov ecx, eax
    call sub_1008539D
    mov edi, eax
    jmp L1
L0:
    xor edi, edi
L1:
    test edi, edi
    jne L2
    mov eax, 08007000Eh
    jmp L20
L2:
    push ebx
    push 0
    push 4
    push 4
    push 010000004h
    mov ecx, edi
    call sub_100858AA
    test eax, eax
    jl L7
    or dword ptr [ebp - 4], 0FFFFFFFFh
    xor ecx, ecx
    cmp dword ptr [esi + 8], ecx
    jbe L5
L3:
    mov edx, dword ptr [esi + 20]
    mov eax, ecx
    shl eax, 2
    mov edx, dword ptr [eax + edx]
    mov edx, dword ptr [edx + 4]
    cmp edx, dword ptr [esi + 000000084h]
    jne L4
    mov edx, dword ptr [esi + 20]
    mov edx, dword ptr [eax + edx]
    mov edx, dword ptr [edx + 16]
    mov ebx, dword ptr [edi + 8]
    mov dword ptr [ebx + edx*4], ecx
    mov edx, dword ptr [esi + 20]
    mov edx, dword ptr [eax + edx]
    mov ebx, dword ptr [esi + 000000088h]
    mov dword ptr [edx + 4], ebx
    mov edx, dword ptr [esi + 20]
    mov edx, dword ptr [eax + edx]
    or dword ptr [edx + 12], 0FFFFFFFFh
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [eax + edx]
    mov eax, dword ptr [eax + 108]
    mov dword ptr [ebp - 4], eax
L4:
    inc ecx
    cmp ecx, dword ptr [esi + 8]
    jb L3
L5:
    xor ebx, ebx
L6:
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push ebx
    push 0
    push dword ptr [esi + 000000084h]
    mov ecx, esi
    call sub_10086200
    mov ecx, dword ptr [edi + 16]
    mov dword ptr [ecx + ebx*4], eax
    mov eax, dword ptr [edi + 16]
    cmp dword ptr [eax + ebx*4], -1
    je L9
    mov eax, dword ptr [eax + ebx*4]
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ecx + eax*4]
    and dword ptr [eax + 60], 0
    mov ecx, dword ptr [ebp - 4]
    inc ebx
    cmp ebx, 4
    mov dword ptr [eax + 108], ecx
    jb L6
    push edi
    mov ecx, esi
    call sub_1008611D
    test eax, eax
    jge L10
L7:
    mov esi, eax
L8:
    push 1
    mov ecx, edi
    call sub_1006C51E
    mov eax, esi
    jmp L19
L9:
    mov esi, 08007000Eh
    jmp L8
L10:
    xor eax, eax
    cmp dword ptr [ebp - 16], eax
    mov dword ptr [ebp - 12], eax
    jbe L18
L11:
    mov ecx, dword ptr [esi + 24]
    mov eax, dword ptr [ecx + eax*4]
    test eax, eax
    mov dword ptr [ebp - 8], eax
    je L17
    mov ecx, dword ptr [eax + 12]
    test ecx, ecx
    mov dword ptr [ebp - 20], ecx
    je L17
    mov edx, dword ptr [eax + 16]
    mov edx, dword ptr [edx]
    mov ebx, dword ptr [esi + 20]
    mov edx, dword ptr [ebx + edx*4]
    mov edx, dword ptr [edx + 4]
    cmp edx, dword ptr [esi + 000000084h]
    jne L17
    and dword ptr [ebp - 4], 0
    test ecx, ecx
    jbe L17
    jmp L13
L12:
    mov eax, dword ptr [ebp - 8]
L13:
    xor ecx, ecx
    jmp L15
L14:
    mov eax, dword ptr [ebp - 8]
L15:
    mov edx, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 16]
    lea eax, [eax + edx*4]
    mov edx, dword ptr [edi + 16]
    mov ebx, dword ptr [eax]
    cmp ebx, dword ptr [ecx + edx]
    jne L16
    mov edx, dword ptr [edi + 8]
    mov edx, dword ptr [ecx + edx]
    mov dword ptr [eax], edx
L16:
    add ecx, 4
    cmp ecx, 16
    jb L14
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp - 20]
    jb L12
L17:
    mov eax, dword ptr [ebp - 12]
    inc eax
    cmp eax, dword ptr [ebp - 16]
    mov dword ptr [ebp - 12], eax
    jb L11
L18:
    xor eax, eax
L19:
    pop ebx
L20:
    pop edi
    pop esi
    leave
    ret
FUN_100a7c24 ENDP
END
