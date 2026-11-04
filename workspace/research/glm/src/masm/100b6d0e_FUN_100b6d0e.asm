.686
.MODEL FLAT, C
EXTRN sub_100C9AE3:PROC
EXTRN sub_100C9B26:PROC
EXTRN sub_100C9C12:PROC
EXTRN sub_100C9C3D:PROC
EXTRN sub_100C9CE5:PROC
EXTRN sub_100C9D0C:PROC
.CODE
FUN_100b6d0e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 44
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [eax + 12]
    push edi
    xor edi, edi
    cmp ecx, dword ptr [eax + 4]
    mov dword ptr [ebp - 20], edi
    jbe L2
    mov eax, dword ptr [esi]
    push edi
    push edi
    push 4
    lea ecx, [ebp - 44]
    push ecx
    push dword ptr [esi + 0000000FCh]
    mov ecx, esi
    call dword ptr [eax + 0x80]
    cmp eax, edi
    jl L17
    mov eax, dword ptr [esi + 000000100h]
    push edi
    push edi
    push edi
    push edi
    push 1
    push edi
    push edi
    push dword ptr [eax + 8]
    lea eax, [ebp - 40]
    push 1
    push eax
    push 78
    mov ecx, esi
    call sub_100C9AE3
    cmp eax, edi
    jl L17
    mov eax, dword ptr [esi + 000000100h]
    xor ecx, ecx
    cmp dword ptr [eax + 12], edi
    jbe L1
L0:
    mov edx, dword ptr [ebp - 40]
    mov dword ptr [ebp + ecx*4 - 44], edx
    inc ecx
    cmp ecx, dword ptr [eax + 12]
    jb L0
L1:
    mov eax, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [eax + 12]
    push edi
    push edi
    push edi
    push edi
    push ecx
    push edi
    push edi
    lea edx, [ebp - 44]
    push edx
    push ecx
    push dword ptr [eax + 16]
    mov ecx, esi
    push 1
    call sub_100C9B26
    cmp eax, edi
    jge L16
    jmp L17
L2:
    mov dword ptr [ebp - 16], edi
L3:
    mov eax, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [eax + 12]
    cmp ecx, edi
    mov dword ptr [ebp - 4], edi
    mov dword ptr [ebp - 24], ecx
    jbe L15
    mov dword ptr [ebp - 12], 1
    mov dword ptr [ebp - 8], 2
L4:
    mov ebx, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 16]
    mov ecx, dword ptr [esi + 20]
    shl ebx, 2
    add eax, ebx
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [ecx + edx*4]
    mov ecx, dword ptr [ecx + 16]
    cmp ecx, 1
    mov dword ptr [ebp - 28], ecx
    jne L5
    mov ecx, dword ptr [ebp - 8]
    cmp ecx, dword ptr [ebp - 24]
    jae L5
    cmp dword ptr [ebp - 16], 1
    jne L8
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
    jmp L7
L5:
    mov ecx, dword ptr [ebp - 12]
    cmp ecx, dword ptr [ebp - 24]
    jb L9
    cmp dword ptr [ebp - 16], edi
    jne L8
    cmp dword ptr [ebp - 20], edi
    jne L6
    mov eax, dword ptr [esi]
    push edi
    push edi
    push 4
    lea ecx, [ebp - 44]
    push ecx
    push dword ptr [esi + 0000000FCh]
    mov ecx, esi
    call dword ptr [eax + 0x80]
    cmp eax, edi
    jl L17
    mov dword ptr [ebp - 20], 1
L6:
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
    lea eax, [ebp - 40]
    push eax
    push 78
    mov ecx, esi
    call sub_100C9C12
    cmp eax, edi
    jl L17
    push edi
    push edi
    push edi
    push edi
    push 1
    push edi
    push edi
    lea eax, [ebp - 40]
    push eax
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax + 16]
    push 1
    add eax, ebx
    push eax
    push 1
L7:
    mov ecx, esi
    call sub_100C9C3D
    cmp eax, edi
    jl L17
L8:
    inc dword ptr [ebp - 4]
    inc dword ptr [ebp - 8]
    inc dword ptr [ebp - 12]
    jmp L14
L9:
    cmp dword ptr [ebp - 28], edi
    jne L10
    mov ecx, dword ptr [eax + 4]
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
    cmp dword ptr [eax + 16], 1
    jne L10
    cmp dword ptr [ebp - 16], 1
    jne L13
    mov eax, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [eax + 8]
    mov eax, dword ptr [eax + 16]
    push edi
    push edi
    push edi
    push edi
    push 2
    push edi
    push edi
    add ecx, ebx
    push ecx
    push 2
    add eax, ebx
    push eax
    push 19
    jmp L12
L10:
    cmp dword ptr [ebp - 16], edi
    jne L13
    cmp dword ptr [ebp - 20], edi
    jne L11
    mov eax, dword ptr [esi]
    push edi
    push edi
    push 4
    lea ecx, [ebp - 44]
    push ecx
    push dword ptr [esi + 0000000FCh]
    mov ecx, esi
    call dword ptr [eax + 0x80]
    cmp eax, edi
    jl L17
    mov dword ptr [ebp - 20], 1
L11:
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax + 8]
    push edi
    push edi
    push edi
    push edi
    push 2
    push edi
    push edi
    add eax, ebx
    push eax
    push 2
    lea eax, [ebp - 44]
    push eax
    push 19
    mov ecx, esi
    call sub_100C9CE5
    cmp eax, edi
    jl L17
    push edi
    push edi
    push edi
    push edi
    push 2
    push edi
    push edi
    lea eax, [ebp - 44]
    push eax
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax + 16]
    push 2
    add eax, ebx
    push eax
    push 1
L12:
    mov ecx, esi
    call sub_100C9D0C
    cmp eax, edi
    jl L17
L13:
    add dword ptr [ebp - 8], 2
    add dword ptr [ebp - 4], 2
    add dword ptr [ebp - 12], 2
L14:
    mov eax, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [eax + 12]
    cmp dword ptr [ebp - 4], ecx
    mov dword ptr [ebp - 24], ecx
    jb L4
L15:
    inc dword ptr [ebp - 16]
    cmp dword ptr [ebp - 16], 2
    jb L3
L16:
    xor eax, eax
L17:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100b6d0e ENDP
END
