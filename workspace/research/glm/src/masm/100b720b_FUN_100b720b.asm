.686
.MODEL FLAT, C
EXTRN sub_100C9B5B:PROC
EXTRN sub_100C9B9D:PROC
EXTRN sub_100C9C3F:PROC
EXTRN sub_100C9C69:PROC
EXTRN sub_100CB3D0:PROC
.CODE
FUN_100b720b PROC
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
    push 15
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
    push 79
L3:
    mov ecx, esi
    call sub_100CB3D0
    jmp L13
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
    jl L13
    mov eax, dword ptr [esi + 000000100h]
    push edi
    push edi
    push edi
    push edi
    xor ebx, ebx
    inc ebx
    push ebx
    push edi
    push edi
    push dword ptr [eax + 8]
    lea eax, [ebp - 16]
    push ebx
    push eax
    push 79
    mov ecx, esi
    call sub_100C9B5B
    cmp eax, edi
    jl L13
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
    push ebx
    call sub_100C9B9D
    cmp eax, edi
    jge L12
    jmp L13
L7:
    cmp ecx, edi
    mov dword ptr [ebp - 4], edi
    jbe L12
    xor ebx, ebx
    inc ebx
L8:
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax + 16]
    mov edx, dword ptr [esi + 20]
    shl ecx, 2
    mov eax, dword ptr [ecx + eax]
    mov eax, dword ptr [edx + eax*4]
    cmp dword ptr [eax + 16], 2
    jne L9
    mov eax, dword ptr [esi + 000000100h]
    mov edx, dword ptr [eax + 8]
    mov eax, dword ptr [eax + 16]
    push edi
    push edi
    push edi
    push edi
    push ebx
    push edi
    push edi
    add edx, ecx
    push edx
    push ebx
    add eax, ecx
    push eax
    push 79
    jmp L11
L9:
    cmp dword ptr [ebp - 8], edi
    jne L10
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
    jl L13
    mov dword ptr [ebp - 8], ebx
L10:
    mov eax, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [eax + 8]
    mov eax, dword ptr [ebp - 4]
    push edi
    push edi
    push edi
    push edi
    push ebx
    push edi
    push edi
    shl eax, 2
    add ecx, eax
    push ecx
    push ebx
    lea eax, [ebp - 16]
    push eax
    push 79
    mov ecx, esi
    call sub_100C9C3F
    cmp eax, edi
    jl L13
    push edi
    push edi
    push edi
    push edi
    push ebx
    push edi
    push edi
    lea eax, [ebp - 16]
    push eax
    mov eax, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [eax + 16]
    mov eax, dword ptr [ebp - 4]
    shl eax, 2
    push ebx
    add ecx, eax
    push ecx
    push ebx
L11:
    mov ecx, esi
    call sub_100C9C69
    cmp eax, edi
    jl L13
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [ebp - 4]
    cmp ecx, dword ptr [eax + 12]
    jb L8
L12:
    xor eax, eax
L13:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100b720b ENDP
END
