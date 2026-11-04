.686
.MODEL FLAT, C
EXTRN sub_100C9B5A:PROC
EXTRN sub_100C9B9D:PROC
EXTRN sub_100C9C4F:PROC
EXTRN sub_100C9C96:PROC
EXTRN sub_100CB3D0:PROC
.CODE
FUN_100b6fd4 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 24
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [eax + 12]
    push edi
    xor edi, edi
    cmp ecx, edi
    mov dword ptr [ebp - 4], edi
    jbe L1
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [eax + 16]
L0:
    mov ebx, dword ptr [eax]
    mov ebx, dword ptr [edx + ebx*4]
    test byte ptr [ebx + 3], 2
    je L1
    inc dword ptr [ebp - 4]
    add eax, 4
    cmp dword ptr [ebp - 4], ecx
    jb L0
L1:
    cmp dword ptr [ebp - 4], ecx
    jae L2
    mov eax, dword ptr [esi + 000000100h]
    push edi
    push edi
    push dword ptr [eax + 4]
    push dword ptr [eax + 12]
    push dword ptr [eax + 8]
    push dword ptr [eax + 16]
    push 14
    jmp L3
L2:
    mov eax, dword ptr [esi + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000200h
    mov eax, dword ptr [esi + 000000100h]
    jb L4
    push edi
    push edi
    push dword ptr [eax + 4]
    push dword ptr [eax + 12]
    push dword ptr [eax + 8]
    push dword ptr [eax + 16]
    push 78
L3:
    mov ecx, esi
    call sub_100CB3D0
    jmp L15
L4:
    mov edx, dword ptr [eax + 12]
    cmp edx, dword ptr [eax + 4]
    mov dword ptr [ebp - 8], edi
    jbe L7
    mov eax, dword ptr [esi]
    push edi
    push edi
    push 4
    lea ecx, [ebp - 24]
    push ecx
    push dword ptr [esi + 0000000FCh]
    mov ecx, esi
    call dword ptr [eax + 0x80]
    cmp eax, edi
    jl L15
    mov eax, dword ptr [esi + 000000100h]
    push edi
    push edi
    push edi
    push edi
    push 1
    push edi
    push edi
    push dword ptr [eax + 8]
    lea eax, [ebp - 16]
    push 1
    push eax
    push 78
    mov ecx, esi
    call sub_100C9B5A
    cmp eax, edi
    jl L15
    mov eax, dword ptr [esi + 000000100h]
    xor ecx, ecx
    cmp dword ptr [eax + 12], edi
    jbe L6
L5:
    mov edx, dword ptr [ebp - 16]
    mov dword ptr [ebp + ecx*4 - 24], edx
    inc ecx
    cmp ecx, dword ptr [eax + 12]
    jb L5
L6:
    mov eax, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [eax + 12]
    push edi
    push edi
    push edi
    push edi
    push ecx
    push edi
    push edi
    lea edx, [ebp - 24]
    push edx
    push ecx
    push dword ptr [eax + 16]
    mov ecx, esi
    push 1
    call sub_100C9B9D
    cmp eax, edi
    jge L14
    jmp L15
L7:
    cmp ecx, edi
    mov dword ptr [ebp - 4], edi
    jbe L14
L8:
    mov eax, dword ptr [esi + 000000100h]
    mov ebx, dword ptr [ebp - 4]
    mov edx, dword ptr [eax + 16]
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [eax + 8]
    shl ebx, 2
    mov edx, dword ptr [ebx + edx]
    mov edx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [edx + 16]
    cmp edx, edi
    mov eax, dword ptr [ebx + eax]
    mov ecx, dword ptr [ecx + eax*4]
    jne L9
    test byte ptr [ecx], 2
    jne L12
L9:
    cmp edx, 2
    je L12
    cmp edx, 3
    jne L10
    mov ecx, dword ptr [ecx]
    test cl, 4
    je L10
    test cl, 8
    jne L12
L10:
    cmp dword ptr [ebp - 8], edi
    jne L11
    mov eax, dword ptr [esi]
    push edi
    push edi
    push 4
    lea ecx, [ebp - 24]
    push ecx
    push dword ptr [esi + 0000000FCh]
    mov ecx, esi
    call dword ptr [eax + 0x80]
    cmp eax, edi
    jl L15
    mov dword ptr [ebp - 8], 1
L11:
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax + 8]
    push edi
    push edi
    push edi
    push edi
    push 1
    push edi
    push edi
    add eax, ebx
    push eax
    push 1
    lea eax, [ebp - 16]
    push eax
    push 78
    mov ecx, esi
    call sub_100C9C4F
    cmp eax, edi
    jl L15
    push edi
    push edi
    push edi
    push edi
    push 1
    push edi
    push edi
    lea eax, [ebp - 16]
    push eax
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax + 16]
    push 1
    add eax, ebx
    push eax
    push 1
    jmp L13
L12:
    mov eax, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [eax + 8]
    mov eax, dword ptr [eax + 16]
    push edi
    push edi
    push edi
    push edi
    push 1
    push edi
    push edi
    add ecx, ebx
    push ecx
    push 1
    add eax, ebx
    push eax
    push 78
L13:
    mov ecx, esi
    call sub_100C9C96
    cmp eax, edi
    jl L15
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [ebp - 4]
    cmp ecx, dword ptr [eax + 12]
    jb L8
L14:
    xor eax, eax
L15:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100b6fd4 ENDP
END
