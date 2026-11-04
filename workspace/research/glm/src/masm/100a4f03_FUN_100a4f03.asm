.686
.MODEL FLAT, C
EXTRN sub_10086356:PROC
EXTRN sub_100863E8:PROC
EXTRN sub_10086F8F:PROC
EXTRN sub_1008701D:PROC
EXTRN sub_1008B1F7:PROC
EXTRN sub_1008D6D9:PROC
EXTRN sub_100BA8B7:PROC
EXTRN sub_100BA9F0:PROC
EXTRN sub_100BAD57:PROC
EXTRN sub_100BB26F:PROC
EXTRN sub_100BB2E5:PROC
EXTRN sub_100C2FFF:PROC
EXTRN sub_100C79B8:PROC
.CODE
FUN_100a4f03 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    push esi
    mov esi, ecx
    xor ebx, ebx
    cmp dword ptr [esi + 92], ebx
    push edi
    je L2
    xor edi, edi
    cmp dword ptr [esi + 12], ebx
    mov dword ptr [esi + 0000000FCh], ebx
    jbe L2
L0:
    mov eax, dword ptr [esi + 0000000FCh]
    mov ecx, dword ptr [esi + 24]
    mov eax, dword ptr [ecx + eax*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 020800000h
    jne L1
    mov ecx, esi
    call sub_100BAD57
    cmp eax, ebx
    jl L15
    xor ecx, ecx
    cmp eax, ebx
    sete cl
    or edi, ecx
L1:
    inc dword ptr [esi + 0000000FCh]
    mov eax, dword ptr [esi + 0000000FCh]
    cmp eax, dword ptr [esi + 12]
    jb L0
    cmp edi, ebx
    je L2
    mov ecx, esi
    call sub_100BA8B7
L2:
    cmp dword ptr [esi + 48], ebx
    je L12
    mov dword ptr [ebp - 8], ebx
L3:
    cmp dword ptr [ebp - 8], 16
    jae L7
    mov ebx, dword ptr [esi + 12]
    xor edi, edi
    test ebx, ebx
    mov dword ptr [ebp - 4], 1
    jbe L6
L4:
    mov eax, dword ptr [esi + 24]
    mov eax, dword ptr [eax + edi*4]
    mov ecx, esi
    mov dword ptr [esi + 000000100h], eax
    call sub_100BB26F
    test eax, eax
    jl L15
    jne L5
    and dword ptr [ebp - 4], 0
L5:
    push dword ptr [esi + 000000100h]
    mov ecx, esi
    call sub_10086356
    test eax, eax
    jl L15
    mov eax, dword ptr [esi + 000000100h]
    and dword ptr [eax], 0
    inc edi
    cmp edi, ebx
    jb L4
L6:
    mov ecx, esi
    call sub_10086F8F
    test eax, eax
    jl L15
    inc dword ptr [ebp - 8]
    cmp dword ptr [ebp - 4], 0
    je L3
    cmp dword ptr [ebp - 8], 16
    jb L11
L7:
    mov ebx, dword ptr [esi + 12]
    xor edi, edi
    test ebx, ebx
    mov dword ptr [ebp - 4], 1
    jbe L10
L8:
    mov eax, dword ptr [esi + 24]
    mov eax, dword ptr [eax + edi*4]
    mov ecx, esi
    mov dword ptr [esi + 000000100h], eax
    call sub_100BB2E5
    test eax, eax
    jl L15
    jne L9
    mov eax, dword ptr [esi + 000000100h]
    push 010115C5Ch
    push 0000011C9h
    push dword ptr [eax + 60]
    push esi
    call sub_1008B1F7
    add esp, 16
    and dword ptr [ebp - 4], 0
L9:
    push dword ptr [esi + 000000100h]
    mov ecx, esi
    call sub_100863E8
    test eax, eax
    jl L15
    mov eax, dword ptr [esi + 000000100h]
    and dword ptr [eax], 0
    inc edi
    cmp edi, ebx
    jb L8
L10:
    mov ecx, esi
    call sub_1008701D
    test eax, eax
    jl L15
    cmp dword ptr [ebp - 4], 0
    jne L11
    mov eax, 080004005h
    jmp L15
L11:
    xor ebx, ebx
L12:
    test byte ptr [esi + 112], 64
    jne L13
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x98]
    cmp eax, ebx
    jl L15
L13:
    cmp dword ptr [esi + 96], ebx
    je L14
    mov ecx, esi
    call sub_100C79B8
    cmp eax, ebx
    jl L15
    mov ecx, esi
    call sub_100BA9F0
    mov ecx, esi
    call sub_1008D6D9
    cmp eax, ebx
    jl L15
    mov ecx, esi
    call sub_100C2FFF
    cmp eax, ebx
    jl L15
L14:
    xor eax, eax
L15:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100a4f03 ENDP
END
